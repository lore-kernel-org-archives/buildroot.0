Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA99C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6CDD4FCA1;
	Fri, 28 Feb 2025 16:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYpgmzfU9MXF; Fri, 28 Feb 2025 16:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B942F4FC98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B942F4FC98;
	Fri, 28 Feb 2025 16:47:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10D0468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3A2D42E00
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPxOiImnYgns for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 106EC419CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 106EC419CA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05E6B83D12; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 18:44:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5027bcf2c5c6f152bd837b5f961a4eea8e92ba5a
X-Git-Newrev: d63801823dbf093463661dfeb653f66670bd0d3e
X-Patchwork-Hint: ignore
Message-Id: <20250228162950.05E6B83D12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpdecimal: bump to
 version 4.0.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d63801823dbf093463661dfeb653f66670bd0d3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

While 2.5.1 -> 4.0.0 may seems like a big jump with lots of versions
skipped, in fact 4.0.0 is the immediate next release after 2.5.1.

Changelog at:
https://www.bytereef.org/mpdecimal/changelog.html

Build tested successfully with test-pkg, including with the one
reverse dependency of mpdecimal: the python3 decimal module:
https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1604635008.

The license file was renamed from LICENSE.txt to COPYRIGHT.txt. The
license is still BSD-2-Clause, but the formatting changed: the license
text is no longer inside a C-style comment, but just plain text, and
the copyright years were updated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpdecimal/mpdecimal.hash | 4 ++--
 package/mpdecimal/mpdecimal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
index 81150c7575..53ca182287 100644
--- a/package/mpdecimal/mpdecimal.hash
+++ b/package/mpdecimal/mpdecimal.hash
@@ -1,4 +1,4 @@
 # From http://www.bytereef.org/mpdecimal/download.html
-sha256  9f9cd4c041f99b5c49ffb7b59d9f12d95b683d88585608aa56a6307667b2b21f  mpdecimal-2.5.1.tar.gz
+sha256  942445c3245b22730fd41a67a7c5c231d11cb1b9936b9c0f76334fb7d0b4468c  mpdecimal-4.0.0.tar.gz
 # Locally computed
-sha256  b07528d8b1dbf1e2d2741052996f0876e23342ce2d30d0effa39c5457716c25a  LICENSE.txt
+sha256  2713324211652ce4a60e6e21e54f9dc3004299e591b0933a352f1a89c5fb53c2  COPYRIGHT.txt
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index aa322df340..a2ab18523b 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
-MPDECIMAL_VERSION = 2.5.1
+MPDECIMAL_VERSION = 4.0.0
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2-Clause
-MPDECIMAL_LICENSE_FILES = LICENSE.txt
+MPDECIMAL_LICENSE_FILES = COPYRIGHT.txt
 MPDECIMAL_CONF_OPTS = LD="$(TARGET_CC)"
 
 # threads are only needed for tests
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
