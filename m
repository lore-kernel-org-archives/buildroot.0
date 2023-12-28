Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF65C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 20:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 559FF41712;
	Thu, 28 Dec 2023 20:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 559FF41712
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id amj5nZSX0tDV; Thu, 28 Dec 2023 20:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8836841703;
	Thu, 28 Dec 2023 20:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8836841703
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA4111BF32B
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F6264058E
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F6264058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i6hSVF6Ni-ji for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 20:33:45 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4622740167
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 20:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4622740167
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 34D56B0055E;
 Thu, 28 Dec 2023 21:33:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Dec 2023 21:33:40 +0100
Date: Thu, 28 Dec 2023 21:33:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZY3bpJDz6Od4Nck_@landeda>
References: <20230824210800.1589677-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824210800.1589677-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703795623;
 bh=hr3apYB4dovSn5s6PzwCecks4jhmvMiQ70tzkG3fTFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O9HnglY8MaImEVHs5suwOxVewxJnUe8nW4XTxMFQQCLneLL3gbd9pg7TNra8CEo8r
 AulJHN7TUbrVPInHoJaZi8/7g2lVFyil0jwna9l0Qn0hGjwQI6a4q7RZF/8PjD55vO
 n0Ao5gmDglxFZlTrOIhrG7xeuBoKRmUfQ/ray9IC3qdxQ+XaEMrEmKIlyTgxk2mDd9
 20leETN8quE/sT7U24nPCMD+CfxeK/+p/l0NCFMA5IAvD/XgfJGXy93EPRk85YpCAI
 EYlIf9tQeqqICkmcZXb0jUrTj001Ub57syOGZa6UvH8afEBh7Ybee1DDrxfHEINkvA
 fEi1kHVLaGTtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O9HnglY8
Subject: Re: [Buildroot] [PATCH] Makefile: remove $(TARGET_DIR)/usr/mkspecs
 in target-finalize
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

Thomas, All,

On 2023-08-24 23:08 +0200, Thomas Petazzoni via buildroot spake thusly:
> qt6base installs things in /usr/mkspecs, but also the soon to be added
> qt6core5compat, and the existing package qwt as well. So let's move
> the removal of /usr/mkspecs in target-finalize, where we already
> remove lots of development-related directories.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Makefile           | 1 +
>  package/qwt/qwt.mk | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index da52a51716..f255b1e443 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -747,6 +747,7 @@ endif
>  	rm -rf $(TARGET_DIR)/usr/info $(TARGET_DIR)/usr/share/info
>  	rm -rf $(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/doc
>  	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
> +	rm -rf $(TARGET_DIR)/usr/mkspecs

As I suggested back in August, without negative feedback, I made that
a target-finalize hook of the qt6base package.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	rmdir $(TARGET_DIR)/usr/share 2>/dev/null || true
>  ifneq ($(BR2_ENABLE_DEBUG):$(BR2_STRIP_strip),y:)
>  	rm -rf $(TARGET_DIR)/lib/debug $(TARGET_DIR)/usr/lib/debug
> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> index 9f0b78655f..f344ca4e3a 100644
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -58,7 +58,6 @@ endef
>  
>  define QWT_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
> -	rm -Rf $(TARGET_DIR)/usr/mkspecs
>  endef
>  
>  $(eval $(qmake-package))
> -- 
> 2.41.0
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
