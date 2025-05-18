Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E32C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF1F613C4;
	Mon, 19 May 2025 11:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUXtxCfolGNj; Mon, 19 May 2025 11:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13526712CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13526712CA;
	Mon, 19 May 2025 11:06:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16502D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1627423B2
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWZfBZiT5XDt for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 421CD423FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 421CD423FA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40C6C83BC0; Mon, 19 May 2025 10:40:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 23:06:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0e16ff09e9538d46c9726f8998080d55dfa5d41f
X-Git-Newrev: b5cd550cfda9f1d2171525bf9df438ef4a1b2059
X-Patchwork-Hint: ignore
Message-Id: <20250519104011.40C6C83BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gzip: bump to version
 1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5cd550cfda9f1d2171525bf9df438ef4a1b2059
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://git.savannah.gnu.org/cgit/gzip.git/tree/NEWS?id=fbc4883eb9c304a04623ac506dd5cf5450d055f1
https://lists.gnu.org/r/bug-gzip/2025-04/msg00022.html

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gzip/gzip.hash | 4 ++--
 package/gzip/gzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
index 4d9d0c721b..90c9be4e6e 100644
--- a/package/gzip/gzip.hash
+++ b/package/gzip/gzip.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gzip/gzip-1.13.tar.xz.sig
+# https://ftp.gnu.org/gnu/gzip/gzip-1.14.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  7454eb6935db17c6655576c2e1b0fabefd38b4d0936e0f87f48cd062ce91a057  gzip-1.13.tar.xz
+sha256  01a7b881bd220bfdf615f97b8718f80bdfd3f6add385b993dcf6efd14e8c0ac6  gzip-1.14.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 330321352c..e79de4c99e 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GZIP_VERSION = 1.13
+GZIP_VERSION = 1.14
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 # Some other tools expect it to be in /bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
