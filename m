Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF07C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 14:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2831D4050E;
	Wed, 26 Aug 2026 14:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2dtkYv9TgnC; Wed, 26 Aug 2026 14:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787754523;
	bh=gwjZSzbycklDsHU7lrRv8uMeFZtRt8V5h5AxaVkpako=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DsPZRuFb5rTlG0ciW7FWsksel6z4DWrN4UbmKp8unrNUAu+pP0d+V2J5D7kXdSGWo
	 3lY49lOATbvTWuxUYz40xECNBqe0ypkn9qL0HbWG7AdYNHRaIqCiPVl0TN96OHu6Y2
	 ZtGCyC6PSygf6ih8HDwmu3hiL2vgMvLJkZWKAFRptH5NDLcX7FwPZVxFXVzUx4JMRD
	 hnT+A3rmHsYjNP0bBc/SQj6Yx3hCrs/6Dd/I/ESQoSIxY6atY7sVJh8TESMp0e+FIF
	 lfulSTrTd63vn9Oo269oJGotyjHYXbPjQWZ32DMJpSlmOZupFOGww4/hhwXVc3GLZT
	 ThDkgUuVNOngA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59DA0404E8;
	Wed, 26 Aug 2026 14:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B805D396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9C88404E8
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZatAug8nWcTS for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 14:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD8FA404E7
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:28:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5C6044E413BB
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:28:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 287B2604EC;
 Wed, 26 Aug 2026 14:28:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1801511C78277; 
 Wed, 26 Aug 2026 16:28:32 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Wed, 26 Aug 2026 16:28:28 +0200
Message-ID: <20260826142830.4040428-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/qt6/qt6declarative: move comment
 where it belongs
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

The commit "Enable host test module to ensure that qmltestrunner is
built" in qt6declarative's Config.in feels lonely under
BR2_PACKAGE_QT6DECLARATIVE. It's because it's actually related to a
select done in the sub-option BR2_PACKAGE_QT6DECLARATIVE_QUICK, so
move it there.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6declarative/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
index 0a977ed808..a57b203071 100644
--- a/package/qt6/qt6declarative/Config.in
+++ b/package/qt6/qt6declarative/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT6DECLARATIVE
 	bool "qt6declarative"
-	# Enable host test module to ensure that qmltestrunner is built
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -13,6 +12,7 @@ if BR2_PACKAGE_QT6DECLARATIVE
 
 config BR2_PACKAGE_QT6DECLARATIVE_QUICK
 	bool "quick module"
+	# Enable host test module to ensure that qmltestrunner is built
 	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST # qmltestrunner
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
 	select BR2_PACKAGE_QT6BASE_GUI
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
