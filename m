Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C353C4707B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 14:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DDD241761;
	Mon, 15 Jan 2024 14:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DDD241761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcCazSs5fvh1; Mon, 15 Jan 2024 14:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85B8B41753;
	Mon, 15 Jan 2024 14:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85B8B41753
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E91D71BF3CD
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 14:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF3C84175B
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 14:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF3C84175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIztEWK02Ctx for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 14:34:56 +0000 (UTC)
X-Greylist: delayed 420 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 15 Jan 2024 14:34:55 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D98F741753
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D98F741753
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 14:34:55 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id B3ECE100025
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 17:27:52 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B3ECE100025
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 17:27:52 +0300 (MSK)
Received: from sberdevices (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 15 Jan
 2024 17:27:52 +0300
To: <buildroot@buildroot.org>
Date: Mon, 15 Jan 2024 17:27:44 +0300
Message-ID: <20240115142744.70711-1-aolvolk@salutedevices.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182653 [Jan 15 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: aolvolk@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;
 smtp.sberdevices.ru:7.1.1,5.0.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 100.64.160.123:7.1.2; 127.0.0.199:7.1.2;
 0pointer.de:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/01/15 10:51:00
X-KSMG-LinksScanning: Clean, bases: 2024/01/15 10:51:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/01/15 11:31:00 #23194549
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1705328872;
 bh=2WywTXdGmO/LL1BpZ5GMad2onMDK6MDMGoFjaHV8iRA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=WSje1Kb3tdRtZVa/m6MOJ/J40Ap6ypKg5VSIhjZ6DAhpmQAj7LihVmws6jXvtzHbM
 o5QTz+q0LCnjDUapy/uI2JCXThoEbfGkIGECCA0hGEGhrsmFPKBOIU+Z8HzI7QzEUV
 /tQaaL7RGUVecgdqFC3JVXbH0WvvLYeuhgeY8/3GdUEyYZOl+llVuTLRBE3gJn2nHd
 ahrwXvsM6odKSaFgf5W+OQRFgDhn0aY4DquuySU5csTNPbroTlA8Zfppx/yym5yyyy
 npEmASAX3FtteWGKmHUC7oNJlMSJ6xu9ufETCNvZcsG9rpA4oMKKF7jYEb4POpJwOT
 rIOvoqU1j7QUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=WSje1Kb3
Subject: [Buildroot] [PATCH] package/ifplugd: add option to override
 sysconfdir
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
From: Alisa Volk via buildroot <buildroot@buildroot.org>
Reply-To: Alisa Volk <aolvolk@salutedevices.com>
Cc: Alisa Volk <aolvolk@salutedevices.com>, ovlevin@salutedevices.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add BR2_PACKAGE_IFPLUGD_SYSCONFDIR option to pass custom --sysconfdir argument.

Ifplugd init script is auto-generated with sysconfdir="etc/" by default.
As a result path to ifplugd configuration file is hardcoded
to /etc/ifplugd/ifplugd.conf.

This patch allows to override sysconfdir making it possible
to use custom path to configuration file.

Signed-off-by: Alisa Volk <aolvolk@salutedevices.com>
---
 package/ifplugd/Config.in  | 6 ++++++
 package/ifplugd/ifplugd.mk | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/ifplugd/Config.in b/package/ifplugd/Config.in
index c4b5b5b9d1..772c084132 100644
--- a/package/ifplugd/Config.in
+++ b/package/ifplugd/Config.in
@@ -12,3 +12,9 @@ config BR2_PACKAGE_IFPLUGD
 	  configure the interface when a cable is really connected.
 
 	  http://0pointer.de/lennart/projects/ifplugd/
+
+config BR2_PACKAGE_IFPLUGD_SYSCONFDIR
+	string "sysconfdir"
+	default "/etc"
+	help
+	  Path to ifplugd.conf and ifplugd.action files.
diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 6de7f17641..5d7f1562d3 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -13,7 +13,9 @@ IFPLUGD_AUTORECONF = YES
 
 # install-strip unconditionally overwrites $(TARGET_DIR)/etc/ifplugd/ifplugd.*
 IFPLUGD_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
-IFPLUGD_CONF_OPTS = --disable-lynx --with-initdir=/etc/init.d/
+IFPLUGD_CONF_OPTS = --disable-lynx \
+	--with-initdir=/etc/init.d/ \
+	--sysconfdir=$(BR2_PACKAGE_IFPLUGD_SYSCONFDIR)
 IFPLUGD_DEPENDENCIES = libdaemon
 
 define IFPLUGD_INSTALL_FIXUP
-- 
2.39.3 (Apple Git-145)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
