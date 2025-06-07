Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C27FC5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 17:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E12B60B56;
	Sat,  7 Jun 2025 17:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLFlao12hogM; Sat,  7 Jun 2025 17:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 972C460B77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 972C460B77;
	Sat,  7 Jun 2025 17:10:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEDF61A4
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E0CE81A2B
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHk45nAZkd_H for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 17:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6ECB816E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6ECB816E7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6ECB816E7
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:09:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.120.224]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQeK-1uWAVv1XyY-009voh; Sat, 07
 Jun 2025 19:09:57 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sat,  7 Jun 2025 19:09:36 +0200
Message-ID: <20250607170936.1502446-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607170936.1502446-1-fiona.klute@gmx.de>
References: <20250607170936.1502446-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8OU7u222WU3ai5iiTAkQHhnCQaZ2P9aNjQJMug84oSDjXQHoXqZ
 KE0Jc/AdiQTRTMzEwjEDzNi6gCYYV06LT1CF8AsxesFg5AB9cXYPcgdop0MIO/8vsi0f2nN
 GhDzW+MOAlU5HbxUpgQ8iPM3+/eS8f5XUoXzWtytuj+jRFrbilz0bzwLE2kt6Iqvj8jRJ/R
 SdLrgKPGNCFT//nrvHVaw==
