Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F87CA1017
	for <buildroot@archiver.kernel.org>; Sun,  7 Sep 2025 15:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30ABB60DEA;
	Sun,  7 Sep 2025 15:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufTHE5vD1KA5; Sun,  7 Sep 2025 15:03:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 505F161B4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 505F161B4E;
	Sun,  7 Sep 2025 15:03:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 629669E4
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48BBB4212A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2u0b0GREDDea for <buildroot@buildroot.org>;
 Sun,  7 Sep 2025 15:03:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AC1B420A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC1B420A6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AC1B420A6
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:03:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 35DB21A0DA5
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:03:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 001A66061A
 for <buildroot@buildroot.org>; Sun,  7 Sep 2025 15:03:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DAFF5102F27DF; 
 Sun,  7 Sep 2025 17:03:28 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Sun,  7 Sep 2025 17:03:23 +0200
Message-ID: <20250907150323.3437695-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757257417; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=4s0I/rSFZ+YW1HVVOwZ5wlaEXV/ebPBTIxd/eMgjWjg=;
 b=thqvIgYiIlVrHIaiB6rkFchrUkP0A6pBylUyrOZ0xrolAmqoiphSS1r9gVx/O7baeY950B
 zH1zFT7c7fXCQDrlqsHX2pv7Mx+DQfUycDX77M4IzIEwxOlfXAh3J0jbJauKeexfB8OYhQ
 /m+h8QUA11FXUdhwnyaoXr1mzE1Al+6y+gO8VFZkrTnjPm5hiyJV7LtcpSFMz2WyumzjQX
 tS6glftKU8zicIRnyqmAWzd/GXjlqnNPyeM4RtjxkjfNfPVnWCTCClpiCrOT5LpBX2c6xT
 Dk51xQYhwRcE/n9RahE5xzYnXi9Mv3GpC2eCw6Tzhb2Cmu6+90YrKOXJOKP+tQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=thqvIgYi
Subject: [Buildroot] [PATCH] package/unzip: bump to Debian patch level -29
 to fix GCC 15.x issues
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
from Debian, using patchlevel -28, and it turns out that Debian
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

So let's just bump to this patchlevel version.

Fixes:

  https://autobuild.buildroot.net/results/d81cb9d7c9e87dd233dde350d15cb03427ba2036/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
