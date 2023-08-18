Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DCFC001DE
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 05:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E64FA41E4D;
	Fri, 18 Aug 2023 05:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E64FA41E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFdlor8vIDyi; Fri, 18 Aug 2023 05:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE2F041E50;
	Fri, 18 Aug 2023 05:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE2F041E50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08AE31BF38E
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 05:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D556B41E5B
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 05:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D556B41E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9WecliXSuS0 for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 05:47:43 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D27D41E4D
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 05:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D27D41E4D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:1576:5fbf:4d05:9159])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ECB14B0058E;
 Fri, 18 Aug 2023 07:47:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Aug 2023 07:47:37 +0200
Date: Fri, 18 Aug 2023 07:47:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <20230818054737.GD1340200@scaer>
References: <20230818003124.3770152-1-mmayer@broadcom.com>
 <20230818003124.3770152-3-mmayer@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818003124.3770152-3-mmayer@broadcom.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692337660;
 bh=IvSq+EGMg7s1Rhsi4na5xRD4hDTcfcPzltOvoDM50hU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WkX+ijo7NtRISHzsUkX1lwSNDkv/eLDBuPeozvDNn/fj/xTtZUgwHwE4jWjMyaPra
 Ppy/NMSAXfyTVYBxwC5ysJ3VPu1E6m2OpIDhzSojFyyd0kku3xHlThsrVxvJ9Rv2hZ
 XQwwE9X/0UnTPtcopAuIJfILWsDTpH87QUl0f1l1TkmkKjzbL6pgKTLg+faXDo1MMm
 no8vNVlMLuM460CBu1qR4VgU8NjpUkZm9o+OCASFjHFOj6f9TNW87xub1McnP47bdX
 nUNyfPLZC63CPW7a59VvtkwRAlVg6YGb+VmYys0vJu9HjYfwP26kJQuo0vSG/aPH4+
 4MkIoViK8jKmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WkX+ijo7
Subject: Re: [Buildroot] [PATCH 2/2] Revert "package/util-linux: add missing
 autoreconf"
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
Cc: Buildroot mailing list <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Markus, All,

On 2023-08-17 17:31 -0700, Markus Mayer via buildroot spake thusly:
> This reverts commit f3fab0defe8fa9e1d99e4a89ddb29776e3bdd7fd.
> 
> With 0001-libmount-ifdef-statx-call.patch no longer required (due to the
> release of util-linux 2.39.2), we no longer need to run autoreconf.

The AUTORECONF=YES should have been dropped in the previous patch.

Indeed, the bump and associated removal of the patch is what means
autoreconf is not needed; it is all a semantically atomice change: bump,
drop patch, remove autoreconf.

Besides, a git-revert semantically means "the reverted commit was wrong
even at the time it was introduced". But here, using autoreconf was
correct when we introduced it, so it should not be "git-reverted".

No need to respin, the two commits can be squashed when applying.

Regards,
Yann E. MORIN.

> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/util-linux/util-linux.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 73eda5c17134..4a40d5afec85 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -30,10 +30,6 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
>  	Documentation/licenses/COPYING.LGPL-2.1-or-later
>  
>  UTIL_LINUX_CPE_ID_VENDOR = kernel
> -
> -# 0001-libmount-ifdef-statx-call.patch
> -UTIL_LINUX_AUTORECONF = YES
> -
>  UTIL_LINUX_INSTALL_STAGING = YES
>  UTIL_LINUX_DEPENDENCIES = \
>  	host-pkgconf \
> -- 
> 2.40.1
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
