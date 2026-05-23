Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9451CD5BC2
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0AA8811EB;
	Sat, 23 May 2026 15:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pJP38eiNs9K; Sat, 23 May 2026 15:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0A22811ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779549586;
	bh=Kaigx9AN4wSO/xB8Q0E6FkCxG23oF76NfvIh75z275c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Nr69m2i4cUXyzwpa50vang2Mjyye8ih1xvNMXmSQOis7yOxzjf7PV3U4UVCJzY/fm
	 OXokHvgdqdS6RiNLmZklj/k2axfpFobaAO9ifqhHONBy0tTySizP6tBhCAhC5EXaao
	 XxwPf5H3KBcexXYZFlbTScWv0Tjl7l8Q8LkeznaUtgF8ksZE2p2LqOBPgZ9xDiQJ/k
	 qHA542NFweyMB7uWCQp7E1kfVyla8ctM5spOUGpY0Aq53eoiQAyJ/DJQbv+pswQzBc
	 GYvue25XooKAfOFRuaIuN1B2R3awsvMbqR9ha+1otNC0f1cUIGkC91eJYSyJ0GPhki
	 UNE1QpuMPqLCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A22811ED;
	Sat, 23 May 2026 15:19:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0C6F263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B680C40EFA
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOYeZoV5HDzn for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:19:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A7BC406D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A7BC406D9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A7BC406D9
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbkM-1wldsG25ka-00Vkg1; Sat, 23
 May 2026 17:19:32 +0200
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 15:19:03 +0000
Message-ID: <20260523151911.10285-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:rZLmGXhAvW139yLF41Mr+Sp1+/vYf8xBI85qtpzrQY1MRRkqcV2
 HwmSrWTb99YFc85CtkrOhww9xukPZyFPy801YABaCi3UcvrMAhy7phIWE2M+5z98+JAEn1g
 hQeWPZj22cLf8Ru1rySe0YL9Hk0bgwmlZu0Rm2fW+il/v5a2BSK7k/tL629/aE7EYoiIrBf
 JltJOFh7mOB/ng1LsIibg==
UI-OutboundReport: notjunk:1;M01:P0:4AOR2bTVUtI=;4qb7dId/jCgCnPYti0A4b100IF6
 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
 OOjvZEuLc1YBq20RAg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779549572; x=1780154372; i=and@gmx.li;
 bh=Tofne2WJJ8TM9/MPAmoFWMeqatyaYxGUGrxMYNCbI+Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Am0hkRptkrOs4cV4mc3CDD45II0yrI1kBijPm5MzQMcxZlNCLncVKr867vwLD4A9
 m+xHhGCyiGtzgHh91y0RLGQKbDUQ6BfSSjRsPQriQIqfSU2wAoSv2gy8cigj/ASva
 HlxkWTj5uwvUaGxa8q6OWrXvVhZI3u3rdAxqgd3w+nvjJl3ZBZb22TRO6AQt5/s9k
 WXx30UguheLSC+ssRS7iksH6Y4Z5c4+mF2nocfP9xdJPMEw5lfjSB8L4GppJBKDWu
 lPQa+blWzpkD/lJ+OPb3oNzeVNpJh+uL7rZjaNBXTvnu1dUuoqEB+sirHoSR/Ckd6
 2om66gq5PdRUKmjscA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=Am0hkRpt
Subject: [Buildroot] [PATCH/next v2 1/9] package/lvm2: add static build
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Laurent Vivier <laurent@vivier.eu>, Sen Hastings <sen@hastings.org>,
 Christian Stewart <christian@aperture.us>, Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add static build support for device mapper

Lvm2 standard install still requires dynamic library

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/lvm2/Config.in | 9 ++++++---
 package/lvm2/lvm2.mk   | 9 +++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index ddb398d1..4f15504e 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
-	depends on !BR2_STATIC_LIBS # It fails to build statically
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and
@@ -26,13 +25,17 @@ if BR2_PACKAGE_LVM2
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
 	default y
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBAIO
 	help
 	  Install the standard suite of lvm2 programs. When this option
 	  is not set, only dmsetup is installed.
 
+comment "lvm2 standard install needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif
 
-comment "lvm2 needs a toolchain w/ threads, dynamic library"
+comment "lvm2 needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 3a1dded5..8db1899e 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -48,6 +48,15 @@ else
 LVM2_CONF_OPTS += --disable-selinux
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+# configure: error: --enable-cmdlib requires dynamic linking.
+LVM2_CONF_OPTS += --disable-cmdlib
+# configure: error: --enable-dmeventd requires --enable-cmdlib to be used as well
+LVM2_CONF_OPTS += --disable-dmeventd
+# install static version of the devmapper library
+LVM2_CONF_OPTS += --enable-static_link
+endif
+
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LVM2_DEPENDENCIES += libaio
 LVM2_INSTALL_STAGING_OPTS += install
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
