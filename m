Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB4FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:54:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A7060F9E
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70A7060F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB8880DA0;
	Sun, 26 Sep 2021 19:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UmyjeB77DnI; Sun, 26 Sep 2021 19:54:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E9A8199D;
	Sun, 26 Sep 2021 19:54:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04E6C1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DBBC40227
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgS19FsW1woV for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A75AD40344
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4A1258D25E; Sun, 26 Sep 2021 19:50:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:29:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e6de6d541b7dcc56d4872600d9ea133800d5f48
X-Git-Newrev: e1d37ab0a7b2b8735e69c070519978d2898d2e79
X-Patchwork-Hint: ignore
Message-Id: <20210926195018.4A1258D25E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump to version
 40f5fddca7f774944a53f58eeaebc4db79c373d8
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1d37ab0a7b2b8735e69c070519978d2898d2e79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix the following build failure raised since commit
c09f126f570355b8ec134724b453300a4811339c thanks to
https://git.linuxtv.org/libcamera.git/commit/?id=c52e8429cce91dadf98378d87015d8f476a44f70:

/tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/libcamera/base/libcamera-base.so.p/message.cpp.o: in function `libcamera::Message::registerMessageType()':
message.cpp:(.text+0x290): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/6e3471df8e9312a1789ca05ae70cc2283bfeec23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 52c584bc16..a7ca27a96b 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  a5ed581416719b914140eda76ca8a4e0e9c944b859f8fb018fc17497278c5ae1  libcamera-e355ca0087cd93ef80f74c61018e9e9228a93313-br1.tar.gz
+sha256  305e6f458d2bf3d4b697ffe33e104b696db6b1492bb5422e2cce1937e58516f1  libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8-br1.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 677da8ac4c..8ab95fb42a 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = e355ca0087cd93ef80f74c61018e9e9228a93313
+LIBCAMERA_VERSION = 40f5fddca7f774944a53f58eeaebc4db79c373d8
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
