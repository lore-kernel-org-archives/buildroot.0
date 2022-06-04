Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC51C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 07:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 147A941508;
	Sat,  4 Jun 2022 07:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sk9FFzgris6m; Sat,  4 Jun 2022 07:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38EBC409FA;
	Sat,  4 Jun 2022 07:56:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4C2C1BF429
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 07:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 938D1409FA
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 07:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mALnUGsc4Gru for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 07:56:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 024C440939
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 07:56:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 622CB5FF10;
 Sat,  4 Jun 2022 09:56:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654329375;
 bh=gNtIW3fDvfCiMMD5BPoBZG/zTlW6EJnA8D1paxn8REw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DBh0FcSyc6qW6L1AkQYG+P8111aCKTM6zhH15KTsc23HbJD8QaeuQfVxiPW3uzYJ6
 f5NS6rFTQxUbtQZMdbHYx/pNNnzobpfWJ0n4IkvxU08cnZo9xfHCrEPAT5c5pUl0X9
 kkewelOToxPFfFwusA6lJwaMHz7DA8tw0RQcYP1EgkEOIn3P75zbNjddAE5EyEYguj
 Ff4kYGmVKFIn0gV/p1eBX2hoGtz78To18mVu+73s1yPZildir88bi8QJ2kquY1ZFqi
 VpQuGHSYuRboSGQj94lCAlckuYvmJC5QOq5sZNDh3BWXXuVsHcVesn4/eCaYaCOZ/p
 7Q5OyHCwpsYhg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 09:56:13 +0200
Date: Sat, 4 Jun 2022 09:56:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: ckhardin@gmail.com
Message-ID: <20220604075613.GA427639@scaer>
References: <20220604032345.89818-1-ckhardin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220604032345.89818-1-ckhardin@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts: handle paths with
 regex characters in per-package
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

Charles, All,

On 2022-06-03 20:23 -0700, ckhardin@gmail.com spake thusly:
> From: Charles Hardin <ckhardin@gmail.com>
> 
> Some constraints on a setup ended up with a plus sign in the path
> for historical reasons and would then fail to match on the comparison
> of the host/lib dir match. So, the =~ for bash can be augmented
> with a double quote expansion to preserve the literal value of
> the characters in the variable.
> 
> Example Path: /home/vagrant/test+buildroot/per-package
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/check-host-rpath | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index 9a3866982b..b27cb883f3 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -98,7 +98,7 @@ check_elf_has_rpath() {
>  	    # PER_PACKAGE_DIR and therefore ${perpackagedir} points to
>  	    # a non-existent directory, and this check will always be
>  	    # false.
> -            [[ ${dir} =~ ${perpackagedir}/[^/]+/host/lib ]] && return 0
> +            [[ ${dir} =~ "${perpackagedir}/"[^/]+/host/lib ]] && return 0
>          done
>      done < <( readelf -d "${file}"                                              \
>                |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
> -- 
> 2.30.1 (Apple Git-130)
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
