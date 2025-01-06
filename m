Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3A0E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 21:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F43980CBD;
	Mon,  6 Jan 2025 21:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaMuX1Oz2h8C; Mon,  6 Jan 2025 21:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4CAB80CC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4CAB80CC6;
	Mon,  6 Jan 2025 21:06:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47408DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34F5C80CBD
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lmH80TLQFeB for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 21:06:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5918080CC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5918080CC9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5918080CC9
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:06:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3D49CFF804;
 Mon,  6 Jan 2025 21:06:26 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Mon,  6 Jan 2025 22:06:22 +0100
Message-ID: <20250106210623.1296442-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736197586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5doRCCiOYXECe+6Gm6Puk3wiNMDZnWEwOb2SNr8qunk=;
 b=ke9BQ/qaLDxJGVY4pWhAuTmf9GxaC/CZBiOTNwtHTifWfczu8ldZmL20HFKCn2pFDHZXFP
 FOd8+dsEdNLkCVbk/tVBUTS9/uXOj5TrnV+65BJYV8C//PClEIBVFjfisYYD3wiDMrcM2f
 s6Up6lXM1QJoAjPSApdBs3mu04uRJWyGeIYtrmasntlOeqDSK0mgNcfjek/HUW8sGbgB4U
 6nlM2dYlYG4jHiqAh3zTAfz+onavAIpyU+DWi1mMMR95Qie6kg5S38ZBE7qroQNL4O/+fQ
 GL+yesFJHVxo0Wtu9kDmOx4uNqnO+O3W2M7bqxEe2SlHrmfsUyM/z9lCSWStew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ke9BQ/qa
Subject: [Buildroot] [PATCH] package/qt6/qt6quicktimeline: add missing
 select BR2_PACKAGE_QT6DECLARATIVE
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

qt6quicktimeline has qt6declative in its dependencies, but does not
select BR2_PACKAGE_QT6DECLARATIVE. It does select
BR2_PACKAGE_QT6DECLARATIVE_QUICK, but this option "depends on"
BR2_PACKAGE_QT6DECLARATIVE, and does not select it.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT6DECLARATIVE_QUICK
  Depends on [n]: BR2_PACKAGE_QT6 [=y] && BR2_PACKAGE_QT6DECLARATIVE [=n]
  Selected by [y]:
  - BR2_PACKAGE_QT6QUICKTIMELINE [=y] && BR2_PACKAGE_QT6 [=y]

reported by kconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6quicktimeline/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6quicktimeline/Config.in b/package/qt6/qt6quicktimeline/Config.in
index 4dcf0e1452..466aab23c8 100644
--- a/package/qt6/qt6quicktimeline/Config.in
+++ b/package/qt6/qt6quicktimeline/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT6QUICKTIMELINE
 	bool "qt6quicktimeline"
+	select BR2_PACKAGE_QT6DECLARATIVE
 	select BR2_PACKAGE_QT6DECLARATIVE_QUICK
 	help
 	  This package corresponds to the Qt Quick Timeline module:
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
