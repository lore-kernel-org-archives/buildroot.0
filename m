Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1A7CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DA0C844A2;
	Mon,  4 May 2026 14:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awu12O4DLV5K; Mon,  4 May 2026 14:46:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C2A845CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906014;
	bh=oOEZenCDFvo3+gzYdn8O5KkrgYbe2rPWl9wVZ0t1EN0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jbOJcP3OORiaoZKcmkUIv/vWGIHPaAgM8j7p1xI5PrsTpENnShpBsMPQohj46qhbF
	 G5xjJGLw57gwjcIyIkvq52ICvFrM9GuEsZ9bT6wBIv5q5WvwHFy/91wRltD4Q+CzGD
	 jffMFw7wyc94S9BB1ZiRcVx1L96/RyJEjT/j80cSnuOe522jhVRaasmnfGIEfzEf5J
	 2iXjqDMG/k2zeAtU8060Y071iBWT/BeAtb8AzwEemlfFLbagGCePioZ5iSsBzy9iu5
	 37PACVh6klK0yPCUABMEr+th/yU6N4wyIw8ydd0FZKc1TnSrtOUV8fMUcARMeW5sji
	 33Y37al89VhIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78C2A845CE;
	Mon,  4 May 2026 14:46:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B73A325D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F46D6136F
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhpd-gjm9sQJ for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC756613FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC756613FA
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9015C8428D; Mon,  4 May 2026 14:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:01:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1d91a7b38e3263fc2cc6581e87e637d31cc3c776
X-Git-Newrev: ea54a338751d967061287e315cad6124bd6acd58
X-Patchwork-Hint: ignore
Message-Id: <20260504144643.9015C8428D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/webkitgtk:
 security bump to 2.52.3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea54a338751d967061287e315cad6124bd6acd58
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This bumps WebKitGTK to the 2.52 stable series. A welcome change
is the addition of the USE_GSTREAMER CMake option that can be used
as a blanket option to toggle all multimedia support, which matches
exactly the intention behind BR2_PACKAGE_WEBKITGTK_MULTIMEDIA.

Includes fixes (among others) for CVE-2026-20643, CVE-2026-20664,
CVE-2026-20665, CVE-2026-20691, CVE-2026-28857, CVE-2026-28859,
CVE-2026-28861, CVE-2026-28871, CVE-2025-43457, CVE-2025-46299,
CVE-2026-20608, CVE-2026-20635, CVE-2026-20636, CVE-2026-20644,
CVE-2026-20652, and CVE-2026-20676.

Highlights of the 2.52 series:
- https://webkitgtk.org/2026/03/18/webkitgtk-2.52-highlights.html

Release notes:
- https://webkitgtk.org/2026/04/16/webkitgtk2.52.3-released.html
- https://webkitgtk.org/2026/04/13/webkitgtk2.52.2-released.html
- https://webkitgtk.org/2026/03/27/webkitgtk2.52.1-released.html
- https://webkitgtk.org/2026/03/18/webkitgtk2.52.0-released.html
- https://webkitgtk.org/2026/03/12/webkitgtk2.50.6-released.html

Security advisories:
- https://webkitgtk.org/security/WSA-2026-0002.html
- https://webkitgtk.org/security/WSA-2026-0001.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6b1de564d07ee79c7fce9674801481c33627e03b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/webkitgtk/webkitgtk.hash |  6 +++---
 package/webkitgtk/webkitgtk.mk   | 12 +++---------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 77bdc5485b..03b8d0a9be 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.50.5.tar.xz.sums
-sha1  e93f7efa9fbc7304cc159c35d8e76d7febab2515  webkitgtk-2.50.5.tar.xz
-sha256  8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f  webkitgtk-2.50.5.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.52.3.tar.xz.sums
+sha1  17f9b127618040a5f3fcbb70e37ea16ab6d69b0b  webkitgtk-2.52.3.tar.xz
+sha256  5b3e0d174e63dcc28848b1194e0e7448d5948c3c2427ecd931c2c5be5261aebb  webkitgtk-2.52.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 26c70ae6c8..54e769d589 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.50.5
+WEBKITGTK_VERSION = 2.52.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -56,16 +56,10 @@ WEBKITGTK_CONF_OPTS += -DENABLE_BUBBLEWRAP_SANDBOX=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_VIDEO=ON \
-	-DENABLE_WEB_AUDIO=ON \
-	-DENABLE_WEB_CODECS=ON
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER=ON
 WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-bad gst1-plugins-base
 else
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_VIDEO=OFF \
-	-DENABLE_WEB_AUDIO=OFF \
-	-DENABLE_WEB_CODECS=OFF
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_WEBDRIVER),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
