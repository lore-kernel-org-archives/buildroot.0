Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8B1C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D15E56061C;
	Mon,  3 Jun 2024 07:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHvimoYrPOCE; Mon,  3 Jun 2024 07:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E89CD60AF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E89CD60AF5;
	Mon,  3 Jun 2024 07:18:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 084F51BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E41168420E
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AWK8beqDbhd for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:17:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C169884240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C169884240
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C169884240
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:17:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 013BBE0005;
 Mon,  3 Jun 2024 07:17:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sE1wo-002EdQ-1R;
 Mon, 03 Jun 2024 09:17:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 09:17:23 +0200
Message-Id: <20240603071726.532652-20-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603071726.532652-1-peter@korsgaard.com>
References: <20240603071726.532652-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 20/23] package/zip: download from sourceforge
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
Cc: Jan Pedersen <jp@jp-embedded.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The tarball (with .tar.gz extension but same content) is also available over
https from sourceforge, so use that instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zip/zip.hash | 2 +-
 package/zip/zip.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/zip/zip.hash b/package/zip/zip.hash
index eb4bbf3b03..cbb96beb31 100644
--- a/package/zip/zip.hash
+++ b/package/zip/zip.hash
@@ -1,3 +1,3 @@
 # Locally calculated from download (no sig, hash)
-sha256  f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369  zip30.tgz
+sha256  f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369  zip30.tar.gz
 sha256  8ecd6c1bab449127eb665cef1561e73a8bce52e217375f6f466939e137b1e110  LICENSE
diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 3aa59e7ba7..0457ba9414 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ZIP_VERSION = 3.0
-# The version is really 3.0, but the tarball is named zip30.tgz
-ZIP_SOURCE = zip$(subst .,,$(ZIP_VERSION)).tgz
-ZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
+# The version is really 3.0, but the tarball is named zip30.tar.gz
+ZIP_SOURCE = zip$(subst .,,$(ZIP_VERSION)).tar.gz
+ZIP_SITE = https://sourceforge.net/projects/infozip/files/Zip%203.x%20%28latest%29/$(ZIP_VERSION)
 ZIP_LICENSE = Info-ZIP
 ZIP_LICENSE_FILES = LICENSE
 ZIP_CPE_ID_VENDOR = info-zip_project
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
