Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC44C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:47:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D2F60E95
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 07:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62D2F60E95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CA80606D5;
	Sat, 24 Jul 2021 07:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6DWsktNRH3s; Sat, 24 Jul 2021 07:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B1BC606D0;
	Sat, 24 Jul 2021 07:47:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32F4A1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 222DC606D0
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 07:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMlr1O9Sunj6 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 07:47:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70B84606BB
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 07:47:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 423C3887D5; Sat, 24 Jul 2021 07:12:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 09:46:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8eea07df198e1eebc2883a24292825a491c0a8c8
X-Git-Newrev: a87d99af2f88eb2755959163727584f673483748
X-Patchwork-Hint: ignore
Message-Id: <20210724071252.423C3887D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.18.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a87d99af2f88eb2755959163727584f673483748
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-June/041849.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 038859289a..de8e94f9fa 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-May/041834.html
-sha256  0d010e0bf601b5d3a06b3c4d77d67751cf554f3e6448e57aa046ea9ee8f818ac  libinput-1.17.3.tar.xz
-sha512  3d1ab4362ede886996795d700a938d20e04cd922e8f9598fe9346f9f93e149119526fb324a096787b4b8a47bf3e5613130bcd874f10df86761031710d2acc792  libinput-1.17.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-June/041849.html
+sha256  18c6a286583268d39841348e561fbb4713bde0c643b360f5d8a3f27800afdb9a  libinput-1.18.0.tar.xz
+sha512  9a834f075d7a1f892416bb6b241eb052f749d3aa883c4b39c0f1c9616c115d6b9a541b587508646fddaf0d3fe57af92fe4629b522d1d51196499e7b523e0aa90  libinput-1.18.0.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 8ce60c8639..32b822edb7 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.17.3
+LIBINPUT_VERSION = 1.18.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
