Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B246CCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 10:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DFBD600CC;
	Wed, 15 Oct 2025 10:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JobuAteupbEB; Wed, 15 Oct 2025 10:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31AB5614BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31AB5614BD;
	Wed, 15 Oct 2025 10:53:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C561D1C9
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6A026148B
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDMOqfOLHugH for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 10:52:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3DC80600CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC80600CC
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DC80600CC
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 10:52:59 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9EA0B2C80CE5;
 Wed, 15 Oct 2025 12:52:56 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 12:52:56 +0200
Message-ID: <20251015105257.2733472-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760525576; bh=ZU6Vvtq/xs15PkQLXeKLLaymfvfscB9HTtNMCAR9gK8=;
 h=From:To:Cc:Subject:Date;
 b=P1V3CJR9Kn8MYCOoRmO/IJ2dnwZkBkMXm00KzjaQeOZKkpeK/hBAQjpwmCwecfTTz
 w5AAufaJo5LwzNaejYiTcKbdBIXByvOg9ScLjHRuGxKDB+ouJSnr+dwzZPRlc7K2Rh
 LQj7/AOGy4FBcuoxWmNrQ/zZbFpdVjo9CSzVHUfPEnh8cIX24ERxZoeGxvVZcUEoac
 hRMdeCy1p5r+8li1ZBF90aP8IscdchSbx+Wo7Y2N4YAu6B3TRCiyJUXqEe4ttGMskn
 pdwVDXNDXorRoTw8hyrcduxTqQILPKkebafcEMeTXCYvEXvWvwcmLzpEYuUp/TVi7K
 +GBhdhw4UZzJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=P1V3CJR9
Subject: [Buildroot] [PATCH] package/python-click: bump to 8.3.0
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
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes: https://click.palletsprojects.com/en/stable/changes/#version-8-3-0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-click/Config.in         | 2 +-
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-click/Config.in b/package/python-click/Config.in
index 0fd43d5fb1..247cd4e973 100644
--- a/package/python-click/Config.in
+++ b/package/python-click/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_CLICK
 	help
 	  Python composable command line interface toolkit.
 
-	  https://pypi.python.org/pypi/click
+	  https://click.palletsprojects.com/
diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 79b1df40d9..df8528a786 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  438cfd4974584ae4f960ffeab32e8991  click-8.2.1.tar.gz
-sha256  27c491cc05d968d271d5a1db13e3b5a184636d9d930f148c50b038f0d0646202  click-8.2.1.tar.gz
+md5  fa228744ff03a339957e847fb7890823  click-8.3.0.tar.gz
+sha256  e7b8232224eba16f4ebe410c25ced9f7875cb5f3263ffc93cc3e8da705e229c4  click-8.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 9b64a0c351..ef22c27439 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.2.1
+PYTHON_CLICK_VERSION = 8.3.0
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/60/6c/8ca2efa64cf75a977a0d7fac081354553ebe483345c734fb6b6515d96bbc
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/46/61/de6cd827efad202d7057d93e0fed9294b96952e188f7384832791c7b2254
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
