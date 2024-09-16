Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A2DC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 14:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBC5E40B88;
	Mon, 16 Sep 2024 14:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZcv8gH74VTg; Mon, 16 Sep 2024 14:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9879240B93
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9879240B93;
	Mon, 16 Sep 2024 14:32:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D9C3F1BF3B0
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 14:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4F6740105
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 14:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uRer9m_K0xEN for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 14:32:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 199714010E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 199714010E
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 199714010E
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 14:32:31 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id BB8BF35374D3; Mon, 16 Sep 2024 16:32:28 +0200 (CEST)
Date: Mon, 16 Sep 2024 16:32:28 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZuhBfPCMmYJqIZBQ@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726497148; bh=jVni05tMFM6WvraiKPQ1r9TnBO8C/BR0IJXh9PFUWy4=;
 h=Date:From:To:Subject:From;
 b=b5QersWPs/SdO3C872CyposTjXTImYPeqv+ZyqVg+zXcELwvtcVjnE71rou5q4aLT
 B4xoN0j0IqYXHD1bf+oiwFXMdGMwAEX0YgfwcPsHeAvoX2lsXFPIOEkT4fYcrqCpwb
 7tf0rJ3tQm2WoSwrOW3igPnjfbm/3/N9NNMnNRUwR5ztnWw1uiw08n8+IA5wRnyQ60
 a1ta9CEKdqdlr5kAicvSpWOTy7awBEmmXM8FIqO/cpQXxfvTZupBbZNs5TeXMnaFpO
 FUQ9sbk1bJuLakJ+yVxCyI2141qO5SLMG5Sp+ypkfOHE5lki95g5CQJCsjOb68WCAQ
 +KDvIWdlmEK6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=b5QersWP
Subject: [Buildroot] [PATCH] package/evilwm: add missing dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add missing dependency to xlib_libXrandr.

Fixes:

 https://autobuild.buildroot.org/results/9928181557c7f99b7c74065d981f005cbd95145d/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/evilwm/Config.in | 1 +
 package/evilwm/evilwm.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/evilwm/Config.in b/package/evilwm/Config.in
index 86cc17dc76..0f0513df0d 100644
--- a/package/evilwm/Config.in
+++ b/package/evilwm/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_EVILWM
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXRANDR
 	help
 	  A minimalist window manager for the X Window System
 
diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
index b013305c44..78b531095b 100644
--- a/package/evilwm/evilwm.mk
+++ b/package/evilwm/evilwm.mk
@@ -9,7 +9,7 @@ EVILWM_SITE = https://www.6809.org.uk/evilwm/dl
 EVILWM_LICENSE = evilwm license
 EVILWM_LICENSE_FILES = README
 
-EVILWM_DEPENDENCIES = xlib_libX11
+EVILWM_DEPENDENCIES = xlib_libX11 xlib_libXrandr
 
 define EVILWM_INSTALL_XSESSION_FILE
 	$(INSTALL) -m 0755 -D package/evilwm/xsession \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
