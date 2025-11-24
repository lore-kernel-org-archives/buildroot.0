Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29053CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 14:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9C0482871;
	Mon, 24 Nov 2025 14:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgH6tFAHnvfZ; Mon, 24 Nov 2025 14:55:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F52582894
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F52582894;
	Mon, 24 Nov 2025 14:55:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B00C34E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C116405F0
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbIDEmwue-Ux for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 14:55:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30A114059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30A114059F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30A114059F
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:55:14 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9D68F2C80043;
 Mon, 24 Nov 2025 15:55:11 +0100 (CET)
From: Marcus Hoffmann <buildroot@bubu1.eu>
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 15:55:12 +0100
Message-ID: <20251124145512.2855482-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763996111; bh=A7O+GxwGjc2+nkMyjZblgAlRLfOE3WtaH2pq3xPwI9A=;
 h=From:To:Cc:Subject:Date;
 b=Q0xRm2tps8oKtTU8mbFuScMVY2odCFe+WcM0aDgsqb6FlAL/MijMocZ8evh1wHiye
 hia4i3Z/kako/Rog2cvRoQytYPHEjwRY6uIZeR291PTpDdkWRmNQjk2tNF4aExyEIo
 JmSlbLI+L8DbOMbnHDVuNNo23uW4vd7XXfTqIytpW549yx8Yf7Ga6dURSrbqk1G0Ad
 kN9BwWyL976kPt2zMJI2wiSqjvwp7RWhxhagzq23EhMTVTB8gtaaJtOZJjTWbnyRZi
 i8BYcs0xqZUSkrJ/BENIu2hU53rQWfphOAUZglcNd3lBHcq0VtREHrcgyPnnu3EGUk
 lK7O9cyUHNbHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Q0xRm2tp
Subject: [Buildroot] [PATCH] package/python-immutabledict: bump to 4.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
https://github.com/corenting/immutabledict/blob/master/CHANGELOG.md#version-422

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-immutabledict/python-immutabledict.hash | 4 ++--
 package/python-immutabledict/python-immutabledict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-immutabledict/python-immutabledict.hash b/package/python-immutabledict/python-immutabledict.hash
index 1dd4a79597..f917e43702 100644
--- a/package/python-immutabledict/python-immutabledict.hash
+++ b/package/python-immutabledict/python-immutabledict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/immutabledict/json
-md5  ac3ce87a7507d3e7d44a24a6b6bdb4a7  immutabledict-4.2.1.tar.gz
-sha256  d91017248981c72eb66c8ff9834e99c2f53562346f23e7f51e7a5ebcf66a3bcc  immutabledict-4.2.1.tar.gz
+md5  2ddeb671f200618365b11b997d50368f  immutabledict-4.2.2.tar.gz
+sha256  cb6ed3090df593148f94cb407d218ca526fd2639694afdb553dc4f50ce6feeca  immutabledict-4.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  347f918d37d4e0556a0695d34b9fb87fa9bbe808d54949851789c6c1fc91c61f  LICENSE
diff --git a/package/python-immutabledict/python-immutabledict.mk b/package/python-immutabledict/python-immutabledict.mk
index 902352a5d0..4a886b1607 100644
--- a/package/python-immutabledict/python-immutabledict.mk
+++ b/package/python-immutabledict/python-immutabledict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IMMUTABLEDICT_VERSION = 4.2.1
+PYTHON_IMMUTABLEDICT_VERSION = 4.2.2
 PYTHON_IMMUTABLEDICT_SOURCE = immutabledict-$(PYTHON_IMMUTABLEDICT_VERSION).tar.gz
-PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/e0/c5/4240186fbabc58fba41bbe17c5f0cd37ffd4c0b85a5029ab104f946df175
+PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/ce/12/1da8e1a9050d0603ba65fb1796ed8860a705b906701c96e77f85cc7490be
 PYTHON_IMMUTABLEDICT_SETUP_TYPE = poetry
 PYTHON_IMMUTABLEDICT_LICENSE = MIT
 PYTHON_IMMUTABLEDICT_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
