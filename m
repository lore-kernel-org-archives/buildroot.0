Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C74C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 19:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BBC66069D;
	Thu, 25 Apr 2024 19:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4butuHG69LR; Thu, 25 Apr 2024 19:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42D1F6136C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42D1F6136C;
	Thu, 25 Apr 2024 19:59:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 913BD1BF2F5
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 19:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E64F8176D
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 19:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8Y_NH8mtsNc for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 19:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3EC5181749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC5181749
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EC5181749
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 19:58:51 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43PJaqJd010785; Thu, 25 Apr 2024 19:58:48 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xqurjsqdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2024 19:58:48 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 43PJwl53027904
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 25 Apr 2024 19:58:47 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 43PJwljd015856
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 25 Apr 2024 19:58:47 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 654023003A9A;
 Thu, 25 Apr 2024 14:58:47 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 19:58:15 +0000
Message-ID: <20240425195816.2758964-3-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412210850.17265-1-brandon.maier@collins.com>
References: <20240412210850.17265-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_19,2024-04-25_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_19,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404250143
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250143
X-Proofpoint-GUID: HDlQYcyTUs0qs45p8PaRvCHZc1JjTk_e
X-Proofpoint-ORIG-GUID: HDlQYcyTUs0qs45p8PaRvCHZc1JjTk_e
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250144
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=4f6Y5WII4M18JqJMqjg+xka+xq9XgBdHwemc9tzuB7Q=;
 b=UfhEhVOZh6E+w0QvPcSO4Q1/WvQvTS+cSLPGGRCmjBwy2jZlyqlTpO0ZKfeyhF3qMJv/
 MGQmmRwyqbTkZeBlSuOzYliJZN7VK6MidbKw0kbc3bAQqPFQVs9Ez1XuazeeRDCCvDCk
 qlfuqCu/O/GHZPsPRNIZQN4uFkDVFXRHXfk/KKpmbUJL1DWzGklHYgbKOhyGMiXOnrrV
 mgwf8MqV9LHDM/w8mgYZ7cqHgcNENaljWsDKiinkZ7U0sAruRQXf6/2VrDoHLFnQwEH+
 ZnpLw1DW4EbNwFlF+hmM7B/d9qPLSk93Of9ZgE5Pt6OvbqZloFOijFlpp9l4x7oBLkUn iQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=UfhEhVOZ
Subject: [Buildroot] [PATCH v2 3/4] package/bats-assert: add bats-assert
 library
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bats-assert is a helper library providing common assertions for Bats.

This library does not provide an installer. Manually install the files
under /usr/lib/bats/bats-assert which is what the Arch Linux package
does[1]. This makes the library loadable using `bats_load_library`[2].

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/bats-assert/-/blob/main/PKGBUILD?ref_type=heads
[2] https://bats-core.readthedocs.io/en/stable/writing-tests.html#bats-load-library-load-system-wide-libraries

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
Changes v1 -> v2:
- fix older versions of `install` that don't support -D
- reorder package/Config.in to comply with check-package

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/bats-assert/Config.in        | 16 ++++++++++++++++
 package/bats-assert/bats-assert.hash |  5 +++++
 package/bats-assert/bats-assert.mk   | 18 ++++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/bats-assert/Config.in
 create mode 100644 package/bats-assert/bats-assert.hash
 create mode 100644 package/bats-assert/bats-assert.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 846dc987a4..4bac9c9d1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -540,6 +540,7 @@ F:	package/ncdu/
 N:	Brandon Maier <brandon.maier@collins.com>
 F:	board/freescale/ls1046a-frwy/
 F:	configs/ls1046a-frwy_defconfig
+F:	package/bats-assert/
 F:	package/bats-support/
 F:	package/python-pysensors/
 F:	package/qoriq-fm-ucode/
diff --git a/package/Config.in b/package/Config.in
index eef0ccc588..98ff90a005 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,6 +169,7 @@ endmenu
 
 menu "Development tools"
 	source "package/avocado/Config.in"
+	source "package/bats-assert/Config.in"
 	source "package/bats-core/Config.in"
 	source "package/bats-support/Config.in"
 	source "package/binutils/Config.in"
diff --git a/package/bats-assert/Config.in b/package/bats-assert/Config.in
new file mode 100644
index 0000000000..78fa0ac4d5
--- /dev/null
+++ b/package/bats-assert/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_BATS_ASSERT
+	bool "bats-assert"
+	depends on BR2_PACKAGE_BATS_CORE # runtime
+	select BR2_PACKAGE_BATS_SUPPORT # runtime
+	help
+	  bats-assert is a helper library providing common assertions
+	  for Bats.
+
+	  In the context of this project, an assertion is a function
+	  that perform a test and returns 1 on failure or 0 on success.
+	  To make debugging easier, the assertion also outputs relevant
+	  information on failure. The output is formatted for
+	  readability. To make assertions usable outside of @test
+	  blocks, the output is sent to stderr.
+
+	  https://github.com/bats-core/bats-assert
diff --git a/package/bats-assert/bats-assert.hash b/package/bats-assert/bats-assert.hash
new file mode 100644
index 0000000000..94c3908ab3
--- /dev/null
+++ b/package/bats-assert/bats-assert.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  98ca3b685f8b8993e48ec057565e6e2abcc541034ed5b0e81f191505682037fd  bats-assert-2.1.0.tar.gz
+
+# License files
+sha256  36ffd9dc085d529a7e60e1276d73ae5a030b020313e6c5408593a6ae2af39673  LICENSE
diff --git a/package/bats-assert/bats-assert.mk b/package/bats-assert/bats-assert.mk
new file mode 100644
index 0000000000..2413b1f699
--- /dev/null
+++ b/package/bats-assert/bats-assert.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# bats-assert
+#
+################################################################################
+
+BATS_ASSERT_VERSION = 2.1.0
+BATS_ASSERT_SITE = $(call github,bats-core,bats-assert,v$(BATS_ASSERT_VERSION))
+BATS_ASSERT_LICENSE = CC0-1.0
+BATS_ASSERT_LICENSE_FILES = LICENSE
+
+define BATS_ASSERT_INSTALL_TARGET_CMDS
+	install -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-assert/src
+	install -m 0644 $(@D)/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-assert"
+	install -m 0644 $(@D)/src/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-assert/src"
+endef
+
+$(eval $(generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
