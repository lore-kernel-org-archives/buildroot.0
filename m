Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23B6C021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 13:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A38E840C85;
	Thu, 20 Feb 2025 13:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJedBpkG73vA; Thu, 20 Feb 2025 13:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CEE440DB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CEE440DB5;
	Thu, 20 Feb 2025 13:39:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31711194
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15C0483B00
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 13:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaGxo0EXJi-u for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 13:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.36;
 helo=smtprelay02.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02A7983AEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02A7983AEC
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
 [80.67.31.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02A7983AEC
 for <buildroot@busybox.net>; Thu, 20 Feb 2025 13:39:10 +0000 (UTC)
Received: from [91.21.124.170] (helo=mail.go-sys.de)
 by smtprelay02.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98)
 (envelope-from <mf@go-sys.de>) id 1tl68W-000000005F8-3PFc
 for buildroot@busybox.net; Thu, 20 Feb 2025 13:58:40 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.43; Thu, 20 Feb
 2025 13:59:07 +0100
Received: from go-sys.de (192.168.1.210) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.43 via Frontend Transport;
 Thu, 20 Feb 2025 13:59:07 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>
Date: Thu, 20 Feb 2025 13:59:00 +0100
Message-ID: <20250220125900.5637-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/openssh: security bump version to 9.9p2
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

Release note: https://www.openssh.com/txt/release-9.9p2

Fixes: CVE-2025-26465 (ssh) , CVE-2025-26466 (sshd)

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 5758ce4f36..0bbc4874df 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.9
-sha256  b343fbcdbff87f15b1986e6e15d6d4fc9a7d36066be6b7fb507087ba8f966c02  openssh-9.9p1.tar.gz
+# From https://www.openssh.com/txt/release-9.9p2
+sha256  91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673  openssh-9.9p2.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 95c059e03d..115290ce13 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENSSH_VERSION_MAJOR = 9.9
-OPENSSH_VERSION_MINOR = p1
+OPENSSH_VERSION_MINOR = p2
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
