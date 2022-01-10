Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C929C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 15:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FAAE405FB;
	Mon, 10 Jan 2022 15:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbM4Pba161A3; Mon, 10 Jan 2022 15:18:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38870404C6;
	Mon, 10 Jan 2022 15:18:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B57B91BF372
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 15:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F7AE813D2
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 15:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AoSIDSCQACj for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 15:18:23 +0000 (UTC)
X-Greylist: delayed 00:05:15 by SQLgrey-1.8.0
Received: from smtprelay06.ispgateway.de (smtprelay06.ispgateway.de
 [80.67.18.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B8F0813B2
 for <buildroot@busybox.net>; Mon, 10 Jan 2022 15:18:23 +0000 (UTC)
Received: from [91.21.118.156] (helo=exchange.go-sys.de)
 by smtprelay06.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1n6wKo-0003eY-NG
 for buildroot@busybox.net; Mon, 10 Jan 2022 16:11:46 +0100
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2375.17; Mon, 10
 Jan 2022 16:13:03 +0100
Received: from go-sys.de (192.168.1.113) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2375.17 via Frontend Transport;
 Mon, 10 Jan 2022 16:13:03 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Mon, 10 Jan 2022 16:13:02 +0100
Message-ID: <20220110151302.21093-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/rtl8723bu: bump version to
 d34603a39a7c925d810fe17c6e8dea5063d43a33
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

patch 0001: Disable concurrrent mode. This causes disconnections.

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/rtl8723bu/0001-disable_concurent_mode.patch | 12 ++++++++++++
 package/rtl8723bu/rtl8723bu.hash                    |  2 +-
 package/rtl8723bu/rtl8723bu.mk                      |  2 +-
 3 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 package/rtl8723bu/0001-disable_concurent_mode.patch

diff --git a/package/rtl8723bu/0001-disable_concurent_mode.patch b/package/rtl8723bu/0001-disable_concurent_mode.patch
new file mode 100644
index 0000000000..037b1642fc
--- /dev/null
+++ b/package/rtl8723bu/0001-disable_concurent_mode.patch
@@ -0,0 +1,12 @@
+diff -purN a/Makefile b/Makefile
+--- a/Makefile	2021-11-04 20:36:55.000000000 +0100
++++ b/Makefile	2022-01-10 14:35:17.333934039 +0100
+@@ -18,7 +18,7 @@ EXTRA_CFLAGS += -Wno-unused-label
+ EXTRA_CFLAGS += -Wno-unused-parameter
+ EXTRA_CFLAGS += -Wno-unused-function
+ EXTRA_CFLAGS += -Wno-unused
+-EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
++#EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
+ 
+ ccflags-y += -D__CHECK_ENDIAN__
+ 
diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 04bc776a07..df990a8d63 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  4c7314dccebda1e55ec8dcf0d5ca8915c2490d17a9f56923f25e6e0e945c10cc  rtl8723bu-9ce1c38439f4f574bb7adaf33949835c25536a28.tar.gz
+sha256  c9cde757941c88c6117560a2c350dc9c4382dcd6a313b1cae7c6e7eade7055bf  rtl8723bu-d34603a39a7c925d810fe17c6e8dea5063d43a33.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index c35fad5832..e73987cfeb 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 9ce1c38439f4f574bb7adaf33949835c25536a28
+RTL8723BU_VERSION = d34603a39a7c925d810fe17c6e8dea5063d43a33
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
