Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533EFEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 12:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E14A160BEA;
	Sun, 25 Jun 2023 12:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E14A160BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BMDe4zz-mrc7; Sun, 25 Jun 2023 12:49:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16EC560E30;
	Sun, 25 Jun 2023 12:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16EC560E30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7BC51BF870
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 12:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE68860BD3
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 12:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE68860BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1tzBoD2vK7a for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 12:49:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9070A60BCA
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9070A60BCA
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:49:04 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 05B345FD05;
 Sun, 25 Jun 2023 15:49:02 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Sun, 25 Jun 2023 15:48:59 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Sun, 25 Jun 2023 15:48:47 +0300
Message-ID: <20230625124848.1423168-1-ovlevin@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/25 08:59:00 #21574316
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1687697342;
 bh=wjeUba1XAx81v4RLCqIlUbtPq6yUtNutmP8mfsmNOOI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=Gi3KEZixG8AdNFH8CqxqoOlt7Sog8TuYO6/0+4Q455EMOWJueNJ5Yq/c081M8WIiR
 S6TZq6pboKiyIMXuQtWDk2x5Gm7sAmnKMmZkQ+rmdvStlr8nytDFvuRzr7rKD3h1jv
 rRLyeJgPz+oXN7tj3QLIEQN70VfLWk9+htNO1ox2AnvQZLDCcFmvjVo1ZnrMLNuo7N
 yqH19SodRNFsSMs/J4NvTKkayhfhwGOK5WQ1tY5oif3gVPZTs87GGxatIHsCno1Yg/
 ZjuvN5iFdgftBWkqEZJiuiI21Zq06fmkZkdb1QYrWDbq8dMhPSLcgPbF6aQcqvrQeY
 QIyDOn5g7AsWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=Gi3KEZix
Subject: [Buildroot] [PATCH 1/2] package/libcgroup: bump to version 2.0.3
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
From: Oleg Lyovin via buildroot <buildroot@buildroot.org>
Reply-To: Oleg Lyovin <ovlevin@sberdevices.ru>
Cc: olegartys@gmail.com, Oleg Lyovin <ovlevin@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/libcgroup/libcgroup/releases/tag/v2.0.3

Also remove redundant LIBCGROUP_SOURCE definition.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
---
 package/libcgroup/libcgroup.hash | 4 ++--
 package/libcgroup/libcgroup.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libcgroup/libcgroup.hash b/package/libcgroup/libcgroup.hash
index 70671212ef..65b98d94e2 100644
--- a/package/libcgroup/libcgroup.hash
+++ b/package/libcgroup/libcgroup.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libcgroup/libcgroup/releases/download/v0.42.2/libcgroup-0.42.2.tar.bz2.sha256
-sha256  18939381324d418e11be4f5fdca37b01652c18917bfaf1f6b0c505f157e18d07  libcgroup-0.42.2.tar.bz2
+# From https://github.com/libcgroup/libcgroup/releases/download/v2.0.3/libcgroup-2.0.3.tar.gz.sha256
+sha256  b29b5704de3d0fadf199fe4e17eeeaecba7f0dd1b85569c96eec37c7672e3026  libcgroup-2.0.3.tar.gz
 
 # Hash for license file
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index 156b066162..fb0b646c51 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-LIBCGROUP_VERSION = 0.42.2
-LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
+LIBCGROUP_VERSION = 2.0.3
 LIBCGROUP_SITE = https://github.com/libcgroup/libcgroup/releases/download/v$(LIBCGROUP_VERSION)
 LIBCGROUP_LICENSE = LGPL-2.1
 LIBCGROUP_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
