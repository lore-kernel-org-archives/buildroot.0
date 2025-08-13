Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070BDCAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE3D680550;
	Mon,  8 Sep 2025 14:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vR33H6WHYPm; Mon,  8 Sep 2025 14:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE0C080553
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE0C080553;
	Mon,  8 Sep 2025 14:16:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 702E5186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56DD640209
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVcV1bIfGyLi for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9398740203
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9398740203
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 854CC818B3; Mon,  8 Sep 2025 14:16:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 17:26:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 786557d859dba7e52c883e5215e53e93fac13b88
X-Git-Newrev: 7b3bf7b29c49848dd29d778f4041dd90cd5556cc
X-Patchwork-Hint: ignore
Message-Id: <20250908141620.854CC818B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: python-pyroute2: new
 runtime test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3984095089892429650=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3984095089892429650==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7b3bf7b29c49848dd29d778f4041dd90cd5556cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Julien:
 - reword commit log title
 - replace python '%' formatting with '+' concatenation
 - remove IP address assertion in test controller as it
   is already in sample script
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 ++
 .../tests/package/sample_python_pyroute2.py        | 16 +++++++++++++++
 .../testing/tests/package/test_python_pyroute2.py  | 24 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a28f3e8d57..cdcde0585f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1123,8 +1123,10 @@ F:	package/python-aiomqtt/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
+F:	support/testing/tests/package/sample_python_pyroute2.py
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_python_networkmanager_goi.py
+F:	support/testing/tests/package/test_python_pyroute2.py
 
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
 F:	configs/asus_tinker-s_rk3288_defconfig
diff --git a/support/testing/tests/package/sample_python_pyroute2.py b/support/testing/tests/package/sample_python_pyroute2.py
new file mode 100644
index 0000000000..50d0d486bf
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pyroute2.py
@@ -0,0 +1,16 @@
+from pyroute2 import IPRoute
+
+
+def test_ipr():
+    with IPRoute() as ipr:
+        lo = ipr.link('get', ifname='lo')[0]
+        a = [
+            dict(a['attrs'])['IFA_ADDRESS']
+            for a in ipr.get_addr(index=lo['index'])
+        ]
+    print(repr(a))
+    assert '127.0.0.1' in a
+
+
+if __name__ == '__main__':
+    test_ipr()
diff --git a/support/testing/tests/package/test_python_pyroute2.py b/support/testing/tests/package/test_python_pyroute2.py
new file mode 100644
index 0000000000..2f54a2bd26
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyroute2.py
@@ -0,0 +1,24 @@
+from tests.package.test_python import TestPythonPackageBase
+import os
+
+
+class TestPythonPyroute2(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYROUTE2=y
+        """
+    sample_scripts = ["tests/package/sample_python_pyroute2.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        # helpful for debugging, if the test fails the run log will
+        # show if the interface was ready
+        output, exit_code = self.emulator.run('ip addr show', timeout=15)
+        self.assertEqual(exit_code, 0)
+
+        cmd = self.interpreter + " " + os.path.basename(self.sample_scripts[0])
+        _, exit_code = self.emulator.run(cmd, timeout=15)
+        self.assertEqual(exit_code, 0)

--===============3984095089892429650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3984095089892429650==--
