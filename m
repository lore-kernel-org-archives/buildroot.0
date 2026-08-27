Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092F9C61DC4
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C848380EF7;
	Thu, 27 Aug 2026 21:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjQfFnIZz0cN; Thu, 27 Aug 2026 21:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787864933;
	bh=f96T/kvo8Wl9gDa16rhDCa5ZnjsunUZ5+ryN4nChYVk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=khilnxBBwi0ZKblXfpN0yXFewAASngRyf6xbVQSa60BeTLF6VnHo+kNW5eHHBKF5a
	 5vQO8ndRvnTMb3Mi0G8h37JBV/d1uxo+fekPastpraWlo58YW1e7E9ixeWq7M1p0+b
	 qbr6UcgxO87O7Q9Qpu8R6vq0U1/HR/AfUs8tr0byKdwwblRvxxN/CIlbgUl55Vybix
	 uPpV9pQuaYz61rAniJ33LKZnwG8DR/+Knv0XuJzMXDX54sSWfEbHDU/fP281lUNb8O
	 cI+Vc+PVVkivQh0dKcaOJ+l1NZQKr4h1J6ri/Uoeau86akEHI8iq3X5YQ8LwWobKc2
	 dRKj+xYvA1IMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C62CD80F05;
	Thu, 27 Aug 2026 21:08:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01B8E334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7C81607EC
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLZ_aG82NsQy for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F81C607A0
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67B02920D9; Thu, 27 Aug 2026 21:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 22:49:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e62ac3a21111b1df279018c95e83eba2ec235b8
X-Git-Newrev: 6eaa34ecdf85a604fd813495bedbbf18648b54df
X-Patchwork-Hint: ignore
Message-Id: <20260827210749.67B02920D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: wpa_supplicant: new
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6eaa34ecdf85a604fd813495bedbbf18648b54df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |   2 +
 .../testing/tests/package/test_wpa_supplicant.py   | 121 +++++++++++++++++++++
 .../linux-mac80211-hwsim.fragment                  |   3 +
 .../rootfs-overlay/etc/hostapd.conf                |  14 +++
 .../rootfs-overlay/etc/wpa_supplicant.conf         |  13 +++
 5 files changed, 153 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 95a347588f..5e5f112783 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2065,6 +2065,8 @@ F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_wget.py
 F:	support/testing/tests/package/test_which.py
 F:	support/testing/tests/package/test_wine.py
+F:	support/testing/tests/package/test_wpa_supplicant.py
+F:	support/testing/tests/package/test_wpa_supplicant/
 F:	support/testing/tests/package/test_xfsprogs.py
 F:	support/testing/tests/package/test_xfsprogs/
 F:	support/testing/tests/package/test_xvisor.py
