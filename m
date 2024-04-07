Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757CACD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 09:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A0B281DD8;
	Sun,  7 Apr 2024 09:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZXXoqrzITfi; Sun,  7 Apr 2024 09:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 822EA81DAB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 822EA81DAB;
	Sun,  7 Apr 2024 09:34:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36DB11BF296
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22AD6608E2
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWeZZ0_9CGhx for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 09:34:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 091E4608E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 091E4608E0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 091E4608E0
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 09:34:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 96F22240002;
 Sun,  7 Apr 2024 09:34:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 11:34:07 +0200
Message-ID: <20240407093409.1273632-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712482450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=q5i6+WCUc28AP4ec8xKww9sqq+dokcbELdXiRGJFtVk=;
 b=oJyJbF1r0y5H42yDi17VKk+LpH/B4poY3YD+/Ux7xmnLkmHBxpuoN4yY/45ARZiuRHobzs
 xr9PCyrcQup0ZEwxYAXFurBQUYF4vC6LFnEUegok3fto3JuWMdT2knGEnBZgy3Q3peIBI1
 DIozcsdyU6Uf9qz3kHCuTX8DIp4/ZCGmz3zUYZLohMsOlICwAkzEZFMckGozBEuEeztDMb
 nZfqaeBksSZJn88kLmcv/XSzUu+2eooZitY+CV29fVtE1BGCnDM8gFVze8J0YLbcVpjXSo
 biWzYYWVL+3fwWBKgJJ1PrBeEPnzPcK2fKhpQNrPvzF/3TfGp6BqocZX9PvkpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oJyJbF1r
Subject: [Buildroot] [PATCH] package/gdb: bump 14.x series from 14.1 to 14.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to https://www.sourceware.org/gdb/:

 This is a minor corrective release over GDB 14.1, fixing the following issues:

    PR symtab/31112 (DLL export forwarding is broken)
    PR c++/31128 (gdb crashes when trying to print a global variable stub without a running inferior)
    PR tdep/31254 ([gdb/tdep, arm] FAIL: gdb.threads/staticthreads.exp: up 10)
    PR gdb/31256 (Crash with basic 'list .')
    PR python/31366 (Frame.static_link() segfaults)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 2 +-
 package/gdb/gdb.hash       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 891e45948e..53706cd3ee 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -67,5 +67,5 @@ config BR2_GDB_VERSION
 	default "13.2"     if BR2_GDB_VERSION_13 || !BR2_PACKAGE_HOST_GDB
 	# When making 14.x the default, or 14.x becomes the oldest version,
 	# be sure to update the target variant to properly select mpfr.
-	default "14.1"     if BR2_GDB_VERSION_14
+	default "14.2"     if BR2_GDB_VERSION_14
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index c62da28cbf..144f6da296 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,7 +3,7 @@ sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb748
 sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
 sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz
 sha512  8185d3e11ab60dafff5860a5016577bfe7dd7547ef01ebc867bc247603d82b74ff74c4f29492c7d2aee57076f52be33e289f4c6b414a4b870d4b3004909f4c34  gdb-13.2.tar.xz
-sha512  575e198105076fc4a88f68591aa114ab9c1196e84386a3f7b9b58fe5f30cdeed33f6a5f957b68f08c47284ec922bb60c964627e238471419673fd913575ce427  gdb-14.1.tar.xz
+sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
