Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C1BC369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 14:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1DB742F2E;
	Fri, 18 Apr 2025 14:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yV-OEK46XSXd; Fri, 18 Apr 2025 14:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC56D417D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC56D417D2;
	Fri, 18 Apr 2025 14:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 725F1228
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5808E417D2
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6EKrt8Q5DV3 for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 14:44:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CA7540784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CA7540784
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CA7540784
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:44:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.208.157.35]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mj8qj-1ukuWS416z-00gf74 for <buildroot@buildroot.org>; Fri, 18 Apr 2025
 16:44:10 +0200
To: buildroot@buildroot.org
Date: Fri, 18 Apr 2025 16:43:41 +0200
Message-ID: <20250418144342.24540-2-dalang@gmx.at>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:2GHxt+h58InHbxcOULTkTMJWakVR5tyP2+RDmSB5qeh4WTCVe5g
 eorwBLxCe71kxY8/ydmoatwyGtXjIuW8DigGcGj1saj7qrnE8Uj2jvD5NirahZUMQzSLN87
 AIXnB3ZiEft67bkFpq7kvLxm3YPJudF2rF1cnmh4oQakGaJZcrjdf5p/oRMHsauCdeOO+Dc
 k+Cdz8LNu8AETD28dam1Q==
UI-OutboundReport: notjunk:1;M01:P0:I/hOcJSxZrk=;ynPx9bmU7MDKpDafdD3+mfvTNrK
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1744987450; x=1745592250; i=dalang@gmx.at;
 bh=1WcP001QVzgxiDgO4Hh3g/1IZ/sAiekffxt56wP0rD4=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=cKkITf8hisIPxw/DBqI0Wuop7Hdnbaq8GMv0W5wi/NGUyU02AcLTcEtygDb+kWPQ
 qiyCvbSKKFR4pNteOGdbiR3Xf+5lbc4ibHha/5r2wntgCyzl+Em/MC1ONCi7cv0Zv
 R79awFMkPS+BfGGHzR/9wDT0G0+WD097h3/swPoIcsH0R6eUS4TEyKq7BAbk7ag52
 JbUY8Vqp8OhWB/gy8v5P5iuqKiPxip/lWrcbj38ToKFZStonSM+Do/79THoDT5TQA
 zTCoJrJ3PlOg5CnBSiX0v8bHIopmiZFZ2ml7RSFoPIaThTLF2UzY52etRWP72lMWF
 O4Rxn6gITU1i5N1h+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=cKkITf8h
Subject: [Buildroot] [PATCH] package/glibmm2_66: bump to version 2.66.8
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.66.8/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/glibmm2_66/glibmm2_66.hash | 4 ++--
 package/glibmm2_66/glibmm2_66.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibmm2_66/glibmm2_66.hash b/package/glibmm2_66/glibmm2_66.hash
index 19272d2b90..20249977e8 100644
--- a/package/glibmm2_66/glibmm2_66.hash
+++ b/package/glibmm2_66/glibmm2_66.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.6.sha256sum
-sha256  5358742598181e5351d7bf8da072bf93e6dd5f178d27640d4e462bc8f14e152f  glibmm-2.66.6.tar.xz
+# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.8.sha256sum
+sha256  64f11d3b95a24e2a8d4166ecff518730f79ecc27222ef41faf7c7e0340fc9329  glibmm-2.66.8.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm2_66/glibmm2_66.mk b/package/glibmm2_66/glibmm2_66.mk
index 7f28342c52..bbf1a97f3f 100644
--- a/package/glibmm2_66/glibmm2_66.mk
+++ b/package/glibmm2_66/glibmm2_66.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIBMM2_66_VERSION_MAJOR = 2.66
-GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).6
+GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).8
 GLIBMM2_66_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM2_66_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM2_66_SOURCE = glibmm-$(GLIBMM2_66_VERSION).tar.xz
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
