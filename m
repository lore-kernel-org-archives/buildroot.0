Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A676BC52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 17:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0318C40AE2;
	Tue, 13 Aug 2024 17:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hd_EqPZhZSR; Tue, 13 Aug 2024 17:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5477D40A95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5477D40A95;
	Tue, 13 Aug 2024 17:28:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC4991BF5AD
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 17:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8EE6403CA
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 17:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_WSKVEcZW6f for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 17:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B7AC403C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B7AC403C9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B7AC403C9
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 17:28:19 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DA29AB00572;
 Tue, 13 Aug 2024 19:28:13 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Aug 2024 19:28:02 +0200
Message-ID: <20240813172802.137236-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723570096;
 bh=9ZLzSwP52pReeqHhpBFWUwat4w0Hnff1WrMVwssOkA4=;
 h=From:To:Cc:Subject:Date:From;
 b=Ro3B/JYLGOAFUDhgBlMT/C0HgrwLvKeZ61j7MI8FvREQ1jMa3L7EHQrqEJ/yMI18C
 HYkPiiSiBqqFny+bMg67rwxTIi20d1T2wb6Yak5uS4ABGW72g7dnJb73AUuryYF52Q
 Sjm3DiC/gr14WVwM5coq/eGjmuXsaCOH83Kmt+oE5ihL/JOumo/97B/EF9Vp9Nxid2
 cXB/MIwX8oN0GIVx8paLyz0B/zo7cd+e8RSJKRqGpEEClcgvRs4F84KMQcFOOuJtha
 I0+wd1agSOLAtNzW7607/zyjWEncjc4KLPmgjiB1vD4WFk7AcNyaBWkHm/3mRcKNtC
 1/oDMRar6tPhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ro3B/JYL
Subject: [Buildroot] [PATCH next 1/1] package/volk: bump to version 3.1.2
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
Cc: Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes since v3.0.0, see:
https://www.libvolk.org/release-v310.html
https://www.libvolk.org/release-v311.html
https://www.libvolk.org/release-v312.html

Fixes:
http://autobuild.buildroot.org/results/82cb35e9be6a57539d4e370ab2c4a4fae9d8b5d8/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/volk/volk.hash | 2 +-
 package/volk/volk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/volk/volk.hash b/package/volk/volk.hash
index 8047a68bab..3a363f0357 100644
--- a/package/volk/volk.hash
+++ b/package/volk/volk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  88fd80638a3683f23a8cae6c551a8cfe9ea55735c701846f3eeeeeea8a14f6a3  volk-3.0.0.tar.xz
+sha256  ce62f645c2ee3ef8b38f923de78ef4df9a1b7696d618f57781955803ee29bab3  volk-3.1.2.tar.xz
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING
diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index 67475d5c90..396f4e6e8b 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VOLK_VERSION = 3.0.0
+VOLK_VERSION = 3.1.2
 VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
 VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
 VOLK_LICENSE = LGPL-3.0+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
