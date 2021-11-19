Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C276C433FE
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:30:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F833611C7
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F833611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50BE241C19;
	Fri, 19 Nov 2021 16:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hxzeruvrdTCd; Fri, 19 Nov 2021 16:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8010541C13;
	Fri, 19 Nov 2021 16:30:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0ADA61BF21A
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9ED140963
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BS8CTgv2qHz0 for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 16:30:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B90C4400F3
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 16:30:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8ce3:604:2d0f:2718])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 957692003D0;
 Fri, 19 Nov 2021 17:30:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1637339405;
 bh=hF5m0PS9jdPI6XRC94Gn5x7H+iZ/yYuPyPKTbwqeBqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bEL4NvOi2JgMVH1nIcriGJoCg0rEe8rSWC8BDFZRgmfPcWZP0zexlQGQwxQvKW+NG
 KTJ7tU0eP0nJpVt9cUnM079hTg8OkPPoYprhmW9EmEh9ZeE5ThlnngpOnslWbyREZ9
 pckl6XkA5ofDPK5clbgUIddHyXuJryAQppvzDVPZJBa/q+bfUpOWJmb9V3LL86+iGg
 2TPkkJ52M6665b+Sbaxhubaev4Of0x2U/n2lSrHh8i1pkliLdC0k212w1cI4SYBqoS
 5GRmMeV/RQskg4ho7trXyl/s86WJJtGB6gxQJvkGH7J3cMzBkE28p1NC3sPZx8bAUt
 G+JXqwRcTfnfg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 19 Nov 2021 17:30:01 +0100
Date: Fri, 19 Nov 2021 17:30:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20211119163001.GP247986@scaer>
References: <20211117220635.114549-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211117220635.114549-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] linux: add dependency on host-libyaml
 for v5.16+
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Paul, All,

On 2021-11-17 22:06 +0000, Paul Cercueil spake thusly:
> Starting with 5.16, host-libyaml seems to be required to build
> Device Tree blobs.

So, as we've discussed on IRC, this is far from sufficient to make
linux-5.16+ build.

o first, this is about an as-yet unreleased kernel version, so we are
not in a hurry to fix this before our 2021.11 release.

Second, as you reported, it also needs dtschema, which is not packaged
in Buildroot yet, nd not even packaged in Debian.

dtschema is written in python3, so this means that the Linux kernel now
gained a build dependency on host-python3 and a bunch of other host
python modules:

    dtschema
    |-> ruamel.yaml >= 0.15.69
    |-> jsonschema >= 4.1.2
    |   |-> attrs >= 17.4.0
    |   `-> pyrsistent >= 0.14.0, !=0.17.0, !=0.17.1, !=0.17.2
    `-> rfc3987
        `-> regex (optional, but sine we already have it)

I've tried adding them with scanpypi, but it exploded on me. I spent way
too much time trying to understand the issue, time that would have been
better spent adding/bumping those packages. But meh...

Sigh...

Regards,
Yann E. MORIN.

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  linux/linux.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 61fdc0c76c..bbe19f494c 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -375,6 +375,9 @@ ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
>  # reproducibility, we use our owns rather than the host ones.
>  LINUX_DEPENDENCIES += host-bison host-flex
>  
> +# Starting with 5.16, host-libyaml is required to build Device Tree blobs.
> +LINUX_DEPENDENCIES += host-libyaml
> +
>  ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
>  define LINUX_BUILD_DTB
>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_DTBS)
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
