Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE62C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 14:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F68040103;
	Sat, 27 Apr 2024 14:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wo9eewXYGhQP; Sat, 27 Apr 2024 14:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16F65403B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16F65403B9;
	Sat, 27 Apr 2024 14:09:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AF2C1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 14:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77D4E824EE
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 14:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q98aE13oJwyn for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 14:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E906982075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E906982075
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E906982075
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 14:09:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BAF2240004;
 Sat, 27 Apr 2024 14:09:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s0ikL-001bCt-1R;
 Sat, 27 Apr 2024 16:09:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 16:09:40 +0200
Message-Id: <20240427140941.381333-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240427140941.381333-1-peter@korsgaard.com>
References: <20240427140941.381333-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 2/2] support/testing: add python-hid test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 support/testing/tests/package/sample_python_hid.py |  3 +++
 support/testing/tests/package/test_python_hid.py   | 13 +++++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_hid.py
 create mode 100644 support/testing/tests/package/test_python_hid.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 29c32f0a11..f426aa376e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2494,6 +2494,7 @@ F:	package/triggerhappy/
 F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_docker_compose.py
+F:	support/testing/tests/package/test_python_hid.py
 
 N:	Peter Seiderer <ps.report@gmx.net>
 F:	package/dotconf/
diff --git a/support/testing/tests/package/sample_python_hid.py b/support/testing/tests/package/sample_python_hid.py
new file mode 100644
index 0000000000..a581d7b7cb
--- /dev/null
+++ b/support/testing/tests/package/sample_python_hid.py
@@ -0,0 +1,3 @@
+import hid
+
+hid.enumerate()
diff --git a/support/testing/tests/package/test_python_hid.py b/support/testing/tests/package/test_python_hid.py
new file mode 100644
index 0000000000..b7a280b766
--- /dev/null
+++ b/support/testing/tests/package/test_python_hid.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonHid(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_HID=y
+        BR2_PACKAGE_HIDAPI=y
+        """
+    sample_scripts = ["tests/package/sample_python_hid.py"]
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
