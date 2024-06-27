Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37563C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 19:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72A6F6063E;
	Thu, 27 Jun 2024 19:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXvz3cM1QVqV; Thu, 27 Jun 2024 19:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A66560720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A66560720;
	Thu, 27 Jun 2024 19:33:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C75251BF3D9
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 19:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4EC46063E
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 19:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXlPnBM00DkK for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 19:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C06F960625
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C06F960625
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C06F960625
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 19:33:41 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sMusE-008G4x-9Y; Thu, 27 Jun 2024 21:33:38 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id da37b57e;
 Thu, 27 Jun 2024 19:33:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 22:33:31 +0300
Message-ID: <20240627193335.4069574-4-aperez@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240208095531.99049-1-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kbMLNiYFSV+t15ao/tugV0XsKNoKT2OUT6qkMnavy+4=; b=e+Jl9Vm/2L/oomthzzGfaLGsK1
 fXim2MF3D/sGYwPcQEePP0lfcGAcpTpvAUX39hNutrAemPyZb2jq6019IRDPLQzv0lmACtqcAkuXo
 v0m0Y37ubC0wlztbqFgpE4TwWZitlBHvbDaRZvx0in27vUClUUyqwpBjzjw8dW05d3Q63dPJsr4mm
 YZEe8/XNLPwUY1o7HT3wtRoLGEfXB2tIMJpPr3iYURGEzOBNB5MvBv5XWNDBaaq0SAOVxkeNxvw9b
 9dnYjhz5nNPVV4LzvtxNccl6pjCwt6i7tVPI/znxgb4oOr46M+foC7huvGutlLApNJH6vajGqjmcA
 nzJVsAFA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=e+Jl9Vm/
Subject: [Buildroot] [PATCH v2 3/4] package/wpewebkit: do not depend on
 wpebackend-fdo
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the wpewebkit package dependency on wpebackend-fdo, as it is not
needed at all during the build. What is needed is a WPE backend at run
time, which may be provided by wpebackend-fdo or wpebackend-rdk. To
reflect this, we make wpewebkit depend on either being selected.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/Config.in    | 9 ++++-----
 package/wpewebkit/wpewebkit.mk | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

---
v1 -> v2:
- Remove openjpeg dependency, which has been dropped in 2.44.x

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index e4b0320e1da..c55b827e2b8 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -24,11 +24,11 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| !BR2_HOST_GCC_AT_LEAST_4_9
 
-comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
+comment "wpewebkit needs an OpenGL ES w/ EGL-capable implementation and an WPE backend"
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
-		|| !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
+	depends on !BR2_PACKAGE_WPEBACKEND_FDO && !BR2_PACKAGE_WPEBACKEND_RDK
 
 config BR2_PACKAGE_WPEWEBKIT
 	bool "wpewebkit"
@@ -41,8 +41,8 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_USE_WCHAR # icu, libsoup3
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WPEBACKEND_FDO || BR2_PACKAGE_WPEBACKEND_RDK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_HARFBUZZ
@@ -58,7 +58,6 @@ config BR2_PACKAGE_WPEWEBKIT
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
-	select BR2_PACKAGE_WPEBACKEND_FDO
 	help
 	  WPE (Web Platform for Embedded) port of the WebKit engine,
 	  to allow embedders to create simple and performant systems
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index ecb3b3e352b..382c2adca10 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -17,7 +17,7 @@ WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
 WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby host-unifdef \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup3 libtasn1 \
-	libpng libxslt wayland-protocols webp wpebackend-fdo
+	libpng libxslt libwpe wayland-protocols webp
 
 WPEWEBKIT_CMAKE_BACKEND = ninja
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
