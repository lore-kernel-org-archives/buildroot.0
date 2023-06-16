Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680C6EB64D9
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 00:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152AD42053;
	Fri, 16 Jun 2023 00:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152AD42053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnQslJRfkY5O; Fri, 16 Jun 2023 00:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE4241FC6;
	Fri, 16 Jun 2023 00:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FE4241FC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F196B1BF286
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 00:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D29C360B89
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 00:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D29C360B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOLRW33vJFbR for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 00:24:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A1A60B7C
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2A1A60B7C
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 00:24:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35G0ODdT039837
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 19:24:13 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35G0ODsi054007
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 19:24:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 19:24:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 19:24:13 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35G0OCSI015831;
 Thu, 15 Jun 2023 19:24:13 -0500
To: <buildroot@buildroot.org>
Date: Thu, 15 Jun 2023 19:23:58 -0500
Message-ID: <20230616002359.4139814-10-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616002359.4139814-1-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1686875053;
 bh=BQo7PHUMPV2F5X7AQkRHBXhMTUiX6KzzDMu9Kmp+Eng=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=oRHO/a+h6UOnwZtIF6U1DXzAtlQ/6JYJYd6nKYUzlSoE30j/DN46f5LU02W37f6ON
 EYvQnsyuOXtBI/XoFQEO4T/DAT5q3lwaJnD520IXM4watpHe0C5iKKoqPO2KUMJH+C
 No5DtZkx13S6yXB2CO+T6dRVVtFCED8/qxMtwZYo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=oRHO/a+h
Subject: [Buildroot] [PATCH v8 09/10] package/ti-rogue-um: new package
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package adds the userspace libraries for the Rogue graphics
accelerator of the following Texas Instruments SoCs: AM62, J721E,
J721S2, and J784S4.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
---
 package/Config.in                             |   1 +
 .../0001-all-drop-the-init-script.patch       | 832 ++++++++++++++++++
 package/ti-rogue-um/Config.in                 |  52 ++
 package/ti-rogue-um/ti-rogue-um.hash          |   3 +
 package/ti-rogue-um/ti-rogue-um.mk            |  38 +
 5 files changed, 926 insertions(+)
 create mode 100644 package/ti-rogue-um/0001-all-drop-the-init-script.patch
 create mode 100644 package/ti-rogue-um/Config.in
 create mode 100644 package/ti-rogue-um/ti-rogue-um.hash
 create mode 100644 package/ti-rogue-um/ti-rogue-um.mk

diff --git a/package/Config.in b/package/Config.in
index 96ef0d72de..0bff1135aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -614,6 +614,7 @@ endmenu
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
 	source "package/ti-rogue-km/Config.in"
+	source "package/ti-rogue-um/Config.in"
 	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
 	source "package/ti-sgx-um/Config.in"
