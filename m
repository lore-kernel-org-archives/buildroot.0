Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15667CAC597
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 19:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEDEB60B19;
	Thu, 18 Sep 2025 19:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PJlbfrth8kb; Thu, 18 Sep 2025 19:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0CCD60B13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0CCD60B13;
	Thu, 18 Sep 2025 19:50:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E626150
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92D9860B13
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pN_uFg2sDpaN for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 19:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED44460B10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED44460B10
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 19:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D64AC84EFA; Thu, 18 Sep 2025 19:50:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 21:46:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ad2eb4495ba260cdc71d5fb51f97d9ec2a6b1b8
X-Git-Newrev: e94b305e1e248cea18e2b44dfe45cdc8dd2b5a59
X-Patchwork-Hint: ignore
Message-Id: <20250918195030.D64AC84EFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aespipe: bump to version 2.4j
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e94b305e1e248cea18e2b44dfe45cdc8dd2b5a59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aespipe-v2.4i     April 29 2025
    - Added AES Crypto Extension opcodes for 64-bit arm64 on Linux.
    - aes-armv8sca.S aes-armv8ce.S : add PAC/BTI branch protection
      support. Patch from Emanuele Rocca <emanuele.rocca@arm.com>

aespipe-v2.4j     September 2 2025
    - Added configure script autodetection for 32-bit ARM -marm compile
      flag. This option is needed with some compilers that default to
      generating code in Thumb mode.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/aespipe/aespipe.hash | 8 ++++----
 package/aespipe/aespipe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
index cb60e7dc1e..f9a45b6e0c 100644
--- a/package/aespipe/aespipe.hash
+++ b/package/aespipe/aespipe.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4g/
-sha1  f1148f4aa82979755b13130b74643b449de55f6e  aespipe-v2.4h.tar.bz2
-md5  6c4552f10771eda471c964b34b1fae4a  aespipe-v2.4h.tar.bz2
+# From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4j/
+sha1  ba4d7cbaa0adbe924fa8d006d7f4e69c63f567a2  aespipe-v2.4j.tar.bz2
+md5  d0feebaa55a4a3aa5815492b8f096b09  aespipe-v2.4j.tar.bz2
 # Locally computed:
-sha256  eab311fc26ea43289bc3adf660d6270492494960725d2026ec4917294a1aba49  aespipe-v2.4h.tar.bz2
+sha256  448fe1e58612c184951645ddd926fc5bdb64fc4f2f828c766c82aa1127e9a3e2  aespipe-v2.4j.tar.bz2
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index 054849a147..d23acbfc0a 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AESPIPE_VERSION = 2.4h
+AESPIPE_VERSION = 2.4j
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
