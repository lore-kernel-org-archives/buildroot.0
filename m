Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA197C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A21ED6084C;
	Mon,  8 Jul 2024 20:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtpwlPkFfBp8; Mon,  8 Jul 2024 20:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A122C608D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A122C608D8;
	Mon,  8 Jul 2024 20:59:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B02A1BF97D
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 100CF4098B
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqEj41m1ppYp for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2185140544
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2185140544
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:59:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18A5B83D84; Mon,  8 Jul 2024 20:59:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:52:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 677c3f2995b4e6acaedcecc699b5f6ddf294f524
X-Git-Newrev: 158c2a000404cfcb3a216054c686d11454a5ef7f
X-Patchwork-Hint: ignore
Message-Id: <20240708205900.18A5B83D84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: security bump version to
 2.4.61
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

commit: https://git.buildroot.net/buildroot/commit/?id=158c2a000404cfcb3a216054c686d11454a5ef7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2024-39884.

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.61

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index bd503d84f9..2ed9c17f9a 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.59.tar.bz2.{sha256,sha512}
-sha256  7b1ec7ec5635da7cb01550513215a90f8b2f52bb7c90cf3e97ede936d3e55b0f  httpd-2.4.60.tar.bz2
-sha512  c1591389f76699beaa5d32b019729e25f1ed5b828311c82b52f1a4edd5d28b73e697958df384d7628b314521a831dbb0af418bc37cdf031cfe133e53c195d8ad  httpd-2.4.60.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.61.tar.bz2.{sha256,sha512}
+sha256  ea8ba86fd95bd594d15e46d25ac5bbda82ae0c9122ad93998cc539c133eaceb6  httpd-2.4.61.tar.bz2
+sha512  00656220ecc2b80788f539536553f0a3a57602fb981be22e63af87d0f98ffe5da3056e722ce52ae8cf9c2111ad1922b3aaea1fd7d69d0ed76795199203d593ff  httpd-2.4.61.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 39ccc3cf96..0319a96815 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.60
+APACHE_VERSION = 2.4.61
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://dlcdn.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
