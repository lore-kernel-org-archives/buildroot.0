Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269C8C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 13:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF5BA8496F;
	Sat, 15 Feb 2025 13:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcPUBr_QHQ-5; Sat, 15 Feb 2025 13:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB9E84972
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DB9E84972;
	Sat, 15 Feb 2025 13:53:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C307F72
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 13:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A49EC408C9
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 13:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7Vh0LSxNAPl for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 13:53:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64A5C40642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A5C40642
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64A5C40642
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 13:53:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70E70443F1;
 Sat, 15 Feb 2025 13:53:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tjIbW-001cJx-1y;
 Sat, 15 Feb 2025 14:53:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Feb 2025 14:53:09 +0100
Message-Id: <20250215135309.385622-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehvdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepueeludelteeiledvtedviefgheetgfehgeffieeiuedugfduudekffeludefueelnecuffhomhgrihhnpehgnhhurdhorhhgpdhgihhtlhgrsgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/libtasn1: security bump to version
 4.20.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security vulnerability:

CVE-2024-12133: Potential DoS in handling of numerous SEQUENCE OF or SET

https://lists.gnu.org/archive/html/help-libtasn1/2025-02/msg00001.html

Adjust the license files after upstream moved the license clarification to
README.md and moved the COPYING* files top the top level directory /
slightly updated the COPYING* files (http->https) with:

https://gitlab.com/gnutls/libtasn1/-/commit/73cc886c3ff29c326a5f1a10b3127d521574a1ad

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtasn1/libtasn1.hash | 10 +++++-----
 package/libtasn1/libtasn1.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index 4bcb6a3feb..b9c9dad131 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.19.0.tar.gz.sig
-sha256  1613f0ac1cf484d6ec0ce3b8c06d56263cc7242f1c23b30d82d23de345a63f7a  libtasn1-4.19.0.tar.gz
+# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.20.0.tar.gz.sig
+sha256  92e0e3bd4c02d4aeee76036b2ddd83f0c732ba4cda5cb71d583272b23587a76c  libtasn1-4.20.0.tar.gz
 # Locally calculated
-sha256  7446831f659f7ebfd8d497acc7f05dfa8e31c6cb6ba1b45df33d4895ab80f5a6  COPYING
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  doc/COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
+sha256  990ef6a87f29a9d3db33698b94ea026a5d0f81bbf9806333d73699a250b7e5d6  README.md
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 3af1bcdcbb..3154e500f1 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.19.0
+LIBTASN1_VERSION = 4.20.0
 LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
-LIBTASN1_LICENSE_FILES = COPYING doc/COPYING doc/COPYING.LESSER
+LIBTASN1_LICENSE_FILES = README.md COPYING COPYING.LESSERv2
 LIBTASN1_CPE_ID_VENDOR = gnu
 LIBTASN1_INSTALL_STAGING = YES
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
