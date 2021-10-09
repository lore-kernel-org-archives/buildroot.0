Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F87CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:00:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE4060F4B
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EE4060F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E9E58294A;
	Sat,  9 Oct 2021 20:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ig_8FXDQi8t; Sat,  9 Oct 2021 20:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9A682948;
	Sat,  9 Oct 2021 20:00:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 711981BF2B7
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6074082923
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9E5oviY2O6R4 for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:00:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DEB38291C
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:00:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 18C8994BD7; Sat,  9 Oct 2021 19:57:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 21:47:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49381c4f599d09430b51dbd39465a801c28ea5b9
X-Git-Newrev: 73eb9e9d36fa8f41a41db74447ae41ad29c4154f
X-Patchwork-Hint: ignore
Message-Id: <20211009195746.18C8994BD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libite: bump version to v2.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=73eb9e9d36fa8f41a41db74447ae41ad29c4154f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream now supplies sha256 hashes, so drop upstream md5 and locally
computed sha256 in favor of that.

The hash for LICENSE has changed due to the copyright years and author
last name being updated.

The hash for chomp.c and pidfile.c has been changed due to copyright
years and author last name being updated, as well as doxygen comments
being added to the files.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libite/libite.hash | 11 +++++------
 package/libite/libite.mk   |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 1a553d2bcb..6f461f9b76 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,8 +1,7 @@
-# From https://github.com/troglobit/libite/releases/download/v2.2.0/libite-2.2.0.tar.xz.md5
-md5  8533ab27d0d4a7c745f11925907795a9  libite-2.2.0.tar.xz
+# Upstream .sha256 from GitHub
+sha256  8fad6b8a1e7e0d6b546863104dfe25dfe0bb2d2a9b98ec8e155d23392ef58514  libite-2.4.1.tar.xz
 
 # Locally calculated
-sha256  3fdeb48ea3d9220f91111ed7a68e1e68edfc70346d0108a49bab73a47a7dd761  libite-2.2.0.tar.xz
-sha256  a8a7506c64ce46a58c17838b0f678f8c2567d71869402f97d19460ddec4882f5  LICENSE
-sha256  89053891d46d04a21d4a492f68038703e179986baffa458201810f4222b57427  src/chomp.c
-sha256  a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  src/pidfile.c
+sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
+sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
+sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 69a90d7187..7ccf642e50 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.2.0
+LIBITE_VERSION = 2.4.1
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
