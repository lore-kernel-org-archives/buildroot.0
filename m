Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068C3C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 16:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADCF441981;
	Wed, 15 Jun 2022 16:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FInFMNtuw8uD; Wed, 15 Jun 2022 16:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AEF14034A;
	Wed, 15 Jun 2022 16:19:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00E521BF4DB
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4A3282DE6
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id stGdRXSRtksY for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 16:18:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4623A82DD9
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 16:18:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k19so16040027wrd.8
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6xZP0aTrk8glhmjBBtQA9YdnRMdFSWin5wzjcWYJhIA=;
 b=oUC6scyDRzGgDhtL5HRr+FNWkll7TjZm+tB1cMarkNcLJ8tdYfgq0lLzFU0O4InvED
 Dorch9SGY6TwMuAMcR872uGJv+9X5qNXVY8RHyzM6rBpJhisE4nmQMTWuizpg+jbfO1s
 Bklg4K+1xEq45K6KDF5Q62KHd/+JJ7T+B/W0c/xhgv82rT0bwVTdShA8HTewFBRJKw3+
 /syzyEt/rZ1hi3JtMLm7sv3+HVZdU5S62GxYQI1+GR1LHx7Gqi5mrFNMhyEYBBSydsOR
 PBQRsxcXP9yl4cOq8Awbekve0nbsP38jBapl8//JS7qMPZeNTpSWODm07CDsIDJiKAHQ
 hRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6xZP0aTrk8glhmjBBtQA9YdnRMdFSWin5wzjcWYJhIA=;
 b=TlG2nk7fzRazOsK+Rxcd4cwRSB0iQ8F7U4nqAueNmhBPabQN5M+RzSOdZMrflX7JL+
 cPRrNVsgVmIJEkLxQ7QT4KXw8Pn4LLwvS86/m8KiqpP+3dX1iIbHGpWEWkG2zuIvL/3y
 9OsUEy1+YIaBiPI6uFYHAAJUUnBPINLJQZfUVX48Jo3VSDa7VgAduvyfqetXiVvrgOUF
 ksyue3UD3qkwtaAU+tEpuIhCblwP+kTAPK+OsnaPvRZStI7obsRH5utaVbl2OS2CQ2wI
 uVqXW0bKquOSCG9b4G21jQZ4PLAj6t+FLagJIQd3F/IXXLNSVP48311/F1AB7LGkmuiP
 TFFg==
X-Gm-Message-State: AJIora9pgNetBtX7e1x7XN6hmwplGG45W3KM/TgwhZmacGY9MxRqPP6Y
 AgV+L5BykSvSMMRUsu3mjQVPVpk+FZTGJQ==
X-Google-Smtp-Source: AGRyM1uvk68T873C3jjgEkBLXKQ6Xn2rxA3AbSQjiLOGSEA4zBDFcAkdUhTUub4HkAECSR0Gh4TSUQ==
X-Received: by 2002:adf:fb0d:0:b0:21a:2f42:4f0a with SMTP id
 c13-20020adffb0d000000b0021a2f424f0amr571190wrr.638.1655309889185; 
 Wed, 15 Jun 2022 09:18:09 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g13-20020adffc8d000000b002102f2fac37sm17723325wrr.51.2022.06.15.09.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 09:18:08 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Jun 2022 18:17:53 +0200
Message-Id: <20220615161753.2580142-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220615161753.2580142-1-francois.perrad@gadz.org>
References: <20220615161753.2580142-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/open62541: refactor choice
 UA_NAMESPACE with a proper default
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/Config.in | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index ceca2ca1f..1dad985a7 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -28,15 +28,11 @@ endchoice
 
 choice
 	prompt "namespace zero nodes"
+	default BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED
 	help
 	  Namespace zero contains the standard-defined nodes. The full
 	  namespace zero may not be required for all applications.
 
-config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_DEFAULT
-	bool "default"
-	help
-	  Use the default namespace zero contents.
-
 config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL
 	bool "minimal"
 	help
@@ -91,8 +87,7 @@ config BR2_PACKAGE_OPEN62541_PUBSUB_DELTAFRAMES
 
 config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
 	bool "publish/subscribe information model"
-	depends on BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED || \
-		BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
+	depends on !BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL
 	help
 	  Enable the information model representation of the PubSub
 	  configuration.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
