Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894F3C47DDB
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B1AE80E94;
	Tue, 30 Jan 2024 22:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1AE80E94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0T9iG45sexT; Tue, 30 Jan 2024 22:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 652E180B67;
	Tue, 30 Jan 2024 22:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652E180B67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D25AA1BF95D
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93C4741BB3
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93C4741BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSvKBhDQsp59 for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F7A41B27
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3F7A41B27
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CA2786738; Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 23:06:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0fabbd2aabd827a1989c5dd97089a0cfb9e04c6
X-Git-Newrev: 863131cad9fec0a54a4b4281f5fa3cd5ed8ea462
X-Patchwork-Hint: ignore
Message-Id: <20240130220739.8CA2786738@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpsl: bump to version 0.21.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=863131cad9fec0a54a4b4281f5fa3cd5ed8ea462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The main changes are improvements to the Meson build system, including
a fix for a build issue related to iconv:

  https://github.com/rockdaboot/libpsl/releases/tag/0.21.3
  https://github.com/rockdaboot/libpsl/releases/tag/0.21.4
  https://github.com/rockdaboot/libpsl/releases/tag/0.21.5

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpsl/libpsl.hash | 2 +-
 package/libpsl/libpsl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
index a35a609ff2..d800ba6a77 100644
--- a/package/libpsl/libpsl.hash
+++ b/package/libpsl/libpsl.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256  e35991b6e17001afa2c0ca3b10c357650602b92596209b7492802f3768a6285f  libpsl-0.21.2.tar.gz
+sha256  1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208  libpsl-0.21.5.tar.gz
 
 # Hashes for license files:
 sha256  776cd11d54f0ea3e5efdd25ff1a0d952a1744215bb5858ea7aeb91808e70c9f7  COPYING
diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
index ef3c524b4f..d1a12f864c 100644
--- a/package/libpsl/libpsl.mk
+++ b/package/libpsl/libpsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPSL_VERSION = 0.21.2
+LIBPSL_VERSION = 0.21.5
 LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
 LIBPSL_LICENSE = MIT, BSD-3-Clause
 LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
