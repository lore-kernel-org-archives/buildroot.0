Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAA0CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 20:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 036046FC37;
	Thu, 19 Oct 2023 20:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 036046FC37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnoOMSWuRIOZ; Thu, 19 Oct 2023 20:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 367CD6FC08;
	Thu, 19 Oct 2023 20:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 367CD6FC08
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E3F31BF2EA
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 20:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83B7C6FC33
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 20:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83B7C6FC33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IF8wMT5ggIqN for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 20:33:51 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C57E76FBAB
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 20:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C57E76FBAB
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39JGFsvL010480; Thu, 19 Oct 2023 20:33:51 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3tu0kgqfxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Oct 2023 20:33:50 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 39JKXntw014934
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Oct 2023 20:33:49 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 39JKXmh8010019
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 19 Oct 2023 20:33:49 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id AFD3220090;
 Thu, 19 Oct 2023 15:33:48 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 20:33:38 +0000
Message-ID: <20231019203338.6450-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_20,2023-10-19_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_20,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=762
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310190175
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 malwarescore=0
 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=687
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310190175
X-Proofpoint-ORIG-GUID: L_4MjrUdx5-y6TrywGt9TYLDQwLPiJ57
X-Proofpoint-GUID: L_4MjrUdx5-y6TrywGt9TYLDQwLPiJ57
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1011
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=819
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310190175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=AKx4rnAH8zdqCCT+G1h36BVp8Vi0XwrJ/4hnKdgy5OY=;
 b=dmPYEsAMk7/EF3BWBo0KNKrvc4b/u7uIg79i5PIrUADpV6LdZQWvg498x2llMBUdkDwZ
 /x5nGbXxdYOSxWfD9CnKvEISv/14HKKo4vZzbn697DP4005c2YlzhwubBWtYTFCF2rBI
 Lir47FFwhv7PcKMc7ycCTZMfoSE4mLAdyoqR2LcrFXmY3bI5MV/S2BmSa0GtL/PgSVWf
 VYC/vr1qMld+z533swheaTW9SkdFuZdtkpXwA3vRbh1iPiuSbSurnutpsexWRR2zO8jf
 O7wKQMZq4Gvys8gp8BT/3iQdrKfdyqO2mdskzVbrLPeSQXBjICfZUVosrUHSPSTOvjHg Ug== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=dmPYEsAM
Subject: [Buildroot] [PATCH 1/1] package/wireless_tools: add option to build
 ifrename
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Brandon Maier <brandon.maier@collins.com>,
 "Neal J. Buchmeyer" <neal.buchmeyer@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Neal J. Buchmeyer" <neal.buchmeyer@collins.com>

Add option to select ifrename tool which is part of the wireless_tools
suite. Also add an option to disable iwconfig for targets that only want
the library or ifrename.

Signed-off-by: Neal J. Buchmeyer <neal.buchmeyer@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/wireless_tools/Config.in         | 12 ++++++++++++
 package/wireless_tools/wireless_tools.mk | 22 ++++++++++++++++------
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
index 349908dbde..ad1c2e8e82 100644
--- a/package/wireless_tools/Config.in
+++ b/package/wireless_tools/Config.in
@@ -7,6 +7,18 @@ config BR2_PACKAGE_WIRELESS_TOOLS
 
 if BR2_PACKAGE_WIRELESS_TOOLS
 
+config BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME
+	bool "Add ifrename"
+	help
+	  Build and install the ifrename tool
+
+config BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG
+	bool "Add iwconfig"
+	default y
+	help
+	  Build and install the iwconfig, iwlist, iwspy, iwpriv, and
+	  iwgetid tools.
+
 config BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	bool "Install shared library"
 	depends on !BR2_STATIC_LIBS
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 1d29c3b102..210d8aa51a 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -14,8 +14,14 @@ WIRELESS_TOOLS_CPE_ID_VERSION = $(WIRELESS_TOOLS_VERSION_MAJOR)
 WIRELESS_TOOLS_CPE_ID_UPDATE = pre9
 WIRELESS_TOOLS_INSTALL_STAGING = YES
 
-WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
-WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
+ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME),y)
+WIRELESS_TOOLS_BUILD_TARGETS += ifrename
+endif
+
+ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG),y)
+WIRELESS_TOOLS_BUILD_TARGETS += iwmulticall
+WIRELESS_TOOLS_INSTALL_TARGETS += install-iwmulticall
+endif
 
 ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
 WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION_MAJOR)
@@ -30,13 +36,17 @@ endef
 endif
 
 define WIRELESS_TOOLS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-		$(WIRELESS_TOOLS_BUILD_TARGETS)
+	$(if $(WIRELESS_TOOLS_BUILD_TARGETS),
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" $(WIRELESS_TOOLS_BUILD_TARGETS))
 endef
 
 define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true \
-		$(WIRELESS_TOOLS_INSTALL_TARGETS)
+	$(if $(WIRELESS_TOOLS_INSTALL_TARGETS),
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" \
+		LDCONFIG=/bin/true $(WIRELESS_TOOLS_INSTALL_TARGETS))
+	$(if $(BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME),
+		$(INSTALL) -D -m 755 $(@D)/ifrename $(TARGET_DIR)/sbin/ifrename)
 endef
 
 $(eval $(generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
