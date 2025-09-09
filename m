Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC97BCA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 13:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFAB141245;
	Tue,  9 Sep 2025 13:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBYqrHILPBwn; Tue,  9 Sep 2025 13:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B97A411E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B97A411E5;
	Tue,  9 Sep 2025 13:00:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 890FE186
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B3DB83C28
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2-LlnHDP0FB for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 13:00:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C36983183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C36983183
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C36983183
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DD41CC8EC7C
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C39D760630
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1A72B102F28A7; 
 Tue,  9 Sep 2025 15:00:01 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  9 Sep 2025 14:08:16 +0200
Message-ID: <20250909120822.1069595-12-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757422801; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=odnKTHXD5Y7TqS9NRaQkmmJYPJZvBqtXTtsaIVpKfmQ=;
 b=YpPgSHlAUbaTODRIemND8HqIYmTmX4WSDXLzpyui61zRLaTxJC1Kpd2YTsJdW/Ke7gfRtE
 Yy1CC1tbejgTcnvVi8w8CasoG7UJ5lbfsuZbBO1gDx7HtgDZRW1faGuhOeKGKcUiHFHc2K
 A1bnM3BwdoKpYfVB3liXOoWxE+nwbvlZW0RT20R/qT1x2cbNSRFsjKEMAKpoLlejnsahFi
 aoHfEiLSgfV3xta5R0nZBjcS5Wh6X9wRkvTV9oIuNYWIgj9g8rL2UILe4uhNoSJdDAsMxe
 Ut9Zf9riZdGG8TkfPZjGaprW1lubcyzEiQXHgO0C8SqcjiHTagZzb4WBSr5Ibw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=YpPgSHlA
Subject: [Buildroot] [PATCH 11/11] package/semodule-utils: bump to version
 3.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
https://github.com/SELinuxProject/selinux/releases/download/3.9/RELEASE-3.9.txt

Notable changes:
* semodule: Add [-g PATH |--config=PATH] for an alternate path for the semanage config

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/semodule-utils/semodule-utils.hash | 2 +-
 package/semodule-utils/semodule-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index 011833027c..65d34a0fce 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  7705b0db059c53a21d6a77c0b50f6c467d91a0ea92ff875f1c93527cd2762395  semodule-utils-3.8.1.tar.gz
+sha256  729be36e4726c5d0833732681a94b2e0e4aff973c076504e41f8547abb6c5424  semodule-utils-3.9.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index ae32e6cd80..75955845df 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 3.8.1
+SEMODULE_UTILS_VERSION = 3.9
 SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SEMODULE_UTILS_VERSION)
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
