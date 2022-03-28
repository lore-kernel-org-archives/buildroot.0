Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC1BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 20:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE26940AA5;
	Mon, 28 Mar 2022 20:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEEmsfcOEZGt; Mon, 28 Mar 2022 20:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9575C4026F;
	Mon, 28 Mar 2022 20:00:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4581B1BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DC9D819F6
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zbWCpRvuojM for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 431AB81A30
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 449C385F3F; Mon, 28 Mar 2022 19:48:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 20:54:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97abb7a8d5b595acab2d3d0363f117ba78798ec1
X-Git-Newrev: a5eefab2d4e211adb51d261700b4022e76c60c20
X-Patchwork-Hint: ignore
Message-Id: <20220328194854.449C385F3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jack1: bump to version 0.126
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5eefab2d4e211adb51d261700b4022e76c60c20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to get latest release
- libsndfile and readline are not a dependency since removal of
  example-clients and tools with
  https://github.com/jackaudio/jack1/commit/ca3af4b0d8a8a8fd6c4ae72c24e4df6e18f83af9
- Update indentation in hash file (two spaces)

https://jackaudio.org/news/2022/01/15/jack1-v01260-and-jack2-v1920-releases.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/jack1/jack1.hash |  8 ++++----
 package/jack1/jack1.mk   | 14 +++-----------
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/package/jack1/jack1.hash b/package/jack1/jack1.hash
index d7787ac2ad..d82b9daffd 100644
--- a/package/jack1/jack1.hash
+++ b/package/jack1/jack1.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 3517b5bff82139a76b2b66fe2fd9a3b34b6e594c184f95a988524c575b11d444  jack-audio-connection-kit-0.125.0.tar.gz
-sha256 661fe53a7e3fce790b185e35c60b7ed80d7efdf25fd7df5af6814a9a215a538f  COPYING
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
-sha256 ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING.LGPL
+sha256  7b290e9dc7b9262ac328d41eef80c1053c97013efacbefa30477cb9b2a5445ea  jack1-0.126.0.tar.gz
+sha256  661fe53a7e3fce790b185e35c60b7ed80d7efdf25fd7df5af6814a9a215a538f  COPYING
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
+sha256  ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING.LGPL
diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
index 6dca56001f..4e16d7e96e 100644
--- a/package/jack1/jack1.mk
+++ b/package/jack1/jack1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-JACK1_VERSION = 0.125.0
-JACK1_SOURCE = jack-audio-connection-kit-$(JACK1_VERSION).tar.gz
-JACK1_SITE = http://jackaudio.org/downloads
+JACK1_VERSION = 0.126.0
+JACK1_SITE = \
+	https://github.com/jackaudio/jack1/releases/download/$(JACK1_VERSION)
 JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 JACK1_INSTALL_STAGING = YES
@@ -17,14 +17,6 @@ ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 JACK1_DEPENDENCIES += libsamplerate
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-JACK1_DEPENDENCIES += libsndfile
-endif
-
-ifeq ($(BR2_PACKAGE_READLINE),y)
-JACK1_DEPENDENCIES += readline
-endif
-
 JACK1_CONF_OPTS = --without-html-dir --disable-oss
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
