Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3414DCE7CE6
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 07:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E75403C1;
	Tue,  1 Oct 2024 07:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwrH49_qBa7U; Tue,  1 Oct 2024 07:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82DF5403E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82DF5403E1;
	Tue,  1 Oct 2024 07:58:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAE621BF284
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 07:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA3518110A
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 07:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjZYkW9QNZo5 for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 07:58:13 +0000 (UTC)
X-Greylist: delayed 306 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 01 Oct 2024 07:58:12 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9B1980E08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9B1980E08
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.98;
 helo=smtprelay05.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de
 [80.67.31.98])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9B1980E08
 for <buildroot@busybox.net>; Tue,  1 Oct 2024 07:58:12 +0000 (UTC)
Received: from [84.191.232.240] (helo=mail.go-sys.de)
 by smtprelay05.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98)
 (envelope-from <mf@go-sys.de>) id 1svXgs-0000000051r-195l
 for buildroot@busybox.net; Tue, 01 Oct 2024 09:53:02 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Oct
 2024 09:53:01 +0200
Received: from go-sys.de (192.168.1.175) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.39 via Frontend Transport;
 Tue, 1 Oct 2024 09:53:01 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Tue, 1 Oct 2024 09:53:01 +0200
Message-ID: <20241001075301.28132-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/pure-ftpd: bump version to 1.0.52
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
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version fixes an out-of-bound reads in the MLSD command, so upgrading is recommended.
It also improves compatibility with various systems.

Update the COPYING hash because of a change in copyright year

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/pure-ftpd/pure-ftpd.hash | 4 ++--
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index 4cbbfa15ad..2c7a1849ff 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  622360b86c60b563abe0e994f0a86cfe5ccfde597b29a14b0a79b6e5aa05a304  pure-ftpd-1.0.51.tar.bz2
-sha256  88c813191c1a59213c641e322cf4562618ab0116ddd7c8341c419f8863b8b0a9  COPYING
+sha256  b3b879468275e0344555458c8e62465dcf525205ecf9ad78c3f208557d0c1947  pure-ftpd-1.0.52.tar.bz2
+sha256  1ec531b1bc4035019545d6a83e260a5a56d3a6bec52895393e9f25965e608e85  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 2c01bc8804..fb247f51ca 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.51
+PURE_FTPD_VERSION = 1.0.52
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
