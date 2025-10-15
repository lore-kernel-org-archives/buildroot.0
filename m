Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FDCCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 11:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A18E821D9;
	Wed, 15 Oct 2025 11:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuPWKOKzGRyI; Wed, 15 Oct 2025 11:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 818C8821E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 818C8821E5;
	Wed, 15 Oct 2025 11:25:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BAA64C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58945614B7
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UwuYqtBdzTv for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 11:25:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB6F76146D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB6F76146D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB6F76146D
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:25:04 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 89BCC2C80CE5;
 Wed, 15 Oct 2025 13:25:02 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 13:25:02 +0200
Message-ID: <20251015112503.2785606-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760527502; bh=6yD09GWRHeRBtbDbfsyLH3G/t1vfDpsyaczP/8yMhNU=;
 h=From:To:Cc:Subject:Date;
 b=Voorgq8JtaGHWqyVermoadLz8qbPedIivRHLe3SIyRrJi9VIYHig/tZwyDDa8Bt1x
 S0E6zf6HCTJn39B1ktgyuhDuSSKxf6Ksja1k+jQ+L6D/VcUDNjymf06tIw07AR2U1/
 QzjVHOtW7nE3o2+gX7FZlvJsipw3kzPsOAbI+Gni2GfEAMvWPhXhIl32MT05KbIZKP
 FkEoVSERQcgu1xfdzu3MxNIV6kFltfyh4Hzbvc3Tu5HAEpmSarq2qtB9bO80VdwJqm
 CY2zRTDkT3uXw1evOnAab6+E4uNczY0XHVsNHnH2SnewMUkougtN0WpxoPLYEQVTgH
 kfBCcKZaY/AWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Voorgq8J
Subject: [Buildroot] [PATCH] package/python-sdbus: bump to 0.14.1.post0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes: https://github.com/python-sdbus/python-sdbus/releases/tag/0.14.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-sdbus/python-sdbus.hash | 4 ++--
 package/python-sdbus/python-sdbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sdbus/python-sdbus.hash b/package/python-sdbus/python-sdbus.hash
index 544262d48f..bb3834dfb4 100644
--- a/package/python-sdbus/python-sdbus.hash
+++ b/package/python-sdbus/python-sdbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus/json
-md5  69a256ea1c25105461a3955ac68e3ea7  sdbus-0.14.0.tar.gz
-sha256  41d61b76cc05a9ea41d10d70a11e9f9a86ed95f40f713630c5e18340e0e4c76f  sdbus-0.14.0.tar.gz
+md5  48ba3d23852b3d3f4f0623194f637872  sdbus-0.14.1.post0.tar.gz
+sha256  ae3915ab3e3f0a116632e1e5876df992b9529e82b0b492006eb22f8791ed6deb  sdbus-0.14.1.post0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-sdbus/python-sdbus.mk b/package/python-sdbus/python-sdbus.mk
index 560a5f02ae..9a72b23776 100644
--- a/package/python-sdbus/python-sdbus.mk
+++ b/package/python-sdbus/python-sdbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_VERSION = 0.14.0
+PYTHON_SDBUS_VERSION = 0.14.1.post0
 PYTHON_SDBUS_SOURCE = sdbus-$(PYTHON_SDBUS_VERSION).tar.gz
-PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/17/9a/1dc010428fa1f444809d9aa1adb3ce231dae891b5f33635d8f4d7a8e33fd
+PYTHON_SDBUS_SITE = https://files.pythonhosted.org/packages/b9/4f/549089131ba4ba5379517655cdcbfe3925fd1cc0eafd93aac5f73c2a6d40
 PYTHON_SDBUS_SETUP_TYPE = setuptools
 PYTHON_SDBUS_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_LICENSE_FILES = COPYING
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
