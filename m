Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A32C433FE
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 21:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DBB60FF5;
	Mon,  4 Apr 2022 21:59:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gm7f5YhYky_9; Mon,  4 Apr 2022 21:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4E3C60BF1;
	Mon,  4 Apr 2022 21:59:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 916DE1BF20B
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 21:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F9C3409F5
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 21:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHWk_Gau30Mg for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 21:59:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D671D40253
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 21:59:34 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id n9so4580519plc.4
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 14:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ePzcgGoBmcJEamGtXxwGkUOFbhEgb/IkaL3c46Ahb4=;
 b=dagx6gw+hTl8j/7R9m4rQVhTH1m7mudyBCQH1bzkayXixbiKx9TiTR+Pbjsg4BLEpo
 A8+n+rHkqbL2GadTsWdXnkjVaQIgukjQMOqB1wh0gnt2kQ8jdu8qNpbFqmQSF2VqKfAv
 MogresLWLAUDOFcCCnyX9twM/WmqXT6a/idNr0l8BLSq11X/0UL2jRV6jBBIyGv5ryBX
 e9cUShNZmbcOYCNuCIsbqKTNB3rD34bQxF9sUs+vqY7WdN9BMLSOBro7iYZ58p1/mQmd
 q/sgFHJTyNO0KTMgiinvYT5QU9WcyTErI0iNZu860EgImB+Pn43APGBBGTHaaFQf/xGf
 oWfg==
X-Gm-Message-State: AOAM5313gIHr6XdkuG2fj2DmfEVeVBHZHoPGh+uOCHV74EduzKxdkjfZ
 wMJhETLziIeaDVh5ujMaYrel2wXOzxZh2g==
X-Google-Smtp-Source: ABdhPJz650l8Bv3u+pSLBjxybO//K20VF/Nh7DQRY//tIk8GM1bS1m+py+HBCGvCx98ZaoxGgt8c6w==
X-Received: by 2002:a17:902:e74f:b0:154:6052:55b2 with SMTP id
 p15-20020a170902e74f00b00154605255b2mr294956plf.106.1649109574098; 
 Mon, 04 Apr 2022 14:59:34 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a17090a668f00b001ca8984eeabsm119848pjj.4.2022.04.04.14.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 14:59:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 14:59:30 -0700
Message-Id: <20220404215930.601909-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/runc: bump to version v1.1.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 38d9f52510..fe3c4cc488 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a8de57edbf0ff741ea798ccdd99ac0e1b79914f552871bd7cd92b0569f200964  runc-1.1.0.tar.gz
+sha256  11a34535c108b36fd59de58e7bef3a130444c9ea41e4b8bb8f8d4654c8ad654c  runc-1.1.1.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index a40075544e..2618b71f63 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.0
+RUNC_VERSION = 1.1.1
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
