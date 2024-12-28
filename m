Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAF2E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 09:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C97C24035C;
	Sat, 28 Dec 2024 09:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBf-1HAio5RH; Sat, 28 Dec 2024 09:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78AC740347
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78AC740347;
	Sat, 28 Dec 2024 09:28:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77197F1B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 09:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6484D401CC
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 09:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PymGO0zaUvVL for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 09:28:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1E9A400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1E9A400EC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1E9A400EC
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 09:28:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id C1C371BF203;
 Sat, 28 Dec 2024 09:28:42 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Dec 2024 10:28:40 +0100
Message-ID: <20241228092841.3045045-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735378122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IHcH6Zl2Rf5GJAGuMo330mfeTbkTndbaPRjPx5+CKkA=;
 b=Vkdx5GI05oEMyv5I/SLrU+dkFxWAYltgh5RjlwWhrzJBrGu/U4eBXBidow29oDSfkPvZTC
 Eo+mZv3JBG5lS9828DaoBoCo7dE/KXjvEi72O7gj5OBTEx/6GsaUNdnofvoF/0W4OxK0cb
 Wiza1NHjV1PPVCfRlZmtZdAWRtrOV7M5n6CBrok0OSoh540U+uJzvzNyEifMqMH7SyEYU3
 S0LnXFQTjTfueCP8d1XPGq7fODqxI1SVol9juCIaklaW/2pkZp/hnKuhf0YXUWZLPKwJbM
 KQpmu5PXJ1q3uN0LhiiRTEpQa4UCYybgb47WgOBoNmCGTooMHKeNcGAeI7R3+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vkdx5GI0
Subject: [Buildroot] [PATCH] package/scons: bump to 4.8.1
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

The tarball was renamed from SCons-<version>.tar.gz to
scons-<version>.tar.gz.

Changes 4.7.0 -> 4.8.0:
  https://scons.org/scons-480-is-available.html

Changes 4.8.0 -> 4.8.1:
  https://scons.org/scons-481-is-available.html

This change has been tested by building the two Buildroot packages
that use host-scons: benejson and gpsd.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/scons/scons.hash | 4 ++--
 package/scons/scons.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index 8dca99830e..3a8a942ee8 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scons/json
-md5  f5a740e94864408902c62bdb47687d9d  SCons-4.7.0.tar.gz
-sha256  d8b617f6610a73e46509de70dcf82f76861b79762ff602d546f4e80918ec81f3  SCons-4.7.0.tar.gz
+md5  37ad818d24ad2f44d6bee5b0f3838706  scons-4.8.1.tar.gz
+sha256  5b641357904d2f56f7bfdbb37e165ab996b6143c948b9df0efc7305f54949daa  scons-4.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2f6ac9a1fc98394d18b80dba9bedb9d5626006d44db3fecf7cf3e21cff7e8b1c  LICENSE
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index b6bfaa0237..f1f76f38a6 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-SCONS_VERSION = 4.7.0
-SCONS_SOURCE = SCons-$(SCONS_VERSION).tar.gz
-SCONS_SITE = https://files.pythonhosted.org/packages/7b/68/6895065c86c65a9388eb760a43ea695ec5b9b1c98a9675a3bcd682dbe9c0
+SCONS_VERSION = 4.8.1
+SCONS_SITE = https://files.pythonhosted.org/packages/b9/76/a2c1293642f9a448f2d012cabf525be69ca5abf4af289bc0935ac1554ee8
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE
 SCONS_SETUP_TYPE = setuptools
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
