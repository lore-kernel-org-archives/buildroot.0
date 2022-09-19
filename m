Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318FAECAAD3
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 19:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB8FD4170E;
	Mon, 19 Sep 2022 19:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB8FD4170E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8aqIeEVSctPQ; Mon, 19 Sep 2022 19:41:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD0541713;
	Mon, 19 Sep 2022 19:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFD0541713
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40D8E1BF59A
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C82740125
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C82740125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMVSt7ZO86vJ for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 19:41:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53DC040124
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 19:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53DC040124
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40D0E85A8B; Mon, 19 Sep 2022 19:41:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 21:40:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48810c229695ef3eae02dab5b5a8d37d5eae41c2
X-Git-Newrev: ce4b87be82d13d3a042b4e78fe5835f3c8ddc29d
X-Patchwork-Hint: ignore
Message-Id: <20220919194104.40D0E85A8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: bump to version 2.38.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce4b87be82d13d3a042b4e78fe5835f3c8ddc29d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to a new major release which brings in improvements and a few
new features. Release notes:

  https://webkitgtk.org/2022/09/16/webkitgtk2.38.0-released.html

This release also includes security fixes for CVE-2022-32886,
CVE-2022-32891, and CVE-2022-32912. Accompanying security advisory:

  https://webkitgtk.org/security/WSA-2022-0009.html

The CMake option to build the documentation has been renamed from
ENABLE_GTK_DOC to ENABLE_DOCUMENTATION, therefore update the build
recipe accordingly. Option USE_LIBNOTIFY is no longer available, as
WebKit now uses the notification portal D-Bus API directly without
relying on libnotify. Lastly, version 2.38.0 introduces a new WebRTC
implementation based on GstWebRTC which is left disabled for now to
keep the existing status quo (WebRTC not available), and adding an
option to enable it can be done in a follow-up patch.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 7c6d7d65b5..c2512be9c6 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.36.7.tar.xz.sums
-md5  466351cf35e4f742590919380b5dee93  webkitgtk-2.36.7.tar.xz
-sha1  36078148b6e0ef002f0279b25b1caf173f851ac8  webkitgtk-2.36.7.tar.xz
-sha256  0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743  webkitgtk-2.36.7.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.38.0.tar.xz.sums
+md5  a69cd8fc05f7299458b4faf1bc99b875  webkitgtk-2.38.0.tar.xz
+sha1  6dcb65b8dc56c52f086bfeecfca7920e9cc78348  webkitgtk-2.38.0.tar.xz
+sha256  f9ce6375a3b6e1329b0b609f46921e2627dc7ad6224b37b967ab2ea643bc0fbd  webkitgtk-2.38.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 014d92bb41..336744954e 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.36.7
+WEBKITGTK_VERSION = 2.38.0
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -18,12 +18,12 @@ WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf \
 	libtasn1 libxml2 libxslt openjpeg sqlite webp woff2
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
+	-DENABLE_DOCUMENTATION=OFF \
 	-DENABLE_GEOLOCATION=OFF \
-	-DENABLE_GTKDOC=OFF \
 	-DENABLE_MINIBROWSER=ON \
 	-DENABLE_SPELLCHECK=ON \
+	-DENABLE_WEB_RTC=OFF \
 	-DPORT=GTK \
-	-DUSE_LIBNOTIFY=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_OPENJPEG=ON \
 	-DUSE_SOUP2=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
