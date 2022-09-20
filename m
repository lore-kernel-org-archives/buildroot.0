Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E0FC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 23:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ACD060FD7;
	Tue, 20 Sep 2022 23:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ACD060FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-DXutnjbMJx; Tue, 20 Sep 2022 23:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BDD460FC1;
	Tue, 20 Sep 2022 23:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BDD460FC1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45EE91BF5A0
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 23:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20A3D82A83
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 23:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20A3D82A83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBTXEFhFB7e0 for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 23:23:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C52C782983
Received: from mail.sberdevices.ru (mail.sberdevices.ru [45.89.227.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C52C782983
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 23:23:10 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mail.sberdevices.ru (Postfix) with ESMTP id 7FB225FD0A;
 Wed, 21 Sep 2022 02:23:07 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mail.sberdevices.ru (Postfix) with ESMTP;
 Wed, 21 Sep 2022 02:23:07 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Wed, 21 Sep 2022 02:21:54 +0300
Message-ID: <20220920232154.1219792-2-KAMenyaev@sberdevices.ru>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
References: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2022/09/20 19:08:00 #20341110
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1663716187;
 bh=XFOeTUJLb6EmkDKTU35s8LqFO6d+cxSfftyNmIBPXME=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=Wipz0fVtO8lutMBceakDGNTad2YgUtRzkdRCi5GjlQzAWDJRAML7lezx+SCc+aayv
 0QLOCofQ0qlg5doqHI4mVACJt92q+lWrTJIOm1D40D4GhaTVrg7A6fXQm99FfSvEuv
 xSG4woCbWkAeUNSfMa5H6JlcwVGQwrmRPRb8U5kboqr+dbhVElP5cfaYVXHTv2PcwQ
 MA2r7OJHPGcJKRImdTULVk+hfhMGJbkhJysUM+z11K/GlkK28l9wLbtmorMvB5Ubk7
 0024radppON43NEdWnz+5xJ7gP/XeW+P7tP72EwVaJj6hINbGoZoDwcMVwtM4bwItx
 nrCDD2NTORnfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=Wipz0fVt
Subject: [Buildroot] [PATCH 2/2] package/crudini: add host-crudini
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
From: Konstantin Menyaev via buildroot <buildroot@buildroot.org>
Reply-To: KAMenyaev@sberdevices.ru
Cc: Konstantin Menyaev <KAMenyaev@sberdevices.ru>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 sdfw_system_team@sberdevices.ru, Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>

Make the host variant of crudini package. This can be useful in
post-{build,image} scripts.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
---
 package/Config.in.host         | 1 +
 package/crudini/Config.in.host | 9 +++++++++
 package/crudini/crudini.mk     | 1 +
 3 files changed, 11 insertions(+)
 create mode 100644 package/crudini/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index fb805577d1..055e846e39 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -12,6 +12,7 @@ menu "Host utilities"
 	source "package/checksec/Config.in.host"
 	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
+	source "package/crudini/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
 	source "package/delve/Config.in.host"
diff --git a/package/crudini/Config.in.host b/package/crudini/Config.in.host
new file mode 100644
index 0000000000..5e0040883f
--- /dev/null
+++ b/package/crudini/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_CRUDINI
+	bool "host crudini"
+	depends on BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON_INIPARSE # runtime
+	help
+	  A utility for handling ini files from the command line and
+	  shell scripts
+
+	  https://pypi.python.org/pypi/crudini
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index 7141e2b2a0..c376c5f777 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -11,3 +11,4 @@ CRUDINI_LICENSE = GPL-2.0
 CRUDINI_LICENSE_FILES = COPYING
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
