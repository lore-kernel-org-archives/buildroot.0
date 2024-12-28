Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BDEE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 17:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAF284031C;
	Sat, 28 Dec 2024 17:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPC119CS5pl3; Sat, 28 Dec 2024 17:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 665484038E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 665484038E;
	Sat, 28 Dec 2024 17:01:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7142FC8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D60E606EA
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y76JLaUBH8W6 for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 17:01:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1BE1606E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1BE1606E1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1BE1606E1
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 17:01:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D426D20002;
 Sat, 28 Dec 2024 17:01:37 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Dec 2024 18:01:35 +0100
Message-ID: <20241228170136.3164815-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735405298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bS+X0oSPJQPis+UjHaOaamWkIIUZ2eACgwbLwoIlIpk=;
 b=HCkut2tIhTvu0wy2I6N/vwDddpQz9IrWLz4oyG5emkGcXNI74wSvNrLQXo6G1MPSsmQDIi
 cFBFsCcRcvG1xD+edxjkx2xeYSlPrLQVP+XID8Bf9zvPF/5Ylwb5iiUzu2TRSZpp9QmzSq
 gveQL1+g5LOC+e9ePLzkZk0O04b3DZzroQmNC5nMHQOKMOQg7TaeDRvdHV9jTH7exHwbJf
 hqrd6XE7lJEvilkM/jdRTqP5YC8avT/3BQnLBevIWrxUlI4JSzZUn8ZY0+/pCf43OQtkmW
 W5lrll09mckgXA+XngXUrJFIJFx8/5g7zG984PXBhVGaKXA4YBVyT5oaJzqg9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HCkut2tI
Subject: [Buildroot] [PATCH v2] package/mpdecimal: bump to version 4.0.0
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

While 2.5.1 -> 4.0.0 may seems like a big jump with lots of versions
skipped, in fact 4.0.0 is the immediate next release after 2.5.1.

Changelog at:
https://www.bytereef.org/mpdecimal/changelog.html

Build tested successfully with test-pkg, including with the one
reverse dependency of mpdecimal: the python3 decimal module:
https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1604635008.

The license file was renamed from LICENSE.txt to COPYRIGHT.txt. The
license is still BSD-2-Clause, but the formatting changed: the license
text is no longer inside a C-style comment, but just plain text, and
the copyright years were updated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
v1 -> v2:
- Fix legal info
---
 package/mpdecimal/mpdecimal.hash | 4 ++--
 package/mpdecimal/mpdecimal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
index 81150c7575..53ca182287 100644
--- a/package/mpdecimal/mpdecimal.hash
+++ b/package/mpdecimal/mpdecimal.hash
@@ -1,4 +1,4 @@
 # From http://www.bytereef.org/mpdecimal/download.html
-sha256  9f9cd4c041f99b5c49ffb7b59d9f12d95b683d88585608aa56a6307667b2b21f  mpdecimal-2.5.1.tar.gz
+sha256  942445c3245b22730fd41a67a7c5c231d11cb1b9936b9c0f76334fb7d0b4468c  mpdecimal-4.0.0.tar.gz
 # Locally computed
-sha256  b07528d8b1dbf1e2d2741052996f0876e23342ce2d30d0effa39c5457716c25a  LICENSE.txt
+sha256  2713324211652ce4a60e6e21e54f9dc3004299e591b0933a352f1a89c5fb53c2  COPYRIGHT.txt
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index aa322df340..a2ab18523b 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
-MPDECIMAL_VERSION = 2.5.1
+MPDECIMAL_VERSION = 4.0.0
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2-Clause
-MPDECIMAL_LICENSE_FILES = LICENSE.txt
+MPDECIMAL_LICENSE_FILES = COPYRIGHT.txt
 MPDECIMAL_CONF_OPTS = LD="$(TARGET_CC)"
 
 # threads are only needed for tests
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
