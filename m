Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6A2CAC5B8
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 12:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFC7A845B1;
	Thu,  2 Oct 2025 12:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCgLicWAqXPb; Thu,  2 Oct 2025 12:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1A4845DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD1A4845DD;
	Thu,  2 Oct 2025 12:47:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 118C21CE
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 12:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0304C84611
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 12:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGR7lQM4sbeM for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 12:47:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.35;
 helo=smtprelay01.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1084845DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1084845DD
Received: from smtprelay01.ispgateway.de (smtprelay01.ispgateway.de
 [80.67.31.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1084845DD
 for <buildroot@busybox.net>; Thu,  2 Oct 2025 12:47:39 +0000 (UTC)
Received: from [84.146.212.120] (helo=mail.go-sys.de)
 by smtprelay01.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98)
 (envelope-from <mf@go-sys.de>) id 1v4IZY-000000005yf-1lqU
 for buildroot@busybox.net; Thu, 02 Oct 2025 14:38:12 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.59; Thu, 2 Oct
 2025 14:38:25 +0200
Received: from go-sys.de (192.168.1.81) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.59 via Frontend Transport; Thu, 2 Oct 2025
 14:38:25 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>
Date: Thu, 2 Oct 2025 14:38:23 +0200
Message-ID: <20251002123824.1033833-1-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/libopenssl: bump version to 3.5.4
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

Security patch release.
The most severe CVE fixed in this release is Moderate.

This release incorporates the following bug fixes and mitigations:

- Fix Out-of-bounds read & write in RFC 3211 KEK Unwrap.
  (CVE-2025-9230)

- Fix Timing side-channel in SM2 algorithm on 64 bit ARM.
  (CVE-2025-9231)

- Fix Out-of-bounds read in HTTP client no_proxy handling.
  (CVE-2025-9232)

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index d0ca45d303..e78b664aa5 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz.sha256
-sha256  c9489d2abcf943cdc8329a57092331c598a402938054dc3a22218aea8a8ec3bf  openssl-3.5.3.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
+sha256  967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  openssl-3.5.4.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index b892d4e236..2f844fd44a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.3
+LIBOPENSSL_VERSION = 3.5.4
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
