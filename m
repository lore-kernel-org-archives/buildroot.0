Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E64DC4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 02:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4506C41E5B;
	Fri,  3 May 2024 02:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yh4aaz4y8bys; Fri,  3 May 2024 02:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C4D41E98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C4D41E98;
	Fri,  3 May 2024 02:00:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E57BA1BF39E
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 02:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D74AB41E91
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 02:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-KXbfVofPps for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 02:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46F8E41E88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46F8E41E88
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46F8E41E88
 for <buildroot@buildroot.org>; Fri,  3 May 2024 02:00:33 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 442HROvA019850; Fri, 3 May 2024 02:00:31 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3xv1cvjuf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 May 2024 02:00:31 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44320UHg015131
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2024 02:00:30 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44320Uq0016901
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 3 May 2024 02:00:30 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 5D2FA3004996;
 Thu,  2 May 2024 21:00:30 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri,  3 May 2024 02:00:00 +0000
Message-ID: <20240503020000.3168109-4-brandon.maier@collins.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503020000.3168109-1-brandon.maier@collins.com>
References: <20240425195816.2758964-1-brandon.maier@collins.com>
 <20240503020000.3168109-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_01,2024-05-02_03,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_01,2024-05-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=937
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2405030012
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=888
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405030012
X-Proofpoint-ORIG-GUID: gG86pgk8r9zywk5R2PfB8gHXacHfJPK0
X-Proofpoint-GUID: gG86pgk8r9zywk5R2PfB8gHXacHfJPK0
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405030012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=mjagbJCLTxErVBMVzsKzafpfQShhA3as1nIYWm8N/YE=;
 b=TGXpxsQ6qMTTUdjeH2iMhy+blZZtVa3GPnbK75ERB/o53Cw9Be5u7oYbw26/PY3/OLsm
 MjUQcxsxnlIdh6yIuVxb+NOGmowdiKyAS4xFLrUg7CMR+EniDBmp924Re1d9UErS/58C
 ORjWHWe7tlaBx13lF+gGX93hxn2z1aXBlY3AUasUpV2ROZ7o5qmeuntMmm345czKj41A
 O20awGB2fnfxETfmltKzZXzSbo0dsotZXpuAcoDleSqyOS8ZUJ2RDvm2hiUKIuFgFHd/
 a2TkcDxH6r/RycCVbl0OR8tBWG5UTqkoVmFQfwOM9YnrF8bLUT5EmYONiJptZ6ufP1+w jA== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=TGXpxsQ6
Subject: [Buildroot] [PATCH v3 4/4] support/testing: add bats runtime test
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

Tests the bats-core, bats-support, bats-assert, and bats-file packages.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 support/testing/tests/package/test_bats.py    | 33 +++++++++++++++++++
 .../rootfs-overlay/root/test-bats-assert.bats | 11 +++++++
 .../rootfs-overlay/root/test-bats-core.bats   | 11 +++++++
 .../rootfs-overlay/root/test-bats-file.bats   | 10 ++++++
 4 files changed, 65 insertions(+)
 create mode 100644 support/testing/tests/package/test_bats.py
 create mode 100755 support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-assert.bats
 create mode 100755 support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-core.bats
 create mode 100755 support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-file.bats

diff --git a/support/testing/tests/package/test_bats.py b/support/testing/tests/package/test_bats.py
new file mode 100644
index 0000000000..c75a6df294
--- /dev/null
+++ b/support/testing/tests/package/test_bats.py
@@ -0,0 +1,33 @@
+import os
+
+import infra.basetest
+
+
+class TestBats(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_ENABLE_LOCALE_WHITELIST=""
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_BASH=y
+        BR2_PACKAGE_BATS_CORE=y
+        BR2_PACKAGE_BATS_ASSERT=y
+        BR2_PACKAGE_BATS_FILE=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+           # overlay to add a gnuradio python test script
+           infra.filepath("tests/package/test_bats/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("bats --version")
+
+        self.assertRunOk("bats /root/test-bats-core.bats", timeout=5)
+        self.assertRunOk("bats /root/test-bats-assert.bats", timeout=5)
+        self.assertRunOk("bats /root/test-bats-file.bats", timeout=5)
diff --git a/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-assert.bats b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-assert.bats
new file mode 100755
index 0000000000..cd0cb48290
--- /dev/null
+++ b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-assert.bats
@@ -0,0 +1,11 @@
+#!/usr/bin/env bats
+
+setup() {
+    bats_load_library bats-support
+    bats_load_library bats-assert
+}
+
+@test "bats-assert assert_output" {
+    run echo "Hello World"
+    assert_output "Hello World"
+}
diff --git a/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-core.bats b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-core.bats
new file mode 100755
index 0000000000..54ec941e03
--- /dev/null
+++ b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-core.bats
@@ -0,0 +1,11 @@
+#!/usr/bin/env bats
+
+@test "bats-core true" {
+    true
+}
+
+@test "bats-core run" {
+    run echo "Hello World"
+    [ "$status" -eq 0 ]
+    [ "$output" = "Hello World" ]
+}
diff --git a/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-file.bats b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-file.bats
new file mode 100755
index 0000000000..0ac2616b99
--- /dev/null
+++ b/support/testing/tests/package/test_bats/rootfs-overlay/root/test-bats-file.bats
@@ -0,0 +1,10 @@
+#!/usr/bin/env bats
+
+setup() {
+    bats_load_library bats-support
+    bats_load_library bats-file
+}
+
+@test "bats-file assert_exists" {
+    assert_exists /root/test-bats-file.bats
+}
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
