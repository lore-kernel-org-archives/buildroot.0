Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55C4C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 541C561398;
	Wed, 22 Feb 2023 20:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 541C561398
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mOYsMQeOvwSk; Wed, 22 Feb 2023 20:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8024861395;
	Wed, 22 Feb 2023 20:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8024861395
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 864121BF97C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E3518202C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3518202C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKp4jTD7TyA9 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A442081F9D
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A442081F9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94E61868BE; Wed, 22 Feb 2023 20:58:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 21:58:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25c8c00b98e37186d23ea6515e944060e59cfa8f
X-Git-Newrev: 5893d2d1f19168a12e823d78882d6037b791e276
X-Patchwork-Hint: ignore
Message-Id: <20230222205839.94E61868BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gqrx: bump to version 2.15.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5893d2d1f19168a12e823d78882d6037b791e276
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure raised since bump pf
gnuradio to version 3.10.4.0 in commit
e37c110bead8b7b35cd97915673fa785ccb39f2d:

In file included from /home/buildroot/autobuild/instance-2/output-1/build/gqrx-2.14.4/src/applications/gqrx/receiver.cpp:32:
/home/buildroot/autobuild/instance-2/output-1/build/gqrx-2.14.4/src/applications/gqrx/receiver.h:34:10: fatal error: gnuradio/blocks/wavfile_sink.h: No such file or directory
   34 | #include <gnuradio/blocks/wavfile_sink.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/gqrx-sdr/gqrx/blob/v2.15.9/resources/news.txt

Fixes:
 - http://autobuild.buildroot.org/results/42b5ab2e555063273ea55fd1c09a9be6d8b620e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gqrx/Config.in | 2 ++
 package/gqrx/gqrx.hash | 2 +-
 package/gqrx/gqrx.mk   | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 442b28e546..97f0b7de07 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -34,7 +34,9 @@ config BR2_PACKAGE_GQRX
 	select BR2_PACKAGE_GNURADIO_DIGITAL
 	select BR2_PACKAGE_GNURADIO_FFT
 	select BR2_PACKAGE_GNURADIO_FILTER
+	select BR2_PACKAGE_GNURADIO_NETWORK
 	select BR2_PACKAGE_GR_OSMOSDR
+	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5SVG
diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index 1991dfea82..567ff947f9 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  aec35c77ebde9c71a5f973c509eec3d6aa2f18a6e052b180fcd9029d88273e5b  gqrx-2.14.4.tar.gz
+sha256  4a826b468b2fb38a59cbe1f1b566e62c3114509186a7a25ba27dc92833f3eb44  gqrx-2.15.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index 4d464298ca..d2518213b8 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-GQRX_VERSION = 2.14.4
+GQRX_VERSION = 2.15.9
 GQRX_SITE = $(call github,csete,gqrx,v$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
-GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr qt5base qt5svg
+GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr libsndfile qt5base qt5svg
 
 GQRX_CONF_OPTS = -DLINUX_AUDIO_BACKEND=Gr-audio
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