UI-OutboundReport: notjunk:1;M01:P0:LhaiPRFKdA0=;uRBn3mgJtprRcxjgcQANTQaoFC1
 CHHK2DB1Pzdvtd7XsX0/hDvOBt9ciDT0lYqt3yVf7Ot2DwXJPL4393Cy//yGhyNXauMgy8fYN
 kr63z2BbIW3+MLIIC4B4BhfoUkS3rTgWg/IgR1HlNmW+CzLLVe577v3bzWsgSR28L3z2WlPXm
 WvpnbwV9AyQr81qZH8sTau5s8BLGen8QnKjJflYMzo1GBjHdykTd6p2W0EFynCEDNCqPt6nsh
 FBUVqFAjHsrclLWHIpnUTyhHbWsLA0HXTwwykwj5OZM6iY11aBREZJsCSTQZ5+Ih5RvyxQxLt
 rJhY+COV6KtJNPkO8QWvLYaIjL8zBA2ZlKdS8417VLw177xdZy5oUXYG9xnxtqfcd5WqshVTS
 RkbNYLy1MKUQjxPvCbaOjlHYWuaevEwtGP36BtI6KXQHjg28Yvnn8Mu5PCqBDAhr909o6fQ2G
 4nhDbNjjJrVRz9xd4xoQZ2CPm+Ht5fsZxzV3ytS2aJ2C2uBj/oUHf0/GID+45XRXJeN+yFAuV
 nkXdT1wEbnespv9mZDFGkm911upf+7C2UHrauytygITCg6j3iW7/ckEwtPC4ZsvfYSWA95+RK
 GXLNXtwBeqDe1KWE4XTdmEjwNhVLjHfpPUlcdLIWMZyAZ9wC9U/x2mTn4snbUh8uNYkyRjm+o
 uEqjLWF5NeAJtxOlLkdEsKcRBud2dGRVyIHU5T/8GklK4+ZKsQoSA715rfxJsUA8zffWKo8Q+
 vGoG8CARF7JG+k9eEeZ0lufs+izwrIVlka9c+ay/jXoqLAucZGBvi/WlC65DdY3XoedpOM5Ym
 puVcZzHG0mee7hRjH8Vkkz9iAOa75xKejq9R3icD4VMtW70e6bb4GkS9UTo0rV71SMwsemXmU
 7YfqSBCTbrqKcCiSSPQLDv+PqANcpPEE1onEuzP46Ft1Vwpl4uNeHATrsnOLcoy+991RisrSM
 IV7ODfnLD1XrtllLukF35kSkrm/KdPaHlgoC3VYFzK3rffkbtEbPAWrKpS19yGugMAnuRckaP
 zflJyVCmh2bIy235w1fcPZRqvif+D5BbQukJ5HRDcpxNkIu6Vr3jgQrMBy+4VvNDTE+TbFNpt
 Ey8AwMuiuXoaJgcF876S2sBDHF1WTexC+uu4fkwELHb7nTIXztwX+n4eQuZv6VPZFamsylsKw
 pYiqbsrMXPvdJB7sIU7UFwYsUfx1jcgMrpag1RqY3BED1MAWGFZzMJ0KAqGuchy5+FJUtEFMi
 1z+mFpbKIWru1jq/gOoRX7rJ9JHALBET9HtoYvFm/xRiUgrxRf9/zOzyZzVlmfUYE1BAYCiPt
 7FLrNFJPUvCLAWR15k4dswS8kfrpsV2FFPJ7l846rgrsfq6vwT11mnImusKQXYBtTPgNXLivV
 MKbgdeUZwRsY6yURBy3gWTwxlQIMa6NJyCqZf3GVGV9OkN110bsDnAI6LvWgyeFVmcVuGccEy
 pntYbsPIrSKmOP0TIWyrFi0koqGaZSFBERbbSfByW9f8V8M7QdXv67OneWc9NgD+SI/vDOqzt
 oSAAXDyF9LTnhbWRrP+BNNYA6cvB/lviam+uL+ujYe6O9ZyirllxY/CBdTSQ97psW8Yb3JtcM
 zNJgr5dkC1JzNAHUPtV5xsTmRhCJoUjxTtL+PkwEIwudH7iC1PAydXWXHGVKkdweXqApTCmLR
 Sr3qGB27hT3uKXkBmuGc6g+rNXkM4YDaI7rmBDlwGLCsMsbxxNs1ZKp/GlhtbB8f2jtVzilVs
 kIm47/87dPiLAgVvGpa2v1QREMdsqL8vJJ9Yan/u3cCu2Jyvx2ALhpK/qsNpRiaxSYSF0F4p6
 lNcsItx7f/fEe36t5nRXokSXbAd/L3DppuO5vl/HhP1aCGi2y0uMnVcPXY0haZm18aYCtx8Nz
 5CgGH39S6PtWZneCpCEGcfxU76VjdZNwxz2zCnHreuzEX94JpvN9rHhQv2g5t4pph4PfBBVlh
 +Xmmrr342xgRLKkU6hNsdHC4eeFRaIOUXvGUGX89kVQyB7MXFVf6h8PsTPLdKfMHF1GwC/aWH
 llc111rd/XyQXALqYEdkqg7qgA6NfgUe734UCWoMvfdXaPdoVootZCZSKgmiM17JlWkRYqf0g
 5pmsheYZPh2uvZgrcQGsCV4+O/zSDmgPVUyg7+WRa4bGpV+48GkCr00U48ejYlgppytRzSl1r
 K8X4xSo6Ea808TnIZv/4lmmWePBNd25BMHA6bY4aCwf3YChkC4BXNhy6e9umDdTXxpfnOBdML
 rMbFoJl3LWPZ61iL3q20++eSXW116L0Cki/4OVIYTCa5XVsQRqbJJivOeDsEQxex+DmkHXtov
 7gDet2LMsZ04al/1RAbkwoKlMQAmdcROQbCw7U8r7tT5Fpxndap/Qz3Fs2ZzUyY2CnKIwsqxB
 BIhdP6x2oTdk6blNSbAVmhoMqHbOYXalRQnXLHtb4vHrngdwoibRpPPZfRStSqpqU5ktIyA66
 3CmmHbZSYtHpTncXHQdDcaDp8Jp7ebPVssy2n4Iv9iRzSWnUzwI/FZxbFPf21WBwzYty4gg44
 Htf2JL7kpB7u1ihmhSlAd6WAVNbSUNeOLQp4YXCDhJIpkc1vh6bMwhguqmxxtpZhFOCqQLwHs
 bMVErLSdoXCEz1Qtg/wfcbcCmOmNOg8lLY4KqUyNtntnFTAPGf95Vl3YYZ8HwBGY8srkOcirX
 YhCTHbOSTHrjOn4e1fkmC7jxR0GYrGAzX5q7lBFA7/yOMfs9JAHDm3a79IzuThWR30OdYINsj
 qLy/kllD291NILZfwFrDe3ytFz37AdAjFfWOLnHB0B7AwOn16RJZvFUN3il5FS4bBErtxVRok
 ZmYbL5ANd8KXcQafirjWvir6G2Nkaq0SNOMJl8EQ2taTIqbEpd2CmtTgFgcr5kpBx1rM5RQxz
 I59id2Vob3Rc7/WCwwzbIrBmr61SKdQmRDlpmCLNCp0ShRzMGIf7f05ReMEz00179Tn2n43C1
 jbft+BBArPTfKk7oOY4aXpXRuTfsfSYEERw7mvCiwj3zsDZhnKtUZl032oWg5IhQjQK7O3kD0
 uz44pqlaxsifc5sw5kgkOQYDdQlLelI4ve3E0mlJO32nbk46VC5zMx8b2w3osc/6+FoTL+yx7
 cn50fX3I9vZ9epI51mrGIwV5s9dvJXjqzoX0ClqbaniBCI/maeDh2WIB+7BpVRzg3U+1mrstO
 aeHgLX3fxtLtsJn2Mc/ONIRA9AGuboYPD00eUl8XkGengj+d4YRe9wpFDresmnHaT5t4Mg0jx
 LJ9TqDKI3+O11mwl+rot7btkLlemy85Gs1SYNwSUo9cBvw2BmuC6qpNCFFjXK3V1tvfiMSrWW
 4kTercjOwRSfMHcnKAignjwcX4brQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1749316197; x=1749920997; i=fiona.klute@gmx.de;
 bh=SroAFGsaKvsRD3+XjmROeygEiOpCtHkLovOo4ONw5mo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OJNSy0q4rbnmhjTSOXF33m6MP8fyzkCzyDnIP3jyrb9+LuK5Jl9YzWfRudJngDqz
 /F6tEVNKso0Y2P+PqDXTshJ5Pl7bbzS5x/jSO9FSXTNIQ1L+zu6AuKk4N/bO5BU29
 QO4aepSZWpgNvcb4+EUN2YWChV8RJ/AlCwwU7XyM8AKGhGTs+H55ZyS8F+K1ZRhIN
 jzOj9pgK/aLgBXZKDLUDqiqhW1TfM2OguBP0OCfsN91iI34z8ZNFbHI8ONK5IxAqi
 HzLmNmB1nK+rqNucFfB5153CIAW/uiHZMuJDy3uZMuZ/yhTzFH/RJrtG1xusOfltN
 bRS5CUl43KvHO85z7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=OJNSy0q4
