Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6FDC4320A
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 11:21:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B2561151
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 11:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73B2561151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=go-sys.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B95B40230;
	Wed, 25 Aug 2021 11:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19Y5PGRNe0gw; Wed, 25 Aug 2021 11:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 816A7402B7;
	Wed, 25 Aug 2021 11:21:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 702071BF873
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 11:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F83980F42
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 11:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25PYaWtLLGXx for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 11:21:48 +0000 (UTC)
X-Greylist: delayed 02:21:00 by SQLgrey-1.8.0
Received: from smtprelay02.ispgateway.de (smtprelay02.ispgateway.de
 [80.67.18.14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B755880F15
 for <buildroot@busybox.net>; Wed, 25 Aug 2021 11:21:48 +0000 (UTC)
Received: from [84.191.225.2] (helo=exchange.go-sys.de)
 by smtprelay02.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1mIokt-0007Xc-LP
 for buildroot@busybox.net; Wed, 25 Aug 2021 10:59:31 +0200
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2106.2; Wed, 25
 Aug 2021 11:00:43 +0200
Received: from go-sys.de (192.168.1.112) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2106.2 via Frontend Transport;
 Wed, 25 Aug 2021 11:00:43 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Wed, 25 Aug 2021 11:00:40 +0200
Message-ID: <20210825090040.13145-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump version
 to 1.1.1l
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 585486ffbe..93c688d9dd 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1k.tar.gz.sha256
-sha256  892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5  openssl-1.1.1k.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1l.tar.gz.sha256
+sha256  0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1  openssl-1.1.1l.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 389a0a8b32..f139213315 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1k
+LIBOPENSSL_VERSION = 1.1.1l
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
