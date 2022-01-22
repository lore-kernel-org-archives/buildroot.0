Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C337C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 17:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08A804039D;
	Sat, 22 Jan 2022 17:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPaAP3UWYBiu; Sat, 22 Jan 2022 17:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCCEB401A3;
	Sat, 22 Jan 2022 17:29:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64F2F1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 536F960ADF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gZGAfVMp26mv for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 17:29:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BCCB60AC5
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 17:29:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4E44D829F5; Sat, 22 Jan 2022 17:22:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 17:53:26 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a4a84a9aa989efd98c160c89fa5edc92538a12d0
X-Git-Newrev: ff1cd8a27540f677dcf6106f3958701922fdb40e
X-Patchwork-Hint: ignore
Message-Id: <20220122172227.4E44D829F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/xserver_xorg-server: security bump to version 1.20.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff1cd8a27540f677dcf6106f3958701922fdb40e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following vulnerabilities:

* CVE-2021-4008/ZDI-CAN-14192 SProcRenderCompositeGlyphs out-of-bounds
  access

  The handler for the CompositeGlyphs request of the Render extension does
  not properly validate the request length leading to out of bounds memory
  write.

* CVE-2021-4009/ZDI-CAN 14950 SProcXFixesCreatePointerBarrier out-of-bounds
  access

  The handler for the CreatePointerBarrier request of the XFixes extension
  does not properly validate the request length leading to out of bounds
  memory write.

* CVE-2021-4010/ZDI-CAN-14951 SProcScreenSaverSuspend out-of-bounds access

  The handler for the Suspend request of the Screen Saver extension does not
  properly validate the request length leading to out of bounds memory
  write.

* CVE-2021-4011/ZDI-CAN-14952 SwapCreateRegister out-of-bounds access

  The handlers for the RecordCreateContext and RecordRegisterClients
  requests of the Record extension do not properly validate the request
  length leading to out of bounds memory write.

For details, see the advisory:
https://lists.x.org/archives/xorg-announce/2021-December/003122.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 8eb56ba027..3d4796ef6b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-July/003100.html
-sha256  40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0e453c7f11d354386300  xorg-server-1.20.13.tar.xz
-sha512  4e0b7bd4e070dc52cb2c51c2056feb133de2c0487d359392ed63abba9702910cd2e2983e9415973d8d6e9672eac78be6f39202687fc56610877914ce722554b3  xorg-server-1.20.13.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2021-December/003124.html
+sha256  5cc5b70b9be89443e2594b93656c60bd5e82cd7f01deb4ce4faf81dcf546a16b  xorg-server-1.20.14.tar.xz
+sha512  be3dc32cce7d55d7e38c5f6557027f13f39224c76cc83e5800555d5ce89dbdc3731773a2d186a5b97db9fc8731a2b2dd6e9829af2b01ee2559246d4aef7c4963  xorg-server-1.20.14.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index c326230be0..e891a0ee42 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.20.13
+XSERVER_XORG_SERVER_VERSION = 1.20.14
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
