Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975EDC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46F1860D55;
	Tue, 26 Jul 2022 17:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46F1860D55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRdnFETkBiY9; Tue, 26 Jul 2022 17:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DE0960A88;
	Tue, 26 Jul 2022 17:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DE0960A88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7341BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07744401C5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07744401C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nc3K4ipa62Xn for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:54:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AB66400FB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AB66400FB
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:54:06 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.173.143.56])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C3D20B004B6;
 Tue, 26 Jul 2022 19:54:01 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 19:53:44 +0200
Message-Id: <20220726175344.7126-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658858043;
 bh=Aso2L7fVaKG9rQHq4DwqyvkyFOcG/iTmWhwZYEXLVwY=;
 h=From:To:Cc:Subject:Date:From;
 b=KzGd5RTwmt2vVVXInnuGOqgE9P/jdJ6EYIsPNItXHU0nwsVUtc0H5AzxJSlq2Zuwk
 dN61mPZ3phcrGeFIuxuVjZI7oADoPqEY6SD2ygIxKaBxQWUds/wx8mbBb57wUz/VzU
 jF6xWCFk+SLl+tEytEtBJ129Iu79HsWTE3HT6rBhjnrj6TnA6iWXbLKZzlhR/UQZJS
 SZN8Nagq/N0Nw2WucukmpE+onbMe4d8MilNo8Z1T4vpRxFtZdlW3kpFxdwG80OiIB2
 g9nU+o5pKZ5jG+YawNmfaLsSJblz9jeJ4XArZ6MExsr4pjAdY5X6LrGVx9UEVLNDLQ
 FQWgtwwK4yl0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KzGd5RTw
Subject: [Buildroot] [PATCH 1/1] support/testing: add test for ola
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This test relies on the OLA Dummy plugin presenting a test device
and port.  It starts the daemon, performs few configuration commands,
covers the Python bindings and also test the OLA web interface.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
This OLA test was suggested in:
https://lists.buildroot.org/pipermail/buildroot/2022-July/647089.html

This patch was tested with:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8 \
        support/testing/tests/package/test_ola.py \
        support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py
    [no-output]

    support/testing/run-tests \
        -d dl \
        -o output_folder \
        tests.package.test_ola.TestOla
    ...
    OK
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_ola.py     | 95 +++++++++++++++++++
 .../usr/bin/sample_ola_rdm_discovery.py       | 24 +++++
 3 files changed, 121 insertions(+)
 create mode 100644 support/testing/tests/package/test_ola.py
 create mode 100755 support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1dede4b83b..eb5bc5d985 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1657,6 +1657,8 @@ F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/test_octave.py
+F:	support/testing/tests/package/test_ola.py
+F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 
diff --git a/support/testing/tests/package/test_ola.py b/support/testing/tests/package/test_ola.py
new file mode 100644
index 0000000000..017d6f7e3b
--- /dev/null
+++ b/support/testing/tests/package/test_ola.py
@@ -0,0 +1,95 @@
+import os
+
+import infra.basetest
+
+
+class TestOla(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_OLA=y
+        BR2_PACKAGE_OLA_EXAMPLES=y
+        BR2_PACKAGE_OLA_PLUGIN_DUMMY=y
+        BR2_PACKAGE_OLA_PYTHON_BINDINGS=y
+        BR2_PACKAGE_OLA_WEB=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+           # overlay to add a script to test ola python bindings
+           infra.filepath("tests/package/test_ola/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check program executes
+        cmd = "olad --version"
+        self.assertRunOk(cmd)
+
+        # Start the daemon and wait a bit for it to settle
+        cmd = "olad --daemon && sleep 2"
+        self.assertRunOk(cmd)
+
+        # Check dummy plugin is loaded
+        cmd = "ola_plugin_info | grep -Fi dummy"
+        self.assertRunOk(cmd)
+
+        # Check dummy device and port are listed
+        cmd = "ola_dev_info"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("Device 1: Dummy Device", output[0])
+        self.assertIn("port 0, OUT Dummy Port", output[1])
+
+        # Create Universe 0
+        cmd = "ola_patch --device 1 --port 0 --universe 0"
+        self.assertRunOk(cmd)
+
+        # Check Universe 0 is created
+        cmd = "ola_dev_info"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("patched to universe 0", output[1])
+
+        # Discover Dummy device RDM UID
+        cmd = "ola_rdm_discover --universe 0 | head -1"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        rdm_uid = output[0]
+
+        # Get RDM manufacturer_label PID
+        cmd = "ola_rdm_get --universe 0 --uid {} manufacturer_label".format(rdm_uid)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Open Lighting Project")
+
+        # Get RDM dmx_start_address PID, checks default value is 1
+        cmd = "ola_rdm_get --universe 0 --uid {} dmx_start_address".format(rdm_uid)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "DMX Address: 1")
+
+        # Set RDM dmx_start_address PID to 2
+        cmd = "ola_rdm_set --universe 0 --uid {} dmx_start_address 2".format(rdm_uid)
+        self.assertRunOk(cmd)
+
+        # Get the new RDM dmx_start_address PID, checks value is now 2
+        cmd = "ola_rdm_get --universe 0 --uid {} dmx_start_address".format(rdm_uid)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "DMX Address: 2")
+
+        # Perform a full RDM discovery using python bindings. The test
+        # expect to find the same UID detected with the C client.
+        cmd = "sample_ola_rdm_discovery.py | head -1"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], rdm_uid)
+
+        # Test olad web interface
+        cmd = "wget -q -O - http://127.0.0.1:9090/ola.html | grep -F '<title>OLA Admin</title>'"
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py b/support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py
new file mode 100755
index 0000000000..c2aa0733bb
--- /dev/null
+++ b/support/testing/tests/package/test_ola/rootfs-overlay/usr/bin/sample_ola_rdm_discovery.py
@@ -0,0 +1,24 @@
+#! /usr/bin/env python3
+
+import sys
+
+from ola.ClientWrapper import ClientWrapper
+
+
+def show_uids(state, uids):
+    if state.Succeeded():
+        for uid in uids:
+            print(str(uid))
+    else:
+        print('Error: %s' % state.message, file=sys.stderr)
+    wrapper.Stop()
+
+
+wrapper = ClientWrapper()
+client = wrapper.Client()
+universe = 0
+full_discovery = True
+
+client.RunRDMDiscovery(universe, full_discovery, show_uids)
+
+wrapper.Run()
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
