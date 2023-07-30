Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B49C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EF9160B99;
	Sun, 30 Jul 2023 10:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EF9160B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqBcRv0uMMGz; Sun, 30 Jul 2023 10:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BFC60644;
	Sun, 30 Jul 2023 10:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74BFC60644
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4167A1BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C5F24014D
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C5F24014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbMMcYl9yw6F for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A09940138
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A09940138
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A23283C07; Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:37:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4f23da67eedc56f285e093b7432b33ba303a71c
X-Git-Newrev: 2737af9cf9b490ffbd2a83d8897428a81a899d2e
X-Patchwork-Hint: ignore
Message-Id: <20230730103918.3A23283C07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ssdp-responder: bump to v2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2737af9cf9b490ffbd2a83d8897428a81a899d2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream ChangeLog, summary:

 - Add support for JSON output with 'ssdpd-scan -j'
 - Dump received data from devices in 'ssdp-scan -l debug'
 - Termios support for disabling '^C' output from 'ssdp-scan'
 - Update copyright years, LICENSE file hash change
 - Source '/etc/default/ssdpd' from systemd unit file
 - Add fallback if '/var/lib/misc' is missing on system
 - Fix truncated UUID when reading from cache file

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ssdp-responder/ssdp-responder.hash | 4 ++--
 package/ssdp-responder/ssdp-responder.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ssdp-responder/ssdp-responder.hash b/package/ssdp-responder/ssdp-responder.hash
index 8b4f3e4e45..7794c66643 100644
--- a/package/ssdp-responder/ssdp-responder.hash
+++ b/package/ssdp-responder/ssdp-responder.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d8888f2ac59febfb3b2473a1402041014052ad4dc1eeb4168c78aeca1692aae3  ssdp-responder-2.0.tar.gz
-sha256  68d6fdc22e337f725fe719bf9ae6d92b1d8d0ca4cff8219b303ab76706670a8d  LICENSE
+sha256  75787cd9c0a88329dd39437eb28a188b54a3a0cab8472968e2713d90076f321f  ssdp-responder-2.1.tar.gz
+sha256  b66025f1e568a8d80264550d7bd7683780ac248f2baa1e85b4da4b15e28d55a7  LICENSE
diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index 20e7219386..ddd87bc599 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSDP_RESPONDER_VERSION = 2.0
+SSDP_RESPONDER_VERSION = 2.1
 SSDP_RESPONDER_SITE = https://github.com/troglobit/ssdp-responder/releases/download/v$(SSDP_RESPONDER_VERSION)
 SSDP_RESPONDER_LICENSE = ISC
 SSDP_RESPONDER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
