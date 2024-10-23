Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF519CFA464
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F0F81270;
	Wed, 23 Oct 2024 20:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdJhFhg8Ydoy; Wed, 23 Oct 2024 20:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83B3281271
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B3281271;
	Wed, 23 Oct 2024 20:15:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 670074960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 486D481274
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFYYBBSM1aHR for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:15:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7781B81270
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7781B81270
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:15:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 641098640F; Wed, 23 Oct 2024 20:15:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 22:13:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09509a604571bd1c0df607eadff4e81c485f6d24
X-Git-Newrev: eda78597eb4edef4f8cd842bbe3eb110fb2fb1b0
X-Patchwork-Hint: ignore
Message-Id: <20241023201512.641098640F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add iputils runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eda78597eb4edef4f8cd842bbe3eb110fb2fb1b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_iputils.py | 48 +++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 136b82ce14..386b4ef38f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1911,6 +1911,7 @@ F:	support/testing/tests/package/test_iperf.py
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