Subject: [Buildroot] [PATCH 3/3] package/eudev: refactor init script and
 rename it to S10udevd
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This brings the script in line with current init script standards, and
fixes all make check-package warnings. Other notable changes:

* Use start-stop-daemon to create a PID file, so we can monitor shutdown.

* Use "udevadm control --exit" to implement stop, instead of "killall".

* Do not require /etc/udev/udev.conf to exist, the default contains
  only comments and udevd works without.

* Do not parse /etc/udev/udev.conf, the udev_root configuration option
  it was used for has been removed in version 1.5.1 [1].

* Implement reload using udevadm.

[1] https://github.com/eudev-project/eudev/commit/6ada823a9a0979ea145fd70add1007c21caa45c0

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 .checkpackageignore    |  1 -
 package/eudev/S10udev  | 54 ------------------------
 package/eudev/S10udevd | 96 ++++++++++++++++++++++++++++++++++++++++++
 package/eudev/eudev.mk |  4 +-
 4 files changed, 98 insertions(+), 57 deletions(-)
 delete mode 100644 package/eudev/S10udev
 create mode 100644 package/eudev/S10udevd

diff --git a/.checkpackageignore b/.checkpackageignore
index 2ad44d854f..5df1b0d0a6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -427,7 +427,6 @@ package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch lib_p
 package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch lib_patch.Upstream
 package/espeak/0001-Fix-build-of-shared-library-on-architectures-needing.patch lib_patch.Upstream
 package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch lib_patch.Upstream
-package/eudev/S10udev Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/evemu/0001-Include-limits.h-for-PATH_MAX.patch lib_patch.Upstream
 package/evemu/0002-evemu-Update-struct-input_event.patch lib_patch.Upstream
 package/evemu/0003-src-evemu.c-fix-build-with-kernels-4.16.patch lib_patch.Upstream
