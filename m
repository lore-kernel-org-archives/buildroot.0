Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2314AC02182
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 15:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4CD384B0B;
	Wed, 22 Jan 2025 15:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Js8utJRjpYqb; Wed, 22 Jan 2025 15:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B86D84B4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B86D84B4C;
	Wed, 22 Jan 2025 15:18:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6923D7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0BBA608A2
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7rYFC2yW7kB for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 15:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E755D60877
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E755D60877
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D606F8602D; Wed, 22 Jan 2025 15:18:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 16:02:14 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ade4f4b4e5e5257d7fca57863a7ef293c62bb343
X-Git-Newrev: 49a749fa54c260b74e9dac08bfe397142847afac
X-Patchwork-Hint: ignore
Message-Id: <20250122151820.D606F8602D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/rsync: bump
 version to 3.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=49a749fa54c260b74e9dac08bfe397142847afac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Bugfix release fixing regressions in 3.4.0:

- fixed handling of -H flag with conflict in internal flag values
- fixed a use after free in logging of failed rename
- fixed build on systems without openat()
- removed dependency on alloca() in bundled popt

For more details, see:
https://download.samba.org/pub/rsync/NEWS#3.4.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 593755f527a77fe8bf2513f14118ab51b76f17b7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 336d785153..5feacd0663 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.0.tar.gz.asc
-sha256  8e942f95a44226a012fe822faffa6c7fc38c34047add3a0c941e9bc8b8b93aa4  rsync-3.4.0.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.1.tar.gz.asc
+sha256  2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52  rsync-3.4.1.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 4613778a7f..e4c02a756f 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.0
+RSYNC_VERSION = 3.4.1
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
