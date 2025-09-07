Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFCECA101F
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 15:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57B3C4156C;
	Sun,  7 Sep 2025 15:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id deuO_lhQJTbk; Sun,  7 Sep 2025 15:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B95341528
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B95341528;
	Sun,  7 Sep 2025 15:07:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D239E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECB5860DEA
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjFQf7RT_y1A for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 15:07:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF5EC61BBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF5EC61BBB
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF5EC61BBB
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:07:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1BA9E1A0DA5
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:07:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D06D16061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:07:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 10B63102F2853; 
 Sun,  7 Sep 2025 17:07:12 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sun,  7 Sep 2025 17:07:10 +0200
Message-ID: <20250907150711.3438750-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757257633; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Qo3kXEcbIEapdyAIvSqJb/BxQm9fkfyOmDloT/LP89I=;
 b=zbFbt18BQ++CRL8RnVu/aKyubZuy7HfZLFMLEVYTkTDQrM8r687yaHYLhTO0ziTbaGz15e
 5MQvGCPD/6zjSDHU/MFj3aebohscC4qXkF8WPa1Lsf/xMCjB2Qsf1xxBctGlyo++ZAuy86
 Kent9C0kozLD+K7xUxn2hq1xSKdMPpGGQeotZfhs3EVzvUTJ2+oRSgBtxQIntrzuZ066Jv
 jNPJo5ffwAUF/vtc6qF5U9ALl32iB/qHJUK68L6hnZVSdSr77X0/JUkJQnvtD9uMPxETwc
 82tEZFs+DLL4/DSx4y7eMrW+SHFBF9Cqnd9IHv7y9a2hYNIBnt9h25BAo+I3NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=zbFbt18B
Subject: [Buildroot] [PATCH v2] package/unzip: bump to Debian patch level
 -29 to fix GCC 15.x issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

unzip currently fails to build with GCC 15.x. We're already fetching
from Debian, using patchlevel -27, and it turns out that Debian
patchlevel -29 has the GCC 15.x fix, and very few other fixes:

unzip (6.0-29) unstable; urgency=medium

  * Ignore invalid "Total number of disks" field on Microsoft ZIP64 files.
    Closes: #661956, #1064000.
  * Drop conflicting declarations of gmtime() and localtime().
    Should fix build with gcc-15. Closes: #1098043.
  * Fix zipgrep handling of escapes. Closes: #1054628.
  * Stop using update-mime. Closes: #1072396.
  * Add debian/source/lintian-overrides for *.a files.
  * Do not trim Debian changelog.
  * Add debian/salsa-ci.yml.
  * Add Vcs-Git and Vcs-Browser fields.
  * Update Standards-Version.

unzip (6.0-28) unstable; urgency=medium

  * Drop debian/source/lintian-overrides, obsolete since version 6.0-18.
  * Update URI for Info-ZIP license in copyright file.
  * Update standards version to 4.6.2.
  * Run wrap-and-sort.
  * Update Homepage.

So let's just bump to this patchlevel version.

Note that the .dsc file link in the .hash file was wrong, it was still
referring to patchlevel -26.

Fixes:

  https://autobuild.buildroot.net/results/d81cb9d7c9e87dd233dde350d15cb03427ba2036/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v1 -> v2: we're actually bumping from -27 to -29
---
 package/unzip/unzip.hash | 5 ++---
 package/unzip/unzip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index bbf4f7d71f..5e2bbcb0b0 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -1,6 +1,5 @@
-# From https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip/unzip_6.0-26.dsc
+# From https://snapshot.debian.org/archive/debian-debug/20250311T212313Z/pool/main/u/unzip/unzip_6.0-29.dsc
 sha256  036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37  unzip_6.0.orig.tar.gz
-sha256  67bde7c71d52afd61aa936d4415c8d12fd90ca26e9637a3cd67cae9b71298c12  unzip_6.0-27.debian.tar.xz
-
+sha256  14043e5ea351c02b3bc8676e1e6d20d79b9a690b6d7520e8138ac629cc048417  unzip_6.0-29.debian.tar.xz
 # Locally computed:
 sha256  7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b  LICENSE
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 5effebee4a..4329054c1c 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -6,8 +6,8 @@
 
 UNZIP_VERSION = 6.0
 UNZIP_SOURCE = unzip_$(UNZIP_VERSION).orig.tar.gz
-UNZIP_PATCH = unzip_$(UNZIP_VERSION)-27.debian.tar.xz
-UNZIP_SITE = https://snapshot.debian.org/archive/debian/20220916T090657Z/pool/main/u/unzip
+UNZIP_PATCH = unzip_$(UNZIP_VERSION)-29.debian.tar.xz
+UNZIP_SITE = https://snapshot.debian.org/archive/debian-debug/20250311T212313Z/pool/main/u/unzip
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 UNZIP_CPE_ID_VALID = YES
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