diff --git a/package/eudev/S10udev b/package/eudev/S10udev
deleted file mode 100644
index 6f20fc51f5..0000000000
--- a/package/eudev/S10udev
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/sh
-#
-# udev	This is a minimal non-LSB version of a UDEV startup script.  It
-#	was derived by stripping down the udev-058 LSB version for use
-#	with buildroot on embedded hardware using Linux 2.6.34+ kernels.
-#
-#	You may need to customize this for your system's resource limits
-#	(including startup time!) and administration.  For example, if
-#	your early userspace has a custom initramfs or initrd you might
-#	need /dev much earlier; or without hotpluggable busses (like USB,
-#	PCMCIA, MMC/SD, and so on) your /dev might be static after boot.
-#
-#	This script assumes your system boots right into the eventual root
-#	filesystem, and that init runs this udev script before any programs
-#	needing more device nodes than the bare-bones set -- /dev/console,
-#	/dev/zero, /dev/null -- that's needed to boot and run this script.
-#
-
-DAEMON="udevd"
-
-SETTLE_TIMEOUT=30
-UDEVD_ARGS="-d"
-
-# shellcheck source=/dev/null
-[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
-
-# Check for config file and read it
-UDEV_CONFIG=/etc/udev/udev.conf
-test -r $UDEV_CONFIG || exit 6
-. $UDEV_CONFIG
-
-case "$1" in
-    start)
-        printf "Populating %s using udev: " "${udev_root:-/dev}"
-        [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
-        /sbin/udevd $UDEVD_ARGS || { echo "FAIL"; exit 1; }
-        udevadm trigger --type=subsystems --action=add
-        udevadm trigger --type=devices --action=add
-        udevadm settle --timeout=$SETTLE_TIMEOUT || echo "udevadm settle failed"
-        echo "done"
-        ;;
-    stop)
-        # Stop execution of events
-        udevadm control --stop-exec-queue
-        killall udevd
-        ;;
-    *)
-        echo "Usage: $0 {start|stop}"
-        exit 1
-        ;;
-esac
-
-
-exit 0
diff --git a/package/eudev/S10udevd b/package/eudev/S10udevd
new file mode 100644
index 0000000000..8bb8f6eb3a
--- /dev/null
+++ b/package/eudev/S10udevd
@@ -0,0 +1,96 @@
+#!/bin/sh
+#
+# udev	This is a minimal non-LSB version of a UDEV startup script.  It
+#	was derived by stripping down the udev-058 LSB version for use
+#	with buildroot on embedded hardware using Linux 2.6.34+ kernels.
+#
+#	You may need to customize this for your system's resource limits
+#	(including startup time!) and administration.  For example, if
+#	your early userspace has a custom initramfs or initrd you might
+#	need /dev much earlier; or without hotpluggable busses (like USB,
+#	PCMCIA, MMC/SD, and so on) your /dev might be static after boot.
+#
+#	This script assumes your system boots right into the eventual root
+#	filesystem, and that init runs this udev script before any programs
+#	needing more device nodes than the bare-bones set -- /dev/console,
+#	/dev/zero, /dev/null -- that's needed to boot and run this script.
+#
+
+DAEMON="udevd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+SETTLE_TIMEOUT=30
+UDEVD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf "Starting %s: " "$DAEMON"
+	[ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --background --make-pidfile \
+		--pidfile "$PIDFILE" --exec "/sbin/$DAEMON" \
+		-- $UDEVD_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	udevadm trigger --type=subsystems --action=add
+	udevadm trigger --type=devices --action=add
+	udevadm settle --timeout=$SETTLE_TIMEOUT || echo "udevadm settle failed"
+	return "$status"
+}
+
+stop() {
+	printf "Stopping %s: " "$DAEMON"
+	udevadm control --exit
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+reload() {
+	printf "Reloading %s config: " "$DAEMON"
+	udevadm control --reload
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start)
+		start;;
+	stop)
+		stop;;
+	restart)
+		restart;;
+	reload)
+		reload;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index e9884f52d5..1a56cfd2f0 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -52,10 +52,10 @@ EUDEV_CONF_OPTS += --disable-selinux
 endif
 
 define EUDEV_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+	$(INSTALL) -D -m 0755 package/eudev/S10udevd $(TARGET_DIR)/etc/init.d/S10udevd
 endef
 
-# Avoid installing S10udev with openrc, as the service is started by a unit
+# Avoid installing S10udevd with openrc, as the service is started by a unit
 # from the udev-gentoo-scripts package.
 define EUDEV_INSTALL_INIT_OPENRC
 	@:
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
