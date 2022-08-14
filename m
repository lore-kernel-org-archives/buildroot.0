Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F068C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 20:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABC7B81985;
	Sun, 14 Aug 2022 20:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABC7B81985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzRP1rul3beL; Sun, 14 Aug 2022 20:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D244E8174F;
	Sun, 14 Aug 2022 20:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D244E8174F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 262271BF3BD
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B15D410B3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 20:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B15D410B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iguPphomeP0G for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 20:43:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7766B410AC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7766B410AC
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 20:43:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6DD8A60130;
 Sun, 14 Aug 2022 22:43:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 22:43:26 +0200
Date: Sun, 14 Aug 2022 22:43:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814204326.GN2854108@scaer>
References: <20220814202057.3698507-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814202057.3698507-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660509808;
 bh=JIne23p/RV66eyQQKwBFw6SJVBf2cOpbGo9CM3fg06Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ObXelpi8Y4r6o2SBHiIGAdude5IQrYVKyjgAvV+FHBHNIVlR/aL8h5dRdU26k4Ho0
 KHV0WbpEqOezqKQmxGwdoFvEJHMxVemp3bWmEmdWqcSJfDpsapq5M7QrwbHt6NOAIv
 WylurCXv4muCxQ9e+tf1i+sCS1V43O1BZzM1jYevyFHQY59atnmy+tAfH/efbqhWPf
 uJMl/rgCVk615FcYEh4uM2cQ+FNCfRYLQJESMkvCvUwxlo48uTwDzXeGytKwysecEJ
 DXX3D8QzhcvIAca32up9Fbbzmz+AWXjawKWLzB0bxwUJFgZBFjm2IaasmwN/ByOXtz
 LP0JHLvfLP11g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ObXelpi8
Subject: Re: [Buildroot] [PATCH 1/1] package/syslinux: disable documentation
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

Fabrice, All,

On 2022-08-14 22:20 +0200, Fabrice Fontaine spake thusly:
> Disable documentation to avoid the following build failure if a non
> working asciidoc or a2x is found on the system:
> 
> asciidoc -o html/syslinux.html /nvmedata/autobuild/instance-3/output-1/build/syslinux-6.03/txt/syslinux.txt
> /nvmedata/autobuild/instance-3/output-1/per-package/syslinux/host/bin/python3: No module named asciidoc
> 
> Setting {ASCIIDOC,A2X_XML}_OK to a value different of 0 will disable
> html, man, xhtml and text documentation
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/47f876ccb56831cc1bb9e6c2f7dbce423581a0dd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/syslinux/syslinux.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index 2df415fcfd..cc52c49aee 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -58,6 +58,8 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
>  # be used.
>  define SYSLINUX_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE1) \
> +		ASCIIDOC_OK=-1 \
> +		A2X_XML_OK=-1 \
>  		CC="$(TARGET_CC)" \
>  		LD="$(TARGET_LD)" \
>  		OBJCOPY="$(TARGET_OBJCOPY)" \
> -- 
> 2.35.1
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
