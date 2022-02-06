Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D9BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 16:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E26B8140F;
	Sun,  6 Feb 2022 16:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMyxFxWCv1-c; Sun,  6 Feb 2022 16:25:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9342F813E0;
	Sun,  6 Feb 2022 16:25:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 774C31BF38C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 16:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 624FB60B00
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 16:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HIX0Y_EgPaHU for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 16:25:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B86F60597
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 16:25:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9E8FC82931; Sun,  6 Feb 2022 16:17:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 16:48:16 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e46015c705e18097827e59cfc6fdee8e3dfccd92
X-Git-Newrev: 1dd480525f763cbcd7a50960d99cff89a0b0d5ea
X-Patchwork-Hint: ignore
Message-Id: <20220206161747.9E8FC82931@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/connman: security
 bump to version 1.41
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

commit: https://git.buildroot.net/buildroot/commit/?id=1dd480525f763cbcd7a50960d99cff89a0b0d5ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issues:

- CVE-2022-23096: An issue was discovered in the DNS proxy in Connman
  through 1.40.  The TCP server reply implementation lacks a check for the
  presence of sufficient Header Data, leading to an out-of-bounds read.

- CVE-2022-23097: An issue was discovered in the DNS proxy in Connman
  through 1.40.  forward_dns_reply mishandles a strnlen call, leading to an
  out-of-bounds read.

- CVE-2022-23098: An issue was discovered in the DNS proxy in Connman
  through 1.40.  The TCP server reply implementation has an infinite loop if
  no data is received.

For details, see the advisory:
https://www.openwall.com/lists/oss-security/2022/01/25/1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 35a3c018246813597db52ef65b36a295ebdd9285)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 797448337c..6fc5edf29a 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256  1a57ae7ce234aa3a1744aac3be5c2121d98dce999440ef8ab9cc4edfd5edcb12  connman-1.40.tar.xz
+sha256  79fb40f4fdd5530c45aa8e592fb16ba23d3674f3a98cf10b89a6576f198de589  connman-1.41.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 8c66a69882..61851bd2dc 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.40
+CONNMAN_VERSION = 1.41
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
