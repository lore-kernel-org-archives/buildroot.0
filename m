Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A68C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FCF460677;
	Mon,  3 Feb 2025 14:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2fV7Gkv7X1Z; Mon,  3 Feb 2025 14:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 657E5608EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 657E5608EE;
	Mon,  3 Feb 2025 14:44:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65A4F1A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48EE240578
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwntYfA1Fcqr for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0379740193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0379740193
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0379740193
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:44:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [109.89.232.55])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id CEC8B19F5C2;
 Mon,  3 Feb 2025 15:44:25 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Mon,  3 Feb 2025 15:44:20 +0100
Message-ID: <20250203144420.50351-2-vjardin@free.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203144420.50351-1-vjardin@free.fr>
References: <20241110184324.50580-2-vjardin@free.fr>
 <20250203144420.50351-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738593868;
 bh=oTZOCEhDUf/wDqEYL7HVn1E0laWHJ+7VKEXwcjrGwDQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pEk8cZ7FQGAdncxMXgQ+cKeDK1nxRQ7MdSQK0LjuXL8ocwTwhkaghXkI90MUae/Eg
 SiHOEqUq9tHvtMPu0EacRtaW09YWf505os3zxq0bGvH5DPBReBOlTZu2nglrGZLEGj
 ejU8//gYIWEtvMQ28vCEeJXUD7q+byXxq97zfPeajICxpJmLrqazCtu5Z++tHzDZ6v
 rI4IZ2se4BmIHqFsF/XqlWGDALEpn2aCK7ldMA7tYE6vano9BceGOJ2l3ejiKBiS6U
 IFXD2KwL/Fngaj6zJlY8ED4p4wA/TW/YdYjtWLkQP7IyxJr9guZpO17lyyJ8tFLNtD
 uJXRRLjl8BKsQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pEk8cZ7F
Subject: [Buildroot] [PATCH v2 1/1] board/nvidia/bf3: set eth names
 according to doc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set the names of the Ethernet interfaces that are exposed from a first
boot so they are aligned with those described by Mellanox/NVIDIA
documentation for the BF3.

Those tmfifo and oob interface names are describeded at:
  https://docs.nvidia.com/networking/display/bluefielddpuosv460/host-side+interface+configuration

When running the native Ubuntu on the BF3 board, the following udev
rules are set:
$ cat /etc/udev/rules.d/91-tmfifo_net.rules
SUBSYSTEM=="net", ACTION=="add", DEVPATH=="/devices/platform/MLNXBF01:00/virtio1/net/eth[0-9]", NAME="tmfifo_net0"

$ cat /etc/udev/rules.d/92-oob_net.rules
SUBSYSTEM=="net", ACTION=="add", DEVPATH=="/devices/platform/MLNXBF17:00/net/e*", NAME="oob_net0", RUN+="/sbin/sysctl -w net.ipv4.conf.oob_net0.arp_notify=1"

The default CX ports of the BF3 are:
ubuntu@bf$ ip link show p0
4: p0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode
   DEFAULT group default qlen 1000
    link/ether a0:88:c2:xx:xx:xx brd ff:ff:ff:ff:ff:ff
    altname enp3s0f0np0
ubuntu@bf$ ip link show p1
5: p1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode
   DEFAULT group default qlen 1000
    link/ether a0:88:c2:xx:xx:xx brd ff:ff:ff:ff:ff:ff
    altname enp3s0f1np1

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 .../bf3/rootfs_overlay/etc/init.d/S04ifnames  | 61 +++++++++++++++++++
 configs/nvidia_bf3_defconfig                  |  3 +
 2 files changed, 64 insertions(+)
 create mode 100755 board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames

diff --git a/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames b/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames
new file mode 100755
index 0000000000..adb43f1e2c
--- /dev/null
+++ b/board/nvidia/bf3/rootfs_overlay/etc/init.d/S04ifnames
@@ -0,0 +1,61 @@
+#!/bin/sh
+# Rename the board's interfaces according to Mellanox/NVIDIA's documentation
+
+rename_interface() {
+    bus_info=$1
+    new_name=$2
+    alt_name=$3
+
+    # Find the current interface name based on bus-info
+    iface=$(find /sys/class/net -type l -exec sh -c '
+        for i; do
+            [ "$(basename "$(readlink -f "$i"/device)")" = "$0" ] && basename "$i"
+        done
+    ' "$bus_info" {} +)
+
+    # Rename the interface if found
+    if [ -n "$iface" ]; then
+        ip link set "$iface" name "$new_name"
+        printf "%s to %s" "$iface" "$new_name"
+
+        # Set altname if provided
+        if [ -n "$alt_name" ]; then
+            ip link property add dev "$new_name" altname "$alt_name"
+            printf "/%s" "$alt_name"
+        fi
+        printf "; "
+    else
+        echo "$bus_info not found"
+    fi
+}
+
+case "$1" in
+    start)
+        printf "Starting interface renaming:"
+        # Initialize success flag
+        rename_allok=0
+        rename_interface "0000:03:00.0" "p0" "enp3s0f0np0" || rename_allok=1
+        rename_interface "0000:03:00.1" "p1" "enp3s0f1np1" || rename_allok=1
+        rename_interface "MLNXBF17:00" "oob_net0" "enamlnxbf17i0" || rename_allok=1
+        rename_interface "virtio1" "tmfifo_net0" || rename_allok=1
+
+	if [ "$rename_allok" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+        ;;
+    stop)
+        ;;
+    restart)
+        # Optional: Handle restart by calling start after stop
+        $0 stop
+        $0 start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
index 3f958c0062..c5b00aae83 100644
--- a/configs/nvidia_bf3_defconfig
+++ b/configs/nvidia_bf3_defconfig
@@ -10,3 +10,6 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/nvidia/bf3/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_OVERLAY="board/nvidia/bf3/rootfs_overlay"
+BR2_PACKAGE_LIBMNL=y
+BR2_PACKAGE_IPROUTE2=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
