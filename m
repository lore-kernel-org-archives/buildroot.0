Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088AEE80A8A
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 00:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BA4E832E6;
	Thu, 28 Sep 2023 00:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BA4E832E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7eYXw7fc1uqP; Thu, 28 Sep 2023 00:28:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C32BF83639;
	Thu, 28 Sep 2023 00:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C32BF83639
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E62F71BF286
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 00:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFBAB60DA0
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 00:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFBAB60DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2DdHotRyIp2e for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 00:27:56 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7927760A7B
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 00:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7927760A7B
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RHFVYd006824; Thu, 28 Sep 2023 00:27:54 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3tcrmu3mem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Sep 2023 00:27:54 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38S0Ra7w011380
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Sep 2023 00:27:36 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38S0RZAc000410
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 28 Sep 2023 00:27:36 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 6BB1C600E2;
 Wed, 27 Sep 2023 19:27:35 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 00:27:28 +0000
Message-ID: <20230928002728.2402-2-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928002728.2402-1-brandon.maier@collins.com>
References: <20230919172300.9901-1-brandon.maier@collins.com>
 <20230928002728.2402-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_16,2023-09-27_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_16,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=409
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309280002
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 mlxlogscore=333 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309280002
X-Proofpoint-GUID: 7jgmFdXEnT05bIX0Ezep7MU20BSNYQV1
X-Proofpoint-ORIG-GUID: 7jgmFdXEnT05bIX0Ezep7MU20BSNYQV1
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 mlxlogscore=461 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2309280003
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=TD6T/7x+uGrRVXPypT8fTlVvs847Sk+Ww9gURhj5EHA=;
 b=tvGjWF/TJbmmy7a3KJC8rSUFCtf5HgYe8UeQXxQOOQWJ0+JFu0iI5JEDnDIkSOoWgQUP
 gb+BS4fLNxaKQgrRnd63ogbFISwAxNsKNERuTkMkHA8+ZOOKzLI5M7YUNZd0BVR59DVt
 t8o5N1JrmdT9h8RNHvF5HOUp9H4laCgGlYiyN4Dn2n7EbmZPP8mF1pdpujtYcoTFhRib
 NAfT2myn1Pevs0Z7ekys6/9/G/1u9ljE0jWr95af376nCV7zjJuLW+qKF5pT+CmzbrZZ
 bkWyKCwJmCze+ZASZAhPgcaIMBWh7nfI7OHp1u+ZM2CsPeXP8CqvWsZNBODC3xqHDMe7 fg== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=tvGjWF/T
Subject: [Buildroot] [PATCH v2 2/2] unifdef: add target package
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Change v1 -> v2:
  - Move from Misc packages to Dev packages
---
 DEVELOPERS                 | 1 +
 package/Config.in          | 1 +
 package/unifdef/Config.in  | 9 +++++++++
 package/unifdef/unifdef.mk | 9 +++++++++
 4 files changed, 20 insertions(+)
 create mode 100644 package/unifdef/Config.in

diff --git a/DEVELOPERS b/DEVELOPERS
index e8b78a8d46..defeb502ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -513,6 +513,7 @@ F:	package/iftop/
 F:	package/ncdu/
 
 N:	Brandon Maier <brandon.maier@collins.com>
+F:	package/unifdef/
 F:	package/vmtouch/
 
 N:	Brock Williams <brock@cottonwoodcomputer.com>
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..e70479059e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -201,6 +201,7 @@ menu "Development tools"
 	source "package/sed/Config.in"
 	source "package/subversion/Config.in"
 	source "package/tree/Config.in"
+	source "package/unifdef/Config.in"
 	source "package/yasm/Config.in"
 endmenu
 
diff --git a/package/unifdef/Config.in b/package/unifdef/Config.in
new file mode 100644
index 0000000000..a1a44d9f5a
--- /dev/null
+++ b/package/unifdef/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_UNIFDEF
+	bool "unifdef"
+	help
+	  The unifdef utility selectively processes conditional C
+	  preprocessor #if and #ifdef directives. It removes from a file
+	  both the #directives and the additional text that they
+	  delimit, while otherwise leaving the file alone.
+
+	  http://dotat.at/prog/unifdef/
diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
index fd74455894..6761e32b69 100644
--- a/package/unifdef/unifdef.mk
+++ b/package/unifdef/unifdef.mk
@@ -9,6 +9,14 @@ UNIFDEF_SITE = https://dotat.at/prog/unifdef
 UNIFDEF_LICENSE = BSD-2-Clause, BSD-3-Clause
 UNIFDEF_LICENSE_FILES = COPYING
 
+define UNIFDEF_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define UNIFDEF_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(TARGET_DIR) install
+endef
+
 define HOST_UNIFDEF_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
@@ -17,4 +25,5 @@ define HOST_UNIFDEF_INSTALL_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
