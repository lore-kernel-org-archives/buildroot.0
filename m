Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449E4C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9694C416CA;
	Wed,  7 Feb 2024 17:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pRK-LvEKU_pR; Wed,  7 Feb 2024 17:11:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73B8741700
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73B8741700;
	Wed,  7 Feb 2024 17:11:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0571E1BF954
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E712382111
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8bkHY-K_rOzi for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:10:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0EF09820FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF09820FD
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EF09820FD
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:10:56 +0000 (UTC)
Received: from bubutux.localdomain (ip-185-104-138-44.ptr.icomera.net
 [185.104.138.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 928332C8386F;
 Wed,  7 Feb 2024 18:10:54 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 18:09:54 +0100
Message-ID: <20240207170959.2672846-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207170959.2672846-1-buildroot@bubu1.eu>
References: <20240207170959.2672846-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707325854; bh=Lm0Z/w/tMX0lFCKIU6jHeNhTLhU5Rl1XqQJVKQTTs6Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=M8eew+ZcQbVH1lpPmb/vAPmt4iv21BiaVxongOOwDEOweFU3Y3/vWjcZzLpYw7KYl
 d2S382MawYVCmam3opEVap74taNuCSmR8lUWmKH58A7fFgKKUOAIfMgO6VRVbKO+Pq
 KzEb2YjrqzAtkbsxFilORgB2OMM/9sx4DAyGNO4WI3FAUiJ+8sYMj8gXmicJvSkslI
 RStkQB8UlxuB8axLf7JNWrqZY3YMlYE48LW1m5xc4TAdRVqVHQE69K8toVBtLipCfl
 JTGLIlE0ghmOY95c1iexIUKw9/hqpVjKLpC4pQeh/milmNzmVl9nsPimA3N6K67ASh
 uOZWm7cy8geXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=M8eew+Zc
Subject: [Buildroot] [PATCH 2/4] support/testing: add new python-ruamel-yaml
 runtime test
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../package/sample_python_ruamel_yaml.py      | 27 +++++++++++++++++++
 .../tests/package/test_python_ruamel_yaml.py  | 12 +++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_ruamel_yaml.py
 create mode 100644 support/testing/tests/package/test_python_ruamel_yaml.py

diff --git a/support/testing/tests/package/sample_python_ruamel_yaml.py b/support/testing/tests/package/sample_python_ruamel_yaml.py
new file mode 100644
index 0000000000..5b3a079471
--- /dev/null
+++ b/support/testing/tests/package/sample_python_ruamel_yaml.py
@@ -0,0 +1,27 @@
+from ruamel.yaml import YAML
+
+yaml_text = """
+Rootkey:
+  - ListEntry
+AnotherRootKey: some-string
+
+ListRoot:
+  - float-value: '1.0'
+    int-value: 10234
+    NestedList:
+      - 1
+      - 2
+
+  - another-float: '1.1'
+    another-int: 1111
+
+OneMoreRootKey: 9.99
+"""
+
+# Tests the pure python based implementation
+yaml = YAML(typ='safe', pure=True)
+
+parsed = yaml.load(yaml_text)
+
+assert parsed['OneMoreRootKey'] == 9.99
+assert parsed['ListRoot'][1]['another-int'] == 1111
diff --git a/support/testing/tests/package/test_python_ruamel_yaml.py b/support/testing/tests/package/test_python_ruamel_yaml.py
new file mode 100644
index 0000000000..15062b4455
--- /dev/null
+++ b/support/testing/tests/package/test_python_ruamel_yaml.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3RuamelYaml(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_RUAMEL_YAML=y
+        """
+    sample_scripts = ["tests/package/sample_python_ruamel_yaml.py"]
+    timeout = 40
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
