Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E4EC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 13:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B05A82F4A;
	Tue,  7 Nov 2023 13:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B05A82F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1WTZOVvdONy; Tue,  7 Nov 2023 13:23:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E902A82AC3;
	Tue,  7 Nov 2023 13:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E902A82AC3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E19721BF370
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B55F0822FA
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 13:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B55F0822FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GO46PpvCsyK3 for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 13:23:47 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1617282C4D
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 13:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1617282C4D
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 9449A10001B;
 Tue,  7 Nov 2023 16:23:43 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9449A10001B
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Tue,  7 Nov 2023 16:23:43 +0300 (MSK)
Received: from sberdevices (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 7 Nov
 2023 16:23:43 +0300
To: <buildroot@buildroot.org>
Date: Tue, 7 Nov 2023 16:23:23 +0300
Message-ID: <20231107132323.3324587-1-ovlevin@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181168 [Nov 07 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ovlevin@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4,
 {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;
 p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1; 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/07 09:01:00 #22417210
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1699363423;
 bh=ax1UjLV+Ud1cMMvDx4xUynLK0XhDpjRp1+xlCGuAI70=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=YHbLiZXOEGz1kH/TDCtq4ccjg4kgykBHnph/VhNOJg6smwG14P9zU+ssXGnifvRyg
 zLmptWCMMnYd2GaXaJCPb2YkgrY7b/uazQYuZr14qogsBGgSz85tQrU4mJB71ZX/6W
 9fB9n7e5y2IMbuJ2FEHbqTvmOOwT1AVnPwwZ1U83SAyoD5jfCC642LEZGLEupNkLKT
 cXRmzPVzPwnJkVrXz6DmeSPkPv3Nmbf/B6+v/gfSxDenGJQhO104RN0YzVPLZYyVEC
 MGc1ufwgJUIl02iIfcxM3tCSCPW9pITPuEACoDRwW/T64W5aaBp8S15KEfDAvswyHx
 YkZhaJxrXAg+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=YHbLiZXO
Subject: [Buildroot] [PATCH 1/1] package: dhcpcd: fix dhcpcd binary not
 stripped
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
Reply-To: Oleg Lyovin <ovlevin@salutedevices.com>
Cc: John Stile <johns@msli.com>, olegartys@gmail.com,
 Oleg Lyovin <ovlevin@salutedevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default dhcpcd installed with 555 permissions as it is
configured in its Makefile.inc. Since 'w' bit is missing,
strip fails and dhcpcd binary installed non-stripped.

On ARM GCC 12 glibc configuration strip saves over 1MB of disk space.

Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>
---
 package/dhcpcd/dhcpcd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index a194bce323..ba1481e83d 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -17,6 +17,9 @@ DHCPCD_CONFIG_OPTS = \
 	--os=linux \
 	--privsepuser=dhcpcd
 
+DHCPCD_MAKE_OPTS = \
+	BINMODE=755
+
 ifeq ($(BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP),y)
 DHCPCD_CONFIG_OPTS += --enable-privsep
 else
@@ -43,11 +46,11 @@ define DHCPCD_CONFIGURE_CMDS
 endef
 
 define DHCPCD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(DHCPCD_MAKE_OPTS) all
 endef
 
 define DHCPCD_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(DHCPCD_MAKE_OPTS) install DESTDIR=$(TARGET_DIR)
 endef
 
 # When network-manager is enabled together with dhcpcd, it will use
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
