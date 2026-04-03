Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801E2E7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6CB8612B3;
	Fri,  3 Apr 2026 10:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lChc9ikxxSh; Fri,  3 Apr 2026 10:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 346336129A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212136;
	bh=b+mC7CoD/LKTEXN7P4v6Tsv4Dc5M0wTXtIV3tpPSNc8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aoLQnRxDi0bE2fLqURuvizED7azjy/6CJzSYbhzgL3tur0TJJTmsCEnb+pvWI5WrH
	 5gLCKCgR8/0c/JnJL9D6WO2TYXggwgLwrsPac5Zo6G/tDT2r8XBGCni70SSY+ypWGL
	 rxmRLL58+rfg9nTU+GgPMx6Mpe4/aoH62YfYOxxtKfXzHxbmC5ynxbVt66EU3cwDo9
	 mDpjA1Ktbt18D/LgmGCIMOMwHHTtiB/EX/SgaEYDxBGmvjMKQ4a31l9Qx6iLJpGWwd
	 kWdA+23Ybcg4EUNxf6FIQ45u1dwwnG8CfZfkrzE8dxkpWViYaswPZiNcA1qu7qHpXt
	 DKuRI43IoHR3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 346336129A;
	Fri,  3 Apr 2026 10:28:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E0631A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DCF681E1C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8uqxIBX_SMq for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67A1F81E42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67A1F81E42
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5CE37FFF8; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 11:53:18 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 7c26d4e6be2505bc44cca58625403533ea3168f1
X-Git-Newrev: f3f4ba919e254811adb86c2166b2e973a8e33d2c
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.E5CE37FFF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] support/testing: add
 memcached test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3f4ba919e254811adb86c2166b2e973a8e33d2c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Add a basic runtime test for memcached. The test starts memcached and
checks if it responds to a basic set/get request.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit aa2d71ac38711b3e13505f48bc2b466c708991b9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                      |  3 +++
 support/testing/tests/package/test_memcached.py | 35 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 30b04d363a..7f8ad16edb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1161,6 +1161,9 @@ F:	package/tbb/
 N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
+N:	Franciszek Stachura <fbstachura@gmail.com>
+F:	support/testing/tests/package/test_memcached.py
+
 N:	Francois Dugast <francois.dugast.foss@gmail.com>
 F:	board/sipeed/licheepi_nano/
 F:	board/visionfive2/
diff --git a/support/testing/tests/package/test_memcached.py b/support/testing/tests/package/test_memcached.py
new file mode 100644
index 0000000000..2d00e47ab4
--- /dev/null
+++ b/support/testing/tests/package/test_memcached.py
@@ -0,0 +1,35 @@
+import os
+
+import infra.basetest
+
+
+class TestMemcached(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
+    BR2_TARGET_ROOTFS_CPIO=y
+    BR2_PACKAGE_MEMCACHED=y
+    BR2_PACKAGE_NETCAT=y
+    BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+    """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        output, exit_code = self.emulator.run("memcached -u root &")
+
+        set_key_cmd = "set test_key 0 100 10\\r\\ntest_value\\r\\nquit\\r\\n"
+        output, exit_code = self.emulator.run(
+            f"echo -ne '{set_key_cmd}' | nc localhost 11211"
+        )
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0].strip(), 'STORED')
+
+        get_key_cmd = "get test_key\\r\\nquit\\r\\n"
+        output, exit_code = self.emulator.run(
+            f"echo -ne '{get_key_cmd}' | nc localhost 11211"
+        )
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[2].strip(), 'test_value')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
