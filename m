Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27607C28B28
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A0A60BDF;
	Tue, 18 Mar 2025 15:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxPj_zH_iPBW; Tue, 18 Mar 2025 15:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB07560906
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB07560906;
	Tue, 18 Mar 2025 15:03:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EE5916E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2DD7408D4
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGzcb9jeGnEp for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FFA24073C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FFA24073C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B986880AF; Tue, 18 Mar 2025 15:02:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 21:10:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 475722ea46fdd18ea5859b44954da9267762d8a4
X-Git-Newrev: 1af307504a4f1e7ed9704ae14cae49ce82fa8a00
X-Patchwork-Hint: ignore
Message-Id: <20250318150241.6B986880AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test for nftables init
 script
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2379822431051542357=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2379822431051542357==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1af307504a4f1e7ed9704ae14cae49ce82fa8a00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new test checks that a pre-defined rules file can be loaded and
works as expected, and that after flushing the blocked IP responds to
ping again.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 support/testing/tests/package/test_nftables.py     | 37 +++++++++++++++++++++-
 .../test_nftables/rootfs-overlay/etc/nftables.conf |  8 +++++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f04dd2a1e..25cb5dc764 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1110,6 +1110,7 @@ F:	package/python-poetry-dynamic-versioning/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
+F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_python_networkmanager_goi.py
 
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
diff --git a/support/testing/tests/package/test_nftables.py b/support/testing/tests/package/test_nftables.py
index 142e7d0352..2622c7e822 100644
--- a/support/testing/tests/package/test_nftables.py
+++ b/support/testing/tests/package/test_nftables.py
@@ -85,7 +85,7 @@ class TestNftables(infra.basetest.BRTest):
         # supposed to fail earlier is now supposed to succeed.
         self.assertRunOk(ping_test_cmd)
 
-    def test_run(self):
+    def boot_vm(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
         kern = os.path.join(self.builddir, "images", "Image")
         self.emulator.boot(arch="aarch64",
@@ -97,6 +97,9 @@ class TestNftables(infra.basetest.BRTest):
                                     "-initrd", img])
         self.emulator.login()
 
+    def test_run(self):
+        self.boot_vm()
+
         # We check the program can execute.
         self.assertRunOk("nft --version")
 
@@ -107,3 +110,35 @@ class TestNftables(infra.basetest.BRTest):
         # We run again the same test sequence using our simple nft
         # python implementation, to check the language bindings.
         self.nftables_test(prog="/root/nft.py")
+
+
+class TestNftablesInit(TestNftables):
+    config = TestNftables.config + \
+        """
+        BR2_INIT_BUSYBOX=y
+        """
+
+    def test_run(self):
+        self.boot_vm()
+
+        # start with known state (rules from /etc/nftables.conf)
+        self.assertRunOk("/etc/init.d/S35nftables reload")
+
+        # Same concept as in TestNftables.nftables_test: The rules
+        # should allow ping to 127.0.0.1, but not 127.0.0.2.
+        ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
+        self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
+        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
+        self.assertNotEqual(exit_code, 0)
+
+        # Stop should flush the rules, ping to both addresses should
+        # work now.
+        self.assertRunOk("/etc/init.d/S35nftables stop")
+        self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
+        self.assertRunOk(ping_cmd_prefix + "127.0.0.2")
+
+        # Start is essentially the same as reload, check that
+        # 127.0.0.2 gets blocked again.
+        self.assertRunOk("/etc/init.d/S35nftables start")
+        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
+        self.assertNotEqual(exit_code, 0)
diff --git a/support/testing/tests/package/test_nftables/rootfs-overlay/etc/nftables.conf b/support/testing/tests/package/test_nftables/rootfs-overlay/etc/nftables.conf
new file mode 100644
index 0000000000..a04af1d634
--- /dev/null
+++ b/support/testing/tests/package/test_nftables/rootfs-overlay/etc/nftables.conf
@@ -0,0 +1,8 @@
+flush ruleset
+
+table inet filter {
+	chain input {
+		type filter hook input priority filter; policy accept;
+		ip daddr 127.0.0.2 icmp type echo-request drop
+	}
+}

--===============2379822431051542357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2379822431051542357==--