diff --git a/support/testing/tests/package/test_wpa_supplicant.py b/support/testing/tests/package/test_wpa_supplicant.py
new file mode 100644
index 0000000000..ba6cef3fef
--- /dev/null
+++ b/support/testing/tests/package/test_wpa_supplicant.py
@@ -0,0 +1,121 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestWPASupplicant(infra.basetest.BRTest):
+    test_dir = "tests/package/test_wpa_supplicant"
+    # This test uses the mac80211_hwsim kernel test driver. See:
+    # https://docs.kernel.org/networking/mac80211_hwsim/mac80211_hwsim.html
+    kern_frag = \
+        infra.filepath(f"{test_dir}/linux-mac80211-hwsim.fragment")
+    rootfs_overlay = \
+        infra.filepath(f"{test_dir}/rootfs-overlay")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.44"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_HOSTAPD=y
+        BR2_PACKAGE_IPROUTE2=y
+        BR2_PACKAGE_IW=y
+        BR2_PACKAGE_WPA_SUPPLICANT=y
+        BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        disk = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        bootargs = ["root=/dev/vda"]
+        qemu_opts = ["-M", "virt", "-cpu", "cortex-a57", "-m", "512M",
+                     "-drive", f"file={disk},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=bootargs,
+                           options=qemu_opts)
+        self.emulator.login()
+
+        # We check the program can run.
+        self.assertRunOk("wpa_supplicant -v")
+
+        # We define a network namespace to isolate our
+        # access point components.
+        ns = "ap-ns"
+
+        # We create the network namespace.
+        self.assertRunOk(f"ip netns add {ns}")
+
+        # We isolate our wireless network device in our namespace.
+        self.assertRunOk(f"iw phy phy0 set netns name {ns}")
+
+        # We define the command prefix to execute commands inside
+        # our network namespace.
+        ns_exec = f"ip netns exec {ns}"
+
+        # We start the hostapd daemon.
+        cmd = [
+            ns_exec,
+            "hostapd",
+            "-B",
+            "-f /var/log/hostapd.log",
+            "/etc/hostapd.conf"
+        ]
+        self.assertRunOk(" ".join(cmd))
+
+        # We wait for the wlan0 interface to come up.
+        for attempt in range(10):
+            time.sleep(3)
+
+            cmd = ns_exec
+            cmd += " cat /sys/class/net/wlan0/operstate"
+            out, ret = self.emulator.run(cmd)
+            self.assertEqual(ret, 0)
+            if out[0] == "up":
+                break
+        else:
+            self.fail("Timeout while waiting for wlan0 to be up.")
+
+        # We start the wpa_supplicant client process.
+        cmd = [
+            "wpa_supplicant",
+            "-B",
+            "-f /var/log/wpa_supplicant.log",
+            "-i wlan1",
+            "-c /etc/wpa_supplicant.conf"
+        ]
+        self.assertRunOk(" ".join(cmd))
+
+        # We wait for the wlan1 interface to come up.
+        for attempt in range(10):
+            time.sleep(3)
+
+            cmd = "cat /sys/class/net/wlan1/operstate"
+            out, ret = self.emulator.run(cmd)
+            self.assertEqual(ret, 0)
+            if out[0] == "up":
+                break
+        else:
+            self.fail("Timeout while waiting for wlan1 to be up.")
+
+        # We set an IP address on the wlan0 hostapd side.
+        cmd = ns_exec
+        cmd += " ip addr add dev wlan0 192.168.1.111/24"
+        self.assertRunOk(cmd)
+
+        # We set an IP address on the wlan1 wpa_supplicant side.
+        self.assertRunOk("ip addr add dev wlan1 192.168.1.222/24")
+
+        # We check we can ping the hostapd wlan0 IP address.
+        self.assertRunOk("ping -c 3 -i 0.2 -W 2 192.168.1.111")
diff --git a/support/testing/tests/package/test_wpa_supplicant/linux-mac80211-hwsim.fragment b/support/testing/tests/package/test_wpa_supplicant/linux-mac80211-hwsim.fragment
new file mode 100644
index 0000000000..30aee1e9a0
--- /dev/null
+++ b/support/testing/tests/package/test_wpa_supplicant/linux-mac80211-hwsim.fragment
@@ -0,0 +1,3 @@
+CONFIG_CFG80211=y
+CONFIG_MAC80211=y
+CONFIG_MAC80211_HWSIM=y
diff --git a/support/testing/tests/package/test_wpa_supplicant/rootfs-overlay/etc/hostapd.conf b/support/testing/tests/package/test_wpa_supplicant/rootfs-overlay/etc/hostapd.conf
new file mode 100644
index 0000000000..b7c3c1a446
--- /dev/null
+++ b/support/testing/tests/package/test_wpa_supplicant/rootfs-overlay/etc/hostapd.conf
@@ -0,0 +1,14 @@
+# Config example taken from kernel
+# Documentation/networking/mac80211_hwsim/hostapd.conf
+
+interface=wlan0
+driver=nl80211
+
+hw_mode=g
+channel=1
+ssid=mac80211 test
+
+wpa=2
+wpa_key_mgmt=WPA-PSK
+wpa_pairwise=CCMP
+wpa_passphrase=12345678
diff --git a/support/testing/tests/package/test_wpa_supplicant/rootfs-overlay/etc/wpa_supplicant.conf b/support/testing/tests/package/test_wpa_supplicant/rootfs-overlay/etc/wpa_supplicant.conf
new file mode 100644
index 0000000000..3914a03046
--- /dev/null
+++ b/support/testing/tests/package/test_wpa_supplicant/rootfs-overlay/etc/wpa_supplicant.conf
@@ -0,0 +1,13 @@
+# Config example taken from kernel
+# Documentation/networking/mac80211_hwsim/wpa_supplicant.conf
+
+ctrl_interface=/var/run/wpa_supplicant
+
+network={
+	ssid="mac80211 test"
+	psk="12345678"
+	key_mgmt=WPA-PSK
+	proto=WPA2
+	pairwise=CCMP
+	group=CCMP
+}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
