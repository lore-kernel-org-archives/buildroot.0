Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A005CA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 19:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5305280CF0;
	Thu,  4 Sep 2025 19:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbvoO1Ci3kGi; Thu,  4 Sep 2025 19:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8E5080CEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8E5080CEC;
	Thu,  4 Sep 2025 19:58:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8384C111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69C1A60712
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkqtV4C_NmsQ for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 19:58:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C8956064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C8956064E
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C8956064E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:58:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BCECC1814B9; Thu,  4 Sep 2025 21:58:42 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu,  4 Sep 2025 21:58:07 +0200
Message-ID: <20250904195812.3259342-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1757015923; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=5xzuOjZhmWhdNRFIx7K5mAil1IhVFG5ffLN9xQQB1Mk=;
 b=HU6im8JA98LlHd5lnFZ4+ULjYO85RowpXh8gu4te31j/nzcwc+Bef8sR9GWipkLA4DdS7Y
 VekcORVnPcu3gdeTNO6/fWEZZL6ZkNWwc7ZNQgL/xMhwYPhhmSYW68dr9ezn/QVghJGCiv
 eaIFxdw4RddMJ1v1EmnRJXofq/7IJEo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=HU6im8JA
Subject: [Buildroot] [PATCH v2 1/2] package/libcpprestsdk: add dependency on
 Boost.System
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcpprestsdk searches for the Boost.System module in its
CMakeLists. Hence it should be selected as a dependency.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libcpprestsdk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index e533b30393..7688021ed0 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_RANDOM
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_OPENSSL
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
