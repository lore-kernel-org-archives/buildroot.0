Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61417CCD192
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 13:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2A3611F0;
	Tue, 14 Oct 2025 13:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68NCVr2vPY4w; Tue, 14 Oct 2025 13:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FCD6611CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FCD6611CB;
	Tue, 14 Oct 2025 13:05:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8307BBC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 13:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74A7940BBC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 13:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNGySIigINa0 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 13:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC44E40BE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC44E40BE4
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC44E40BE4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 13:04:55 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v8ehv-009PNt-TP; Tue, 14 Oct 2025 15:04:52 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 626eb593;
 Tue, 14 Oct 2025 13:04:50 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 14 Oct 2025 16:04:49 +0300
Message-ID: <20251014130450.3631335-1-aperez@igalia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k/OCoz6B0wuSABDypgHJ73R0rSbRSQtl0DXiPnoCE0c=; b=U3Z2oybptQ1e23E4D+dC/kKQhq
 T4KEqXOB4Lf56yrHA+Peupw90Cn45Aip6YkNfdPEnMN2nZFhM10z/l5SCrTvgM817JNnCvy9okljp
 2iYkj3V4iPJ/63cf2o2CN9nnaMO30ikOHVqBW10pIwHgD9T7IikEjRCvqRETTLUFlUD5ln7FeTuQY
 pTSXt957Wgma6CURlnEf9dK/AWbzMBmMwgeoWQLB2eZnjzq61iSfFXwHuvBEZbP00gpoCprpV0DV9
 QblgsL4ezXhD/JjRyKOB4kwkRplX8IzISKO9CKi9QmK8iJLd8KnwmcciIpmdCUgn8ZzauOzsQ0bz/
 Xy4JX6Og==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=U3Z2oybp
Subject: [Buildroot] [PATCH] package/libmanette: bump to version 0.2.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix version, the only changes listed in the release notes are updated
mappings in the controller database:

  https://gitlab.gnome.org/GNOME/libmanette/-/blob/0.2.13/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libmanette/libmanette.hash | 4 ++--
 package/libmanette/libmanette.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
index dac0d3707e..f2974ca059 100644
--- a/package/libmanette/libmanette.hash
+++ b/package/libmanette/libmanette.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.12.sha256sum
-sha256  48b349267180f1dc34d405a9e1e90ba16f054a19ce907930e679493d911ea1d8  libmanette-0.2.12.tar.xz
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.13.sha256sum
+sha256  287cc2fde0de092919366af757d85e7b3a0248eb1b395344726e97955a77d8ae  libmanette-0.2.13.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index b67f2cc086..c320b84840 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMANETTE_VERSION_MAJOR = 0.2
-LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).12
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).13
 LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
 LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
 LIBMANETTE_LICENSE = LGPL-2.1+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
