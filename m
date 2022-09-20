Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E8BC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 23:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF3160F75;
	Tue, 20 Sep 2022 23:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF3160F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W1aBGT_F4-OD; Tue, 20 Sep 2022 23:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC6EC60FE0;
	Tue, 20 Sep 2022 23:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC6EC60FE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4815E1BF9D1
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 23:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2363760FC1
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 23:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2363760FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQmH5ZxOgjhr for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 23:23:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8969760F75
Received: from mail.sberdevices.ru (mail.sberdevices.ru [45.89.227.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8969760F75
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 23:23:10 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mail.sberdevices.ru (Postfix) with ESMTP id 294995FD09;
 Wed, 21 Sep 2022 02:23:06 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mail.sberdevices.ru (Postfix) with ESMTP;
 Wed, 21 Sep 2022 02:23:05 +0300 (MSK)
From: <KAMenyaev@sberdevices.ru>
To: <buildroot@buildroot.org>
Date: Wed, 21 Sep 2022 02:21:53 +0300
Message-ID: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
X-Mailer: git-send-email 2.37.3
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
 d=sberdevices.ru; s=mail; t=1663716186;
 bh=1Z3+cdW/JgHhiR525xXK3IccpVYlmDkw1+TKZJ7eGQg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=OqRmpXvS3dJbc/vWiR5KssbFW3is9QZzMhS1F9vnIuCqyKlZ+KCyZaRrmrCFW+B6F
 dJuEJ7Gp6LMxh90b6G+6cp3tOnqDOpC6dZUSDSgQXBchqxS+Q8QRUyAtOvcJC0kuWw
 kKoY52qDDqC9UGHhe/bnetQuPwnPb7UxC8FCJFx/UKqRcjIZ1AQ/8rE38i3B/gZvlS
 1uh3BmjEOc3BScLJ20TBfGLlMjdE3oJIvTahazIL5tzWZQgf0vII10bWCVAwhVEwZD
 nkbZQylL0bmluLpb+hIcs7tNSf/ylxdvBcMcLgEBitKRWqiG8UI9AIZiJQg9t2tO8C
 wwMEnaU5dfSEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=OqRmpXvS
Subject: [Buildroot] [PATCH 1/2] package/python-iniparse: add
 host-python-iniparse
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
Cc: Konstantin Menyaev <KAMenyaev@sberdevices.ru>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 sdfw_system_team@sberdevices.ru, Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>

Make the host variant of python-iniparse
as host-crudini dependency.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
---
 package/Config.in.host                     |  1 +
 package/python-iniparse/Config.in.host     | 11 +++++++++++
 package/python-iniparse/python-iniparse.mk |  1 +
 3 files changed, 13 insertions(+)
 create mode 100644 package/python-iniparse/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index f437ef680c..fb805577d1 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -72,6 +72,7 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python-iniparse/Config.in.host
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-kflash/Config.in.host"
diff --git a/package/python-iniparse/Config.in.host b/package/python-iniparse/Config.in.host
new file mode 100644
index 0000000000..e93022e815
--- /dev/null
+++ b/package/python-iniparse/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_PYTHON_INIPARSE
+	bool "host python-iniparse"
+	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
+	help
+	  iniparse is an INI parser for Python which is API compatible
+	  with the standard library's ConfigParser, preserves
+	  structure of INI files (order of sections & options,
+	  indentation, comments, and blank lines are preserved when
+	  data is updated), and is more convenient to use.
+
+	  https://pypi.python.org/pypi/iniparse
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
index d31a490bd8..e76987d1e9 100644
--- a/package/python-iniparse/python-iniparse.mk
+++ b/package/python-iniparse/python-iniparse.mk
@@ -12,3 +12,4 @@ PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
 PYTHON_INIPARSE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
