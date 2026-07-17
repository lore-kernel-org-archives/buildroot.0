Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDF0C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 16:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5453740B0F;
	Fri, 17 Jul 2026 16:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnybYTfuUPRJ; Fri, 17 Jul 2026 16:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3321F40AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784307334;
	bh=V09s9DqZpQDN1rVXTslvMf8B0APOnQ22VOM2ZCLZRs4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VkX0aeytfJH//mulawenPWA6T0p2iihwlRM/8yVYfX7n31OgK451SurW2b7gfPjg7
	 yPtNiHUM7+vl5h0ZOJ4UcLamz2mT1xyjm7/k5+E35FgQfV7ekHgpWHq4TYIif3Hu6m
	 ZlEB0JAVO8m7iiLP/QizW8KsE8T+p+QCkzFuNCPUUMLGWv2QYkT0vZZamQY04NDcOc
	 UgVouMqPtv7Rihpuv/MAg+wdtBhbjwgUvm174H1UL1ZrAKAZouIeCpwKczbz1mL4Zi
	 tHoZgMqCZIPWiGmYbC1DEztmMsvnp3tuEaX1x0Hjf9xV/LMshK4H/JlRHDTzztNnNo
	 pVmbr6tzl4GKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3321F40AFD;
	Fri, 17 Jul 2026 16:55:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3EE3320
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A933181131
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QlgdCA6Ot6E for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 16:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD18810FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DD18810FA
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 16:55:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55E3588E54; Fri, 17 Jul 2026 16:54:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 18:54:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26811cb110217797fb44862aa401d68e73f9b1ae
X-Git-Newrev: 9de868be590cf2dae40884daec3d081fb5395f36
X-Patchwork-Hint: ignore
Message-Id: <20260717165455.55E3588E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9de868be590cf2dae40884daec3d081fb5395f36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-July/000858.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 324d4e1708..b36f834270 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.4
+MESA3D_HEADERS_VERSION = 26.1.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 6e77b17b0d..73f900c907 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000857.html
-sha256  072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6  mesa-26.1.4.tar.xz
-sha512  39d15574e876005fd1a483d1cb3c801b08297ec73820a89cbf368d0f2a922cc770d0e623e99acc66b71791332cdadc6cc3095f059f713b09128921ff2d0197a8  mesa-26.1.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000858.html
+sha256  79e421c7ce18cd9e790b8375920325779f10798630bf30e0b22f1a21c8617122  mesa-26.1.5.tar.xz
+sha512  8b1714e0fe63d3077c0d761245680724537a94db65e17dedb7124c7c861f070a13493a060695e81b2ca9b6889007b52c7b5788dace8fe5d8e2e1ed67efdbbf07  mesa-26.1.5.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8e6c2ee5b8..43899cd084 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.4
+MESA3D_VERSION = 26.1.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
