Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1250C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 21:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CD8E60FD0;
	Tue, 20 Sep 2022 21:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD8E60FD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZ9JPUngqqNA; Tue, 20 Sep 2022 21:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7316660FC6;
	Tue, 20 Sep 2022 21:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7316660FC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD2E1BF2A7
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 21:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3E8D60FC6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 21:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3E8D60FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GqkJmso4b3p0 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 21:49:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C483260F60
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C483260F60
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 21:49:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0A6D3240004;
 Tue, 20 Sep 2022 21:49:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 23:49:44 +0200
Message-Id: <20220920214944.748436-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663710586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gj4wX4uybpdniM8s4Xzv6L1ux065rm5dWtMo0l2M5og=;
 b=XyQSjAvBcOmaZ/J1ZFk2eAjB3sznV923KGedzLf0gMxmlIDN+Qx6dDOviHFg8b/E0XtjpF
 OhRYN7U3uW2KF79fOItHkvtdbV2d3HT6VCeZBlMfxQlWRKpaMc2FtUKqbm54BY1wrYCn76
 9/f1U6cGAE/fYJGttFg9PbWa+tqu+AkJUKY+dS4l1p2DBOyfD1JUUHmuzf6Fqq/edOIXMH
 57nXieXqebjXpAyE+lj45wHEOlaG+S7aaOFzOOiPYRH8HjGNqg31p4ZgH28ZYymx3BXb9W
 AH2PiYAE3893eQ/Slm4md/G8LoJ5fk+7ZwPHAS007hizxfTZHCL2VRlC9Ag+VA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XyQSjAvB
Subject: [Buildroot] [PATCH] package/hiawatha: bump to version 11.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes between 11.1 and 11.2:

    mbed TLS updated to 3.2.1.
    Small improvements.

See https://www.hiawatha-webserver.org/changelog

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index b06dc2e661..1ee94ee69a 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d21722986f64163e30a560283123cdf4d6cb5ff8188ab754387b26724565268d  hiawatha-11.1.tar.gz
+sha256  99c64f76927f93469f062ab76b74eb79a397ea4be12da86bf746b2bb57cf1bc5  hiawatha-11.2.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 25da98a43c..2ba8efb2fe 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 11.1
+HIAWATHA_VERSION = 11.2
 HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