diff --git a/package/ti-rogue-um/0001-all-drop-the-init-script.patch b/package/ti-rogue-um/0001-all-drop-the-init-script.patch
new file mode 100644
index 0000000000..4f3dd1cbb1
--- /dev/null
+++ b/package/ti-rogue-um/0001-all-drop-the-init-script.patch
@@ -0,0 +1,832 @@
+From 99e0da8a1c08818c59680f726e11a84b26daf29f Mon Sep 17 00:00:00 2001
+From: Randolph Sapp <rs@ti.com>
+Date: Thu, 25 May 2023 18:59:26 -0500
+Subject: [PATCH] all: drop the init script
+
+Nobody should be using this anymore. It's sysVinit and it's just a fancy
+wrapper around modprobe anyway. We'll be dropping it from our build
+tools soon.
+
+Signed-off-by: Randolph Sapp <rs@ti.com>
+---
+ .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
+ .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
+ .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
+ .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
+ 4 files changed, 784 deletions(-)
+ delete mode 100755 targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
+ delete mode 100755 targetfs/j721e_linux/wayland/release/etc/init.d/rc.pvr
+ delete mode 100755 targetfs/j721s2_linux/wayland/release/etc/init.d/rc.pvr
+ delete mode 100755 targetfs/j784s4_linux/wayland/release/etc/init.d/rc.pvr
+
+diff --git a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr b/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
+deleted file mode 100755
+index 428cd86..0000000
+--- a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
++++ /dev/null
+@@ -1,196 +0,0 @@
+-#!/bin/bash
+-############################################################################ ###
+-#@Copyright     Copyright (c) Imagination Technologies Ltd. All Rights Reserved
+-#@License       MIT
+-# The contents of this file are subject to the MIT license as set out below.
+-#
+-# Permission is hereby granted, free of charge, to any person obtaining a copy
+-# of this software and associated documentation files (the "Software"), to deal
+-# in the Software without restriction, including without limitation the rights
+-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+-# copies of the Software, and to permit persons to whom the Software is
+-# furnished to do so, subject to the following conditions:
+-#
+-# The above copyright notice and this permission notice shall be included in
+-# all copies or substantial portions of the Software.
+-#
+-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+-# THE SOFTWARE.
+-#### ###########################################################################
+-
+-# Auto-generated for am62_linux from rogueddk_1.15@6133109
+-#
+-
+-load_pvr()
+-{
+-	load_modules_exit_status=0
+-
+-	# Load the PVR Services module.
+-	#
+-	
+-	if [ -n "$PVR_SRVKM_PARAMS" ] && ! /sbin/modprobe -q pvrsrvkm --dry-run --first-time; then
+-		echo "Cannot set parameters for pvrsrvkm. Module already loaded."
+-		some_modules_already_loaded=1
+-		readonly load_modules_exit_status=1
+-	elif ! /sbin/modprobe -q pvrsrvkm $PVR_SRVKM_PARAMS; then
+-		echo "Module pvrsrvkm failed to load. Retrying."
+-		if [ -z $depmod_has_been_run ]; then
+-			if [ -e /sbin/depmod ]; then
+-				echo "Running /sbin/depmod"
+-				/sbin/depmod && depmod_has_been_run=1
+-			fi
+-		fi
+-		if ! /sbin/modprobe -q pvrsrvkm $PVR_SRVKM_PARAMS ; then return; fi
+-	fi
+-
+-	# Reload udev rules
+-	#
+-	if [ -e /sbin/udevadm ]; then
+-		/sbin/udevadm control --reload-rules
+-	fi
+-
+-	# Load 3rd party module(s).
+-	#
+-		
+-	if [ -z "$PVR_LOAD_MODULES_ONLY" ]; then
+-		# Create the directory for the Wayland socket.
+-		#
+-		if [ -z "$XDG_RUNTIME_DIR" ]; then
+-			export XDG_RUNTIME_DIR=/tmp/wayland
+-		fi
+-		if [ ! -e $XDG_RUNTIME_DIR ]; then
+-			mkdir $XDG_RUNTIME_DIR && chmod 0700 $XDG_RUNTIME_DIR
+-		fi
+-
+-		# If PDumping, enable software rendering for Weston to ensure that
+-		# pdump doesn't capture any output from Weston itself.
+-		#
+-		if pgrep -x pdump > /dev/null 2>&1; then
+-				export GBM_ALWAYS_SOFTWARE=1
+-				export LIBGL_ALWAYS_SOFTWARE=1
+-		fi
+-
+-		# Try to work out the device node for the display controller.
+-		#
+-		for dev in /dev/dri/card*; do
+-			dev_major=$(($(stat -c '0x%t' "$dev")))
+-			dev_minor=$(($(stat -c '0x%T' "$dev")))
+-			sys_path=$(readlink -f /sys/dev/char/$dev_major\:$dev_minor)
+-
+-			while [ -e "$sys_path" -a "$sys_path" != "/sys" ]; do
+-				if [ ! -e "${sys_path}/driver" ]; then
+-					sys_path="$(dirname "$sys_path")"
+-					continue
+-				fi
+-
+-				module="$(basename "$(readlink -f "$sys_path/driver/module")")"
+-				if [ "$module" = "DISPLAY_CONTROLLER" ]; then
+-					drm_card="$(basename "$dev")"
+-				fi
+-				break
+-			done
+-
+-			if [ -n "$drm_card" ]; then
+-				break
+-			fi
+-		done
+-
+-		if [ -e "${XDG_RUNTIME_DIR}/weston.pgid" ]; then
+-			echo "Weston is already running. If this is not the case run:"
+-			echo "$ sudo rm ${XDG_RUNTIME_DIR}/weston.pgid"
+-			echo
+-		else
+-			# Get a TTY for Weston to use.
+-			#
+-			if [ -x "$(which openvt)" ] && [ -e "/sys/class/tty/tty0/active" ]; then
+-				openvt -s -l && read unused_tty < /sys/class/tty/tty0/active
+-			fi
+-
+-			# Launch Weston.
+-			#
+-			if [ -n "$drm_card" ]; then
+-				if [ -n "$unused_tty" ]; then
+-					ps -p $$ -o pgid= > "${XDG_RUNTIME_DIR}/weston.pgid"
+-					/usr/bin/weston --backend=drm-backend.so --drm-device="$drm_card" --tty="${unused_tty//[!0-9]}" --idle-time=0  &
+-				else
+-					last_tty_path="$(ls /dev/tty[1-9][0-9] | sort -V |tail -n 1)"
+-
+-					echo "To start Weston run (specifying a tty within the given range):"
+-					echo "$ sudo /usr/bin/weston --backend=drm-backend.so --drm-device=$drm_card --tty=<8..${last_tty_path//[!0-9]}> --idle-time=0 &"
+-					echo
+-				fi
+-			else
+-				echo "Couldn't start Weston automatically."
+-			fi
+-		fi
+-	fi
+-
+-	if [ -n "$some_modules_already_loaded" ]; then
+-		echo
+-		echo "Could not set parameters for some modules."
+-		echo "To fix this ensure automatic loading of those modules is disabled and restart the driver."
+-		echo "See the platform guide for more details."
+-	else
+-		echo "Loaded PowerVR consumer services."
+-	fi
+-
+-	return $load_modules_exit_status;
+-}
+-
+-unload_pvr()
+-{
+-	if [ -z "$XDG_RUNTIME_DIR" ]; then
+-		XDG_RUNTIME_DIR=/tmp/wayland
+-	fi
+-
+-	# Stop Weston.
+-	#
+-	if [ -f "${XDG_RUNTIME_DIR}/weston.pgid" ]; then
+-		read WESTON_PGID < "${XDG_RUNTIME_DIR}/weston.pgid" && [ -n "$WESTON_PGID" ] && WESTON_PID=$(pgrep -g $WESTON_PGID -x weston) && [ -n "$WESTON_PID" ] && kill $WESTON_PID && while [ -e /proc/$WESTON_PID ] ; do sleep 1; done
+-		rm "${XDG_RUNTIME_DIR}/weston.pgid"
+-	elif pgrep -x weston > /dev/null; then
+-		echo "Warning: Found one of more instances of Weston running."
+-		echo "         This may prevent the driver from being unloaded."
+-	fi
+-
+-	# Unload 3rd party module(s).
+-	#
+-		
+-	# Unload the PVR Services module.
+-	#
+-	if /sbin/modprobe -r pvrsrvkm; then :; else return 1; fi
+-
+-	echo "Unloaded PowerVR consumer services."
+-	return 0;
+-}
+-
+-# Deal with the type of invocation we get.
+-#
+-case "$1" in
+-start)
+-	load_pvr
+-	;;
+-stop)
+-	if ! unload_pvr; then
+-		echo "Couldn't unload modules" >&2;
+-		exit 1
+-	fi
+-	;;
+-reload|restart)
+-	if unload_pvr; then
+-		load_pvr
+-	else
+-		echo "Couldn't unload modules" >&2;
+-		exit 1
+-	fi
+-	;;
+-*)
+-	echo "$0: unknown argument $1." >&2;
+-	;;
+-esac
+-
+diff --git a/targetfs/j721e_linux/wayland/release/etc/init.d/rc.pvr b/targetfs/j721e_linux/wayland/release/etc/init.d/rc.pvr
+deleted file mode 100755
+index c3cae31..0000000
+--- a/targetfs/j721e_linux/wayland/release/etc/init.d/rc.pvr
++++ /dev/null
+@@ -1,196 +0,0 @@
+-#!/bin/bash
+-############################################################################ ###
+-#@Copyright     Copyright (c) Imagination Technologies Ltd. All Rights Reserved
+-#@License       MIT
+-# The contents of this file are subject to the MIT license as set out below.
+-#
+-# Permission is hereby granted, free of charge, to any person obtaining a copy
+-# of this software and associated documentation files (the "Software"), to deal
+-# in the Software without restriction, including without limitation the rights
+-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+-# copies of the Software, and to permit persons to whom the Software is
+-# furnished to do so, subject to the following conditions:
+-#
+-# The above copyright notice and this permission notice shall be included in
+-# all copies or substantial portions of the Software.
+-#
+-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+-# THE SOFTWARE.
+-#### ###########################################################################
+-
+-# Auto-generated for j721e_linux from rogueddk_1.15@6133109
+-#
+-
+-load_pvr()
+-{
+-	load_modules_exit_status=0
+-
+-	# Load the PVR Services module.
+-	#
+-	
+-	if [ -n "$PVR_SRVKM_PARAMS" ] && ! /sbin/modprobe -q pvrsrvkm --dry-run --first-time; then
+-		echo "Cannot set parameters for pvrsrvkm. Module already loaded."
+-		some_modules_already_loaded=1
+-		readonly load_modules_exit_status=1
+-	elif ! /sbin/modprobe -q pvrsrvkm $PVR_SRVKM_PARAMS; then
+-		echo "Module pvrsrvkm failed to load. Retrying."
+-		if [ -z $depmod_has_been_run ]; then
+-			if [ -e /sbin/depmod ]; then
+-				echo "Running /sbin/depmod"
+-				/sbin/depmod && depmod_has_been_run=1
+-			fi
+-		fi
+-		if ! /sbin/modprobe -q pvrsrvkm $PVR_SRVKM_PARAMS ; then return; fi
+-	fi
+-
+-	# Reload udev rules
+-	#
+-	if [ -e /sbin/udevadm ]; then
+-		/sbin/udevadm control --reload-rules
+-	fi
+-
+-	# Load 3rd party module(s).
+-	#
+-		
+-	if [ -z "$PVR_LOAD_MODULES_ONLY" ]; then
+-		# Create the directory for the Wayland socket.
+-		#
+-		if [ -z "$XDG_RUNTIME_DIR" ]; then
+-			export XDG_RUNTIME_DIR=/tmp/wayland
+-		fi
+-		if [ ! -e $XDG_RUNTIME_DIR ]; then
+-			mkdir $XDG_RUNTIME_DIR && chmod 0700 $XDG_RUNTIME_DIR
+-		fi
+-
+-		# If PDumping, enable software rendering for Weston to ensure that
+-		# pdump doesn't capture any output from Weston itself.
+-		#
+-		if pgrep -x pdump > /dev/null 2>&1; then
+-				export GBM_ALWAYS_SOFTWARE=1
+-				export LIBGL_ALWAYS_SOFTWARE=1
+-		fi
+-
+-		# Try to work out the device node for the display controller.
+-		#
+-		for dev in /dev/dri/card*; do
+-			dev_major=$(($(stat -c '0x%t' "$dev")))
+-			dev_minor=$(($(stat -c '0x%T' "$dev")))
+-			sys_path=$(readlink -f /sys/dev/char/$dev_major\:$dev_minor)
+-
+-			while [ -e "$sys_path" -a "$sys_path" != "/sys" ]; do
+-				if [ ! -e "${sys_path}/driver" ]; then
+-					sys_path="$(dirname "$sys_path")"
+-					continue
+-				fi
+-
+-				module="$(basename "$(readlink -f "$sys_path/driver/module")")"
+-				if [ "$module" = "DISPLAY_CONTROLLER" ]; then
+-					drm_card="$(basename "$dev")"
+-				fi
+-				break
+-			done
+-
+-			if [ -n "$drm_card" ]; then
+-				break
+-			fi
+-		done
+-
+-		if [ -e "${XDG_RUNTIME_DIR}/weston.pgid" ]; then
+-			echo "Weston is already running. If this is not the case run:"
+-			echo "$ sudo rm ${XDG_RUNTIME_DIR}/weston.pgid"
+-			echo
+-		else
+-			# Get a TTY for Weston to use.
+-			#
+-			if [ -x "$(which openvt)" ] && [ -e "/sys/class/tty/tty0/active" ]; then
+-				openvt -s -l && read unused_tty < /sys/class/tty/tty0/active
+-			fi
+-
+-			# Launch Weston.
+-			#
+-			if [ -n "$drm_card" ]; then
+-				if [ -n "$unused_tty" ]; then
+-					ps -p $$ -o pgid= > "${XDG_RUNTIME_DIR}/weston.pgid"
+-					/usr/bin/weston --backend=drm-backend.so --drm-device="$drm_card" --tty="${unused_tty//[!0-9]}" --idle-time=0  &
+-				else
+-					last_tty_path="$(ls /dev/tty[1-9][0-9] | sort -V |tail -n 1)"
+-
+-					echo "To start Weston run (specifying a tty within the given range):"
+-					echo "$ sudo /usr/bin/weston --backend=drm-backend.so --drm-device=$drm_card --tty=<8..${last_tty_path//[!0-9]}> --idle-time=0 &"
+-					echo
+-				fi
+-			else
+-				echo "Couldn't start Weston automatically."
+-			fi
+-		fi
+-	fi
+-
+-	if [ -n "$some_modules_already_loaded" ]; then
+-		echo
+-		echo "Could not set parameters for some modules."
+-		echo "To fix this ensure automatic loading of those modules is disabled and restart the driver."
+-		echo "See the platform guide for more details."
+-	else
+-		echo "Loaded PowerVR consumer services."
+-	fi
+-
+-	return $load_modules_exit_status;
+-}
+-
+-unload_pvr()
+-{
+-	if [ -z "$XDG_RUNTIME_DIR" ]; then
+-		XDG_RUNTIME_DIR=/tmp/wayland
+-	fi
+-
+-	# Stop Weston.
+-	#
+-	if [ -f "${XDG_RUNTIME_DIR}/weston.pgid" ]; then
+-		read WESTON_PGID < "${XDG_RUNTIME_DIR}/weston.pgid" && [ -n "$WESTON_PGID" ] && WESTON_PID=$(pgrep -g $WESTON_PGID -x weston) && [ -n "$WESTON_PID" ] && kill $WESTON_PID && while [ -e /proc/$WESTON_PID ] ; do sleep 1; done
+-		rm "${XDG_RUNTIME_DIR}/weston.pgid"
+-	elif pgrep -x weston > /dev/null; then
+-		echo "Warning: Found one of more instances of Weston running."
+-		echo "         This may prevent the driver from being unloaded."
+-	fi
+-
+-	# Unload 3rd party module(s).
+-	#
+-		
+-	# Unload the PVR Services module.
+-	#
+-	if /sbin/modprobe -r pvrsrvkm; then :; else return 1; fi
+-
+-	echo "Unloaded PowerVR consumer services."
+-	return 0;
+-}
+-
+-# Deal with the type of invocation we get.
+-#
+-case "$1" in
+-start)
+-	load_pvr
+-	;;
+-stop)
+-	if ! unload_pvr; then
+-		echo "Couldn't unload modules" >&2;
+-		exit 1
+-	fi
+-	;;
+-reload|restart)
+-	if unload_pvr; then
+-		load_pvr
+-	else
+-		echo "Couldn't unload modules" >&2;
+-		exit 1
+-	fi
+-	;;
+-*)
+-	echo "$0: unknown argument $1." >&2;
+-	;;
+-esac
+-
+diff --git a/targetfs/j721s2_linux/wayland/release/etc/init.d/rc.pvr b/targetfs/j721s2_linux/wayland/release/etc/init.d/rc.pvr
+deleted file mode 100755
+index 08190a9..0000000
+--- a/targetfs/j721s2_linux/wayland/release/etc/init.d/rc.pvr
++++ /dev/null
+@@ -1,196 +0,0 @@
+-#!/bin/bash
+-############################################################################ ###
+-#@Copyright     Copyright (c) Imagination Technologies Ltd. All Rights Reserved
+-#@License       MIT
+-# The contents of this file are subject to the MIT license as set out below.
+-#
+-# Permission is hereby granted, free of charge, to any person obtaining a copy
+-# of this software and associated documentation files (the "Software"), to deal
+-# in the Software without restriction, including without limitation the rights
+-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+-# copies of the Software, and to permit persons to whom the Software is
+-# furnished to do so, subject to the following conditions:
+-#
+-# The above copyright notice and this permission notice shall be included in
+-# all copies or substantial portions of the Software.
+-#
+-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+-# THE SOFTWARE.
+-#### ###########################################################################
+-
+-# Auto-generated for j721s2_linux from rogueddk_1.15@6133109
+-#
+-
+-load_pvr()
+-{
+-	load_modules_exit_status=0
+-
+-	# Load the PVR Services module.
+-	#
+-	
+-	if [ -n "$PVR_SRVKM_PARAMS" ] && ! /sbin/modprobe -q pvrsrvkm --dry-run --first-time; then
+-		echo "Cannot set parameters for pvrsrvkm. Module already loaded."
+-		some_modules_already_loaded=1
+-		readonly load_modules_exit_status=1
+-	elif ! /sbin/modprobe -q pvrsrvkm $PVR_SRVKM_PARAMS; then
+-		echo "Module pvrsrvkm failed to load. Retrying."
+-		if [ -z $depmod_has_been_run ]; then
+-			if [ -e /sbin/depmod ]; then
+-				echo "Running /sbin/depmod"
+-				/sbin/depmod && depmod_has_been_run=1
+-			fi
+-		fi
+-		if ! /sbin/modprobe -q pvrsrvkm $PVR_SRVKM_PARAMS ; then return; fi
+-	fi
+-
+-	# Reload udev rules
+-	#
+-	if [ -e /sbin/udevadm ]; then
+-		/sbin/udevadm control --reload-rules
+-	fi
+-
+-	# Load 3rd party module(s).
+-	#
+-		
+-	if [ -z "$PVR_LOAD_MODULES_ONLY" ]; then
+-		# Create the directory for the Wayland socket.
+-		#
+-		if [ -z "$XDG_RUNTIME_DIR" ]; then
+-			export XDG_RUNTIME_DIR=/tmp/wayland
+-		fi
+-		if [ ! -e $XDG_RUNTIME_DIR ]; then
+-			mkdir $XDG_RUNTIME_DIR && chmod 0700 $XDG_RUNTIME_DIR
+-		fi
+-
+-		# If PDumping, enable software rendering for Weston to ensure that
+-		# pdump doesn't capture any output from Weston itself.
+-		#
+-		if pgrep -x pdump > /dev/null 2>&1; then
+-				export GBM_ALWAYS_SOFTWARE=1
+-				export LIBGL_ALWAYS_SOFTWARE=1
+-		fi
+-
+-		# Try to work out the device node for the display controller.
+-		#
+-		for dev in /dev/dri/card*; do
+-			dev_major=$(($(stat -c '0x%t' "$dev")))
+-			dev_minor=$(($(stat -c '0x%T' "$dev")))
+-			sys_path=$(readlink -f /sys/dev/char/$dev_major\:$dev_minor)
+-
+-			while [ -e "$sys_path" -a "$sys_path" != "/sys" ]; do
+-				if [ ! -e "${sys_path}/driver" ]; then
+-					sys_path="$(dirname "$sys_path")"
+-					continue
+-				fi
+-
+-				module="$(basename "$(readlink -f "$sys_path/driver/module")")"
+-				if [ "$module" = "DISPLAY_CONTROLLER" ]; then
+-					drm_card="$(basename "$dev")"
+-				fi
+-				break
+-			done
+-
+-			if [ -n "$drm_card" ]; then
+-				break
+-			fi
+-		done
+-
+-		if [ -e "${XDG_RUNTIME_DIR}/weston.pgid" ]; then
+-			echo "Weston is already running. If this is not the case run:"
+-			echo "$ sudo rm ${XDG_RUNTIME_DIR}/weston.pgid"
+-			echo
+-		else
+-			# Get a TTY for Weston to use.
+-			#
+-			if [ -x "$(which openvt)" ] && [ -e "/sys/class/tty/tty0/active" ]; then
+-				openvt -s -l && read unused_tty < /sys/class/tty/tty0/active
+-			fi
+-
+-			# Launch Weston.
+-			#
+-			if [ -n "$drm_card" ]; then
+-				if [ -n "$unused_tty" ]; then
+-					ps -p $$ -o pgid= > "${XDG_RUNTIME_DIR}/weston.pgid"
+-					/usr/bin/weston --backend=drm-backend.so --drm-device="$drm_card" --tty="${unused_tty//[!0-9]}" --idle-time=0  &
+-				else
+-					last_tty_path="$(ls /dev/tty[1-9][0-9] | sort -V |tail -n 1)"
+-
+-					echo "To start Weston run (specifying a tty within the given range):"
+-					echo "$ sudo /usr/bin/weston --backend=drm-backend.so --drm-device=$drm_card --tty=<8..${last_tty_path//[!0-9]}> --idle-time=0 &"
+-					echo
+-				fi
+-			else
+-				echo "Couldn't start Weston automatically."
+-			fi
+-		fi
+-	fi
+-
+-	if [ -n "$some_modules_already_loaded" ]; then
+-		echo
+-		echo "Could not set parameters for some modules."
+-		echo "To fix this ensure automatic loading of those modules is disabled and restart the driver."
+-		echo "See the platform guide for more details."
+-	else
+-		echo "Loaded PowerVR consumer services."
+-	fi
+-
+-	return $load_modules_exit_status;
+-}
+-
+-unload_pvr()
+-{
+-	if [ -z "$XDG_RUNTIME_DIR" ]; then
+-		XDG_RUNTIME_DIR=/tmp/wayland
+-	fi
+-
+-	# Stop Weston.
+-	#
+-	if [ -f "${XDG_RUNTIME_DIR}/weston.pgid" ]; then
+-		read WESTON_PGID < "${XDG_RUNTIME_DIR}/weston.pgid" && [ -n "$WESTON_PGID" ] && WESTON_PID=$(pgrep -g $WESTON_PGID -x weston) && [ -n "$WESTON_PID" ] && kill $WESTON_PID && while [ -e /proc/$WESTON_PID ] ; do sleep 1; done
+-		rm "${XDG_RUNTIME_DIR}/weston.pgid"
+-	elif pgrep -x weston > /dev/null; then
+-		echo "Warning: Found one of more instances of Weston running."
+-		echo "         This may prevent the driver from being unloaded."
+-	fi
+-
+-	# Unload 3rd party module(s).
+-	#
+-		
+-	# Unload the PVR Services module.
+-	#
+-	if /sbin/modprobe -r pvrsrvkm; then :; else return 1; fi
+-
+-	echo "Unloaded PowerVR consumer services."
+-	return 0;
+-}
+-
+-# Deal with the type of invocation we get.
+-#
+-case "$1" in
+-start)
+-	load_pvr
+-	;;
+-stop)
+-	if ! unload_pvr; then
+-		echo "Couldn't unload modules" >&2;
+-		exit 1
+-	fi
+-	;;
+-reload|restart)
+-	if unload_pvr; then
+-		load_pvr
+-	else
+-		echo "Couldn't unload modules" >&2;
+-		exit 1
+-	fi
+-	;;
+-*)
+-	echo "$0: unknown argument $1." >&2;
+-	;;
+-esac
+-
+diff --git a/targetfs/j784s4_linux/wayland/release/etc/init.d/rc.pvr b/targetfs/j784s4_linux/wayland/release/etc/init.d/rc.pvr
+deleted file mode 100755
+index 5770d72..0000000
+--- a/targetfs/j784s4_linux/wayland/release/etc/init.d/rc.pvr
++++ /dev/null
+@@ -1,196 +0,0 @@
+-#!/bin/bash
+-############################################################################ ###
+-#@Copyright     Copyright (c) Imagination Technologies Ltd. All Rights Reserved
+-#@License       MIT
+-# The contents of this file are subject to the MIT license as set out below.
+-#
+-# Permission is hereby granted, free of charge, to any person obtaining a copy
+-# of this software and associated documentation files (the "Software"), to deal
+-# in the Software without restriction, including without limitation the rights
+-# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+-# copies of the Software, and to permit persons to whom the Software is
+-# furnished to do so, subject to the following conditions:
+-#
+-# The above copyright notice and this permission notice shall be included in
+-# all copies or substantial portions of the Software.
+-#
+-# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+-# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+-# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+-# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+-# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+-# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+-# THE SOFTWARE.
+-#### ###########################################################################
+-
+-# Auto-generated for j784s4_linux from rogueddk_1.15@6133109
+-#
+-
+-load_pvr()
+-{
+-	load_modules_exit_status=0
+-
+-	# Load the PVR Services module.
+-	#
+-	
+-	if [ -n "$PVR_SRVKM_PARAMS" ] && ! /sbin/modprobe -q pvrsrvkm --dry-run --first-time; then
+-		echo "Cannot set parameters for pvrsrvkm. Module already loaded."
+-		some_modules_already_loaded=1
+-		readonly load_modules_exit_status=1
+-	elif ! /sbin/modprobe -q pvrsrvkm $PVR_SRVKM_PARAMS; then
+-		echo "Module pvrsrvkm failed to load. Retrying."
+-		if [ -z $depmod_has_been_run ]; then
+-			if [ -e /sbin/depmod ]; then
+-				echo "Running /sbin/depmod"
+-				/sbin/depmod && depmod_has_been_run=1
+-			fi
+-		fi
+-		if ! /sbin/modprobe -q pvrsrvkm $PVR_SRVKM_PARAMS ; then return; fi
+-	fi
+-
+-	# Reload udev rules
+-	#
+-	if [ -e /sbin/udevadm ]; then
+-		/sbin/udevadm control --reload-rules
+-	fi
+-
+-	# Load 3rd party module(s).
+-	#
+-		
+-	if [ -z "$PVR_LOAD_MODULES_ONLY" ]; then
+-		# Create the directory for the Wayland socket.
+-		#
+-		if [ -z "$XDG_RUNTIME_DIR" ]; then
+-			export XDG_RUNTIME_DIR=/tmp/wayland
+-		fi
+-		if [ ! -e $XDG_RUNTIME_DIR ]; then
+-			mkdir $XDG_RUNTIME_DIR && chmod 0700 $XDG_RUNTIME_DIR
+-		fi
+-
+-		# If PDumping, enable software rendering for Weston to ensure that
+-		# pdump doesn't capture any output from Weston itself.
+-		#
+-		if pgrep -x pdump > /dev/null 2>&1; then
+-				export GBM_ALWAYS_SOFTWARE=1
+-				export LIBGL_ALWAYS_SOFTWARE=1
+-		fi
+-
+-		# Try to work out the device node for the display controller.
+-		#
+-		for dev in /dev/dri/card*; do
+-			dev_major=$(($(stat -c '0x%t' "$dev")))
+-			dev_minor=$(($(stat -c '0x%T' "$dev")))
+-			sys_path=$(readlink -f /sys/dev/char/$dev_major\:$dev_minor)
+-
+-			while [ -e "$sys_path" -a "$sys_path" != "/sys" ]; do
+-				if [ ! -e "${sys_path}/driver" ]; then
+-					sys_path="$(dirname "$sys_path")"
+-					continue
+-				fi
+-
+-				module="$(basename "$(readlink -f "$sys_path/driver/module")")"
+-				if [ "$module" = "DISPLAY_CONTROLLER" ]; then
+-					drm_card="$(basename "$dev")"
+-				fi
+-				break
+-			done
+-
+-			if [ -n "$drm_card" ]; then
+-				break
+-			fi
+-		done
+-
+-		if [ -e "${XDG_RUNTIME_DIR}/weston.pgid" ]; then
+-			echo "Weston is already running. If this is not the case run:"
+-			echo "$ sudo rm ${XDG_RUNTIME_DIR}/weston.pgid"
+-			echo
+-		else
+-			# Get a TTY for Weston to use.
+-			#
+-			if [ -x "$(which openvt)" ] && [ -e "/sys/class/tty/tty0/active" ]; then
+-				openvt -s -l && read unused_tty < /sys/class/tty/tty0/active
+-			fi
+-
+-			# Launch Weston.
+-			#
+-			if [ -n "$drm_card" ]; then
+-				if [ -n "$unused_tty" ]; then
+-					ps -p $$ -o pgid= > "${XDG_RUNTIME_DIR}/weston.pgid"
+-					/usr/bin/weston --backend=drm-backend.so --drm-device="$drm_card" --tty="${unused_tty//[!0-9]}" --idle-time=0  &
+-				else
+-					last_tty_path="$(ls /dev/tty[1-9][0-9] | sort -V |tail -n 1)"
+-
+-					echo "To start Weston run (specifying a tty within the given range):"
+-					echo "$ sudo /usr/bin/weston --backend=drm-backend.so --drm-device=$drm_card --tty=<8..${last_tty_path//[!0-9]}> --idle-time=0 &"
+-					echo
+-				fi
+-			else
+-				echo "Couldn't start Weston automatically."
+-			fi
+-		fi
+-	fi
+-
+-	if [ -n "$some_modules_already_loaded" ]; then
+-		echo
+-		echo "Could not set parameters for some modules."
+-		echo "To fix this ensure automatic loading of those modules is disabled and restart the driver."
+-		echo "See the platform guide for more details."
+-	else
+-		echo "Loaded PowerVR consumer services."
+-	fi
+-
+-	return $load_modules_exit_status;
+-}
+-
+-unload_pvr()
+-{
+-	if [ -z "$XDG_RUNTIME_DIR" ]; then
+-		XDG_RUNTIME_DIR=/tmp/wayland
+-	fi
+-
+-	# Stop Weston.
+-	#
+-	if [ -f "${XDG_RUNTIME_DIR}/weston.pgid" ]; then
+-		read WESTON_PGID < "${XDG_RUNTIME_DIR}/weston.pgid" && [ -n "$WESTON_PGID" ] && WESTON_PID=$(pgrep -g $WESTON_PGID -x weston) && [ -n "$WESTON_PID" ] && kill $WESTON_PID && while [ -e /proc/$WESTON_PID ] ; do sleep 1; done
+-		rm "${XDG_RUNTIME_DIR}/weston.pgid"
+-	elif pgrep -x weston > /dev/null; then
+-		echo "Warning: Found one of more instances of Weston running."
+-		echo "         This may prevent the driver from being unloaded."
+-	fi
+-
+-	# Unload 3rd party module(s).
+-	#
+-		
+-	# Unload the PVR Services module.
+-	#
+-	if /sbin/modprobe -r pvrsrvkm; then :; else return 1; fi
+-
+-	echo "Unloaded PowerVR consumer services."
+-	return 0;
+-}
+-
+-# Deal with the type of invocation we get.
+-#
+-case "$1" in
+-start)
+-	load_pvr
+-	;;
+-stop)
+-	if ! unload_pvr; then
+-		echo "Couldn't unload modules" >&2;
+-		exit 1
+-	fi
+-	;;
+-reload|restart)
+-	if unload_pvr; then
+-		load_pvr
+-	else
+-		echo "Couldn't unload modules" >&2;
+-		exit 1
+-	fi
+-	;;
+-*)
+-	echo "$0: unknown argument $1." >&2;
+-	;;
+-esac
+-
+-- 
+2.34.1
+
diff --git a/package/ti-rogue-um/Config.in b/package/ti-rogue-um/Config.in
new file mode 100644
index 0000000000..15257858c2
--- /dev/null
+++ b/package/ti-rogue-um/Config.in
@@ -0,0 +1,52 @@
+comment "ti-rogue-um needs udev and a glibc toolchain w/ threads"
+	depends on BR2_aarch64
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_TI_ROGUE_UM
+	bool "ti-rogue-um"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_PACKAGE_HAS_UDEV
+	# pre-built binaries
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_aarch64
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_POWERVR
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	select BR2_PACKAGE_TI_ROGUE_KM if BR2_LINUX_KERNEL
+	help
+	  Graphics libraries for TI SoCs with Rogue GPU.
+	  This package supports AM62, J721E, J721S2, and J784S4
+	  SoCs only.
+
+	  https://git.ti.com/cgit/graphics/ti-img-rogue-umlibs
+
+if BR2_PACKAGE_TI_ROGUE_UM
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "ti-rogue-um"
+
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	default "ti-rogue-um"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "ti-rogue-um"
+
+config BR2_PACKAGE_PROVIDES_POWERVR
+	default "ti-rogue-um"
+
+config BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT
+	string "UM driver target product"
+	default "am62_linux"
+	help
+	  Select target product to be used for UM libraries. This needs to
+	  match one of the SoC-specific folders within the root/targetfs
+	  folder of the ti-img-rogue-umlibs Git repository.
+
+endif
diff --git a/package/ti-rogue-um/ti-rogue-um.hash b/package/ti-rogue-um/ti-rogue-um.hash
new file mode 100644
index 0000000000..a41bf33145
--- /dev/null
+++ b/package/ti-rogue-um/ti-rogue-um.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2e1bd1a5ab0ad2db1b9164d028a94f8f9d20743131f337a817fd1c8f9ddd4cbe  ti-rogue-um-5977e82b96028f783d39c7219f016c1faf8dc5f5-br1.tar.gz
+sha256  37507b462edf97b59717d2d144daaac85fbca6080c3602b5128e446e97f9ad47  LICENSE
diff --git a/package/ti-rogue-um/ti-rogue-um.mk b/package/ti-rogue-um/ti-rogue-um.mk
new file mode 100644
index 0000000000..fa29638fa7
--- /dev/null
+++ b/package/ti-rogue-um/ti-rogue-um.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# ti-rogue-um
+#
+################################################################################
+
+# This corresponds to SDK 08.06.00
+TI_ROGUE_UM_VERSION = 5977e82b96028f783d39c7219f016c1faf8dc5f5
+TI_ROGUE_UM_SITE = https://git.ti.com/git/graphics/ti-img-rogue-umlibs.git
+TI_ROGUE_UM_SITE_METHOD = git
+TI_ROGUE_UM_LICENSE = TI TSPA License
+TI_ROGUE_UM_LICENSE_FILES = LICENSE
+TI_ROGUE_UM_INSTALL_STAGING = YES
+TI_ROGUE_UM_PROVIDES = libegl libgbm libgles powervr
+
+# ti-rogue-um is a egl/gles provider only if libdrm is installed
+TI_ROGUE_UM_DEPENDENCIES = libdrm wayland
+
+PVR_BUILD = "release"
+PVR_WS = "wayland"
+
+define TI_ROGUE_UM_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(STAGING_DIR) \
+		TARGET_PRODUCT=$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \
+		BUILD=$(PVR_BUILD) WINDOW_SYSTEM=$(PVR_WS) \
+		install
+endef
+
+define TI_ROGUE_UM_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) \
+		TARGET_PRODUCT=$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \
+		BUILD=$(PVR_BUILD) WINDOW_SYSTEM=$(PVR_WS) \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
