Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5099C07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 18:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E3F16FC88;
	Tue, 24 Oct 2023 18:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E3F16FC88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CY_nkHsuoaG; Tue, 24 Oct 2023 18:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A89E16FC85;
	Tue, 24 Oct 2023 18:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A89E16FC85
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFE041BF867
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 18:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 959096FC85
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 18:48:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 959096FC85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhCVPxdz6xDv for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 18:48:53 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3E2D6FC64
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 18:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3E2D6FC64
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OHvs6i026069; Tue, 24 Oct 2023 18:48:52 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3txhde9ue6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Oct 2023 18:48:52 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 39OImo1O004305
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Oct 2023 18:48:50 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 39OImn3J007011
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 24 Oct 2023 18:48:50 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id B1945600E2;
 Tue, 24 Oct 2023 13:48:49 -0500 (CDT)
To: buildroot@buildroot.org
Date: Tue, 24 Oct 2023 18:48:34 +0000
Message-ID: <20231024184835.3911-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019203338.6450-1-brandon.maier@collins.com>
References: <20231019203338.6450-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_18,2023-10-24_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_18,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 mlxlogscore=689 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310240161
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=611 mlxscore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310240161
X-Proofpoint-ORIG-GUID: jBhZ7iKxPymdd9IDlQd7xXw1MBhKtzKy
X-Proofpoint-GUID: jBhZ7iKxPymdd9IDlQd7xXw1MBhKtzKy
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=742 mlxscore=0
 bulkscore=0 impostorscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310240161
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=4kNGaggjwLDwRcRoqp31oxuNBBM3zhCZDWev8pXXVcc=;
 b=tB1FDsQchZKoGvDE7B8YrlufNF4nTw9WBvDgOQCS/coscUJr3zo+/c7JNtpiZiVKt4Mm
 Mk1FnslnmeKKwpE8An7SkeQPgXBVCAYBySRu6ypGn5UdInSX/3ByKP0ffv6I8Qhxs1x/
 1SkMnQM+NdZdRdtEavHYmAUfled4/M1CGTILcj3Dx8Hlk0eudMqAKyemI6OaMmCiI/af
 vTb1qg2JBA3/4/i3BcWJ/uXPDxVyl8okXmwVvLHNYTE1t06ul7zzMiZ1PhXxaxHL1exb
 zHmki9BKadeTVyPGA6GiRWQEcWJmFavXvWz0jUwhGfpBe5vUN14B3XNEaka86elilmem wA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=tB1FDsQc
Subject: [Buildroot] [PATCH v2 1/2] package/wireless_tools: make 'iwconfig'
 tool optional
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>,
 "Neal J. Buchmeyer" <neal.buchmeyer@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Neal J. Buchmeyer" <neal.buchmeyer@collins.com>

Allow disabling iwconfig for targets that only want the library.

Signed-off-by: Neal J. Buchmeyer <neal.buchmeyer@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/wireless_tools/Config.in         | 8 ++++++++
 package/wireless_tools/wireless_tools.mk | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/package/wireless_tools/Config.in b/package/wireless_tools/Config.in
index 349908dbde..f676e33b57 100644
--- a/package/wireless_tools/Config.in
+++ b/package/wireless_tools/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_WIRELESS_TOOLS
 	bool "wireless tools"
+	select BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG if \
+		!BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	help
 	  A collection of tools to configure wireless lan cards.
 
@@ -7,6 +9,12 @@ config BR2_PACKAGE_WIRELESS_TOOLS
 
 if BR2_PACKAGE_WIRELESS_TOOLS
 
+config BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG
+	bool "Add iwconfig"
+	help
+	  Build and install the iwconfig, iwlist, iwspy, iwpriv, and
+	  iwgetid tools.
+
 config BR2_PACKAGE_WIRELESS_TOOLS_LIB
 	bool "Install shared library"
 	depends on !BR2_STATIC_LIBS
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 1d29c3b102..3e55eda600 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -14,8 +14,10 @@ WIRELESS_TOOLS_CPE_ID_VERSION = $(WIRELESS_TOOLS_VERSION_MAJOR)
 WIRELESS_TOOLS_CPE_ID_UPDATE = pre9
 WIRELESS_TOOLS_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG),y)
 WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
 WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
+endif
 
 ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
 WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION_MAJOR)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
