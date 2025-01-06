Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99A8E77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 20:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 618F4812A8;
	Mon,  6 Jan 2025 20:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMIPSfH4SfXf; Mon,  6 Jan 2025 20:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F4A981141
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F4A981141;
	Mon,  6 Jan 2025 20:35:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 959E6DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76660401B2
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lN1Gyj-GC4Gt for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 20:35:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63A3F40198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63A3F40198
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63A3F40198
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 20:35:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 39421FF805;
 Mon,  6 Jan 2025 20:35:46 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Mon,  6 Jan 2025 21:35:43 +0100
Message-ID: <20250106203544.1288193-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736195746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JfMiEp5dva4fDUs6BItRl+kx41mj23Uf13L1I/M3swo=;
 b=mmk4SlsV3hCbHzW0/tiVAXIXrzr6JFuaj9koBIg9mrLuTumUZacZILQ+uu+Hvz+dICM6Q7
 N8Cn8/ruNoltlwJCKmGpOsaFxi1pqxmYnSnQKgncBpPM6IJAS9v9WhrhzAlB+OwljdyBwA
 YUsovZp0/FFvQpXRORatBQ27UOdzroE3dPaVgl+2DdkJljmAZf7Ri/WzjzwUt6de3CA75u
 +Qw+sXEH5OqpqE0iYkcJd8O195SrCaA9Ebfv2KkJcfCqsMb87OMU8G0W7e6mvZbJgaKTJF
 Kdcm29HJbbKrGI0AXXoBoV6Tw07yo1dJOeajnCpGmnGW6Ioh28RbUT1wfNEewA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mmk4SlsV
Subject: [Buildroot] [PATCH] package/qt6/qt6quick3d: add missing select
 BR2_PACKAGE_QT6DECLARATIVE
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

qt6quick3d has qt6declative in its dependencies, but does not select
BR2_PACKAGE_QT6DECLARATIVE. It does select
BR2_PACKAGE_QT6DECLARATIVE_QUICK, but this option "depends on"
BR2_PACKAGE_QT6DECLARATIVE, and does not select it.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT6DECLARATIVE_QUICK
  Depends on [n]: BR2_PACKAGE_QT6 [=y] && BR2_PACKAGE_QT6DECLARATIVE [=n]
  Selected by [y]:
  - BR2_PACKAGE_QT6QUICK3D [=y] && BR2_PACKAGE_QT6 [=y]

reported by kconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6quick3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6quick3d/Config.in b/package/qt6/qt6quick3d/Config.in
index c4b8148039..3ec267734f 100644
--- a/package/qt6/qt6quick3d/Config.in
+++ b/package/qt6/qt6quick3d/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QT6QUICK3D
 	select BR2_PACKAGE_HOST_QT6BASE_CONCURRENT # Host Quick3DRuntimeRender
 	select BR2_PACKAGE_HOST_QT6BASE_GUI
 	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+	select BR2_PACKAGE_QT6DECLARATIVE
 	select BR2_PACKAGE_QT6DECLARATIVE_QUICK
 	help
 	  This package corresponds to the Qt Quick 3D module:
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
