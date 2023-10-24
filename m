Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ED1C07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 15:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9A744333C;
	Tue, 24 Oct 2023 15:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A744333C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYWSBkPzzsXm; Tue, 24 Oct 2023 15:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5BFA4300E;
	Tue, 24 Oct 2023 15:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5BFA4300E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD591BF947
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 15:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72EA94EF78
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 15:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72EA94EF78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P04sSFlNDREU for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 15:38:46 +0000 (UTC)
X-Greylist: delayed 458 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 24 Oct 2023 15:38:45 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7FC04EF79
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7FC04EF79
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 15:38:44 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 18DF410002A
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 18:31:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 18DF410002A
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 18:31:04 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Tue, 24 Oct 2023 18:31:04 +0300
To: <buildroot@buildroot.org>
Date: Tue, 24 Oct 2023 18:30:23 +0300
Message-ID: <20231024153023.19173-1-sibobrenok@salutedevices.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180845 [Oct 24 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: sibobrenok@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4,
 {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 100.64.160.123:7.1.2;
 127.0.0.199:7.1.2;
 p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s,
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/10/24 14:45:00 #22276099
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1698161465;
 bh=d+iL4r8N7Ri+TQq/YQUQTr4+7RpJtE+kEAy9lxjTVio=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=HJCxdHGFqlUtUcnDKSM1WpY8s0vwy7e2STXF2AmV0HMBFRKgg44G6x2rDvGLou6o0
 liR8/zF+YRKEN57a8jd1xwxaWvbbe6tYnSIkonCMjJAjedsmmpl9F6XdLrbzTx0pLH
 a5C9w6WYmzIsgdHc7q4YSkbGNtsufVaiD6oLxDHD57WiLvPO/13xsMVGZD8ovJvAyF
 mibQEkP6IwBb2cXVj8lw83i8+IYVbtrMHLkSStafShcsYj4Y5w1y7Uqj3WCn3+u0ET
 AkRNwwCYvQTSlKlDOuUceJ5c78qnikAWJJRLNwSWXZefmYyEfRBP66ACPL1mVtrJ89
 +fHJA/Ceo0rQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=HJCxdHGF
Subject: [Buildroot] [PATCH 1/1] package/pkg-kernel-module: add
 BR2_MAKE_HOST_DEPENDENCY
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
From: Sergey Bobrenok via buildroot <buildroot@buildroot.org>
Reply-To: Sergey Bobrenok <sibobrenok@salutedevices.com>
Cc: Sergey Bobrenok <SIBobrenok@sberdevices.ru>,
 Alexey Romanov <avromanov@sberdevices.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Alexey Romanov <avromanov@sberdevices.ru>

Commit 0b9efc991f ("linux: use BR2_MAKE") switched LINUX_MAKE to
$(BR2_MAKE) to avoid build issue with kernel version >= 6.2 and GNU
Make version < 3.82. However, the same issue is actual for kernel
modules as well.

Using $(BR2_MAKE) should guarantee a consistent behavior between
kernel and kernel-modules builds.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
---
 package/pkg-kernel-module.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index fcd6b8bc29..ae7a09114e 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -50,11 +50,12 @@ LINUX_NEEDS_MODULES = y
 endif
 
 # The kernel must be built first.
-$(2)_DEPENDENCIES += linux
+$(2)_DEPENDENCIES += linux \
+    $$(BR2_MAKE_HOST_DEPENDENCY)
 
 # This is only defined in some infrastructures (e.g. autotools, cmake),
 # but not in others (e.g. generic). So define it here as well.
-$(2)_MAKE ?= $$(MAKE)
+$(2)_MAKE ?= $$(BR2_MAKE)
 
 # If not specified, consider the source of the kernel module to be at
 # the root of the package.
-- 
2.24.3 (Apple Git-128)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
