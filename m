Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B71D10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 334EC60DB7;
	Sat, 26 Oct 2024 15:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZOKpka52-By; Sat, 26 Oct 2024 15:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3814B60DC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3814B60DC6;
	Sat, 26 Oct 2024 15:20:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 921E25C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72FBC40FA9
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZfVnvaor5sN for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E01F40FA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E01F40FA7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60F9883CE6; Sat, 26 Oct 2024 15:20:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:53:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b89c72679e07981ca3fb692e3d8150d731ee854
X-Git-Newrev: 61a34ff71590b09de3854667d6e6312c9444307e
X-Patchwork-Hint: ignore
Message-Id: <20241026152024.60F9883CE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/espflash: bump v3.1.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=61a34ff71590b09de3854667d6e6312c9444307e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following error:

error[E0282]: type annotations needed for `Box<_>`

The issue came from the `time` library depedency of espflash
(see https://github.com/time-rs/time/issues/693).
The `time` library has been bumped in the following commit
https://github.com/esp-rs/espflash/commit/233490736646ca7bc29463a98df98d7ccf53439d

Fixes:
  - https://autobuild.buildroot.org/results/321/321598baef543b84ce82c09a88e51ad745a15dfd/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/espflash/espflash.hash | 2 +-
 package/espflash/espflash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index ebe24ef51f..0b1e160a47 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8e5da5e90d03135a1b2af6c0b551e4f2504ad64e659b0e88e8a4ecd98cc6a6b6  espflash-3.1.0-cargo2.tar.gz
+sha256  f91a3e33e874bac0d7687d87c3cd692a54325c0dceaf35c983bd3d94519dee25  espflash-3.1.1-cargo2.tar.gz
 sha256  0886cf791a43c02d71c105b4835b53293704ec407a72f84a87f73e20cb2d3251  LICENSE-APACHE
 sha256  a75018ab59a13738ed2024a0090ae8f91b7693ae84568aa0e52c3dff99e6748d  LICENSE-MIT
diff --git a/package/espflash/espflash.mk b/package/espflash/espflash.mk
index ad2294e1bf..bcb343fc58 100644
--- a/package/espflash/espflash.mk
+++ b/package/espflash/espflash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESPFLASH_VERSION = 3.1.0
+ESPFLASH_VERSION = 3.1.1
 ESPFLASH_SITE = $(call github,esp-rs,espflash,v$(ESPFLASH_VERSION))
 ESPFLASH_SUBDIR = espflash
 ESPFLASH_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
