Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA5AD5E378
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 17:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A087242C53;
	Sat,  9 Nov 2024 17:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZlTQF_38G4yq; Sat,  9 Nov 2024 17:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED1F42C50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ED1F42C50;
	Sat,  9 Nov 2024 17:13:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D405DAD
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65D4D400BF
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ll08qDewVk-q for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 17:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 224D7400D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 224D7400D0
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 17:13:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BE9785F07; Sat,  9 Nov 2024 17:13:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 17:32:35 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a2c6a7a9f394a13247f4fc613afd2232bc23ccdf
X-Git-Newrev: 5dc99e10e124c5b1b12f69f528e6b3239e7bfefc
X-Patchwork-Hint: ignore
Message-Id: <20241109171330.1BE9785F07@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add
 iputils runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5dc99e10e124c5b1b12f69f528e6b3239e7bfefc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eda78597eb4edef4f8cd842bbe3eb110fb2fb1b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_iputils.py | 48 +++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4422e9dc18..f976f16c2b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1812,6 +1812,7 @@ F:	support/testing/tests/package/test_iperf.py
 F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_iproute2.py
 F:	support/testing/tests/package/test_iptables.py
+F:	support/testing/tests/package/test_iputils.py
 F:	support/testing/tests/package/test_jailhouse.py
 F:	support/testing/tests/package/test_jq.py
 F:	support/testing/tests/package/test_jq/
diff --git a/support/testing/tests/package/test_iputils.py b/support/testing/tests/package/test_iputils.py
new file mode 100644
index 0000000000..5f4ba9873b
--- /dev/null
+++ b/support/testing/tests/package/test_iputils.py
@@ -0,0 +1,48 @@
+import os
+
+import infra.basetest
+
+
+class TestIputils(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IPUTILS=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check all the main programs of iputils can execute and
+        # report their version. Note the "-V" option is not accepted
+        # and fails if the "ping" applet of BusyBox is used instead.
+        iputils_progs = ["arping", "clockdiff", "ping", "tracepath"]
+        for prog in iputils_progs:
+            self.assertRunOk(f"{prog} -V")
+
+        # Qemu host IP, See:
+        # https://wiki.qemu.org/Documentation/Networking#User_Networking_(SLIRP)
+        qemu_host = "10.0.2.2"
+
+        # We test the "arping" program, with 3 pings.
+        self.assertRunOk(f"arping -c 3 {qemu_host}", timeout=10)
+
+        # We test the "ping" program. We use the option "-D" which
+        # shows a timestamp and is also not supported by the "ping"
+        # BusyBox applet.
+        self.assertRunOk(f"ping -D -c 3 {qemu_host}", timeout=10)
+
+        # We test the "tracepath" program. We set the max hops to 2,
+        # since there is no intermediate routers.
+        self.assertRunOk(f"tracepath -m 2 {qemu_host}", timeout=10)
+
+        # We test the "clockdiff" program. We cannot use the Qemu host
+        # IP for this program as the ICMP TIMESTAMP is used and is not
+        # responded. We use the local host instead.
+        self.assertRunOk("clockdiff 127.0.0.1", timeout=10)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
