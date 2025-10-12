Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F994CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 21:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21ADE605B7;
	Sun, 12 Oct 2025 21:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfFiBWjCozFo; Sun, 12 Oct 2025 21:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 876C9605A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 876C9605A8;
	Sun, 12 Oct 2025 21:32:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E2312B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C5EB813F9
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHcVUXaePKtC for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 21:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E5DE813ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E5DE813ED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E5DE813ED
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 21:32:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A1F7A4C671E;
 Sun, 12 Oct 2025 23:31:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37338)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v83fJ-000000000qb-3MYr;
 Sun, 12 Oct 2025 21:31:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sun, 12 Oct 2025 23:31:41 +0200
Message-ID: <20251012213141.3512892-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012213141.3512892-1-bernd@kuhls.net>
References: <20251012213141.3512892-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760304702;
 bh=UYI4eQj6iaqL3Kw4YtIjJE3s394djGXpUyVcEUF+uA0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XcscnPO20vQ2ZuqaJaniwZXj7+PBRtF+CxFPMHRyXS7Pb/LQbVQCHQd6vNMwNDLAu
 hMrLy/dPHCMCPDogqejSM8HtEhTlnyS+HGql9LMXiK2FczlWANJCE0CeiDMTpWJl4j
 76OyEERXv6OXVX4dJHMTKvYTSEtxZEsVj1tq5uusgBjufd0TxsFYV3zBpKHvPO71Cc
 uakcBxMLL+8uTsYd+dBArNGVTSDbP+i3WGjmt5dKU/f9Mmgdg4An9onrGkmbRBEOZl
 62XXJdRVz8UP3izSbN9nGbVSB8h4jCNy3cZEYj3mznRFxECCxFOyyqlBCk/lCG8XHQ
 f4ija+ytKd58w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=XcscnPO2
Subject: [Buildroot] [PATCH 3/3] package/libxslt: security bump version to
 1.1.43
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

Release notes:
https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.news

Fixes CVE-2025-24855 & CVE-2024-55549.

Switched _LICENSE_FILES to Copyright due to upstream commit
https://gitlab.gnome.org/GNOME/libxslt/-/commit/29938a64f6449aceb3e97a9e8da10abe2e27a314
in version 1.1.36 and the removal of COPYING in the 1.1.43 tarball,
although COPYING did still exist in the 1.1.42 tarball.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxslt/libxslt.hash | 6 +++---
 package/libxslt/libxslt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index dd67940c8a..98c68eded1 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.42.sha256sum
-sha256  85ca62cac0d41fc77d3f6033da9df6fd73d20ea2fc18b0a3609ffb4110e1baeb  libxslt-1.1.42.tar.xz
+# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.sha256sum
+sha256  5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a  libxslt-1.1.43.tar.xz
 
 # Hash for license file:
-sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
+sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  Copyright
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index b5bb22f9ae..e92b383b89 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.42
+LIBXSLT_VERSION = 1.1.43
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
-LIBXSLT_LICENSE_FILES = COPYING
+LIBXSLT_LICENSE_FILES = Copyright
 LIBXSLT_CPE_ID_VENDOR = xmlsoft
 
 LIBXSLT_CONF_OPTS = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
