Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D43C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:09:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E58660D07
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E58660D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A63401FF;
	Tue,  3 Aug 2021 23:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6At6MipI2fob; Tue,  3 Aug 2021 23:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A4D340215;
	Tue,  3 Aug 2021 23:09:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AE811BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D1CE404DA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIFBwLhuvJ0P for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBF3C40643
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4C2DE86016; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Jun 2021 22:25:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 51cc28485e17127807c5e511e02e2f087d32e8c6
X-Git-Newrev: 371f2aa0edf233aa3a9eeee2e7be0920a46a0040
X-Patchwork-Hint: ignore
Message-Id: <20210803210952.4C2DE86016@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bluez5_utils: Clean up
 descriptions
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=371f2aa0edf233aa3a9eeee2e7be0920a46a0040
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The descriptions in this package have grown pretty confusing over time.
Try to make this a bit more consistent and up-to-date.

* drop references to old kernel versions not supported by BR anymore
* Remove "Bluez 5.x" string from options
* consistently use the term "plugin" (plugins implement profiles)
* make mentioned profile appreviations upper-case
* make descriptions closer to the ones in BlueZ Readme [0]
* make clear that "tests" refers to the python test scripts

[0] https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/README?h=5.58

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout:
 - remove more 5.x references;
 - Use official spelling BlueZ in main help text]
---
 package/bluez5_utils/Config.in | 51 ++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 016a16c4c5..2c8625a66d 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_BLUEZ5_UTILS
-	bool "bluez-utils 5.x"
+	bool "bluez-utils"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
@@ -9,17 +9,12 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	help
-	  bluez utils version 5.x
+	  BlueZ utils
 
-	  With this release BlueZ only supports the new Bluetooth
-	  Management kernel interface (introduced in Linux 3.4).
+	  Provides Stack, Library and Tooling for Bluetooth Classic
+	  and Bluetooth LE.
 
-	  For Low Energy support at least kernel version 3.5 is
-	  needed.
-
-	  The API is not backward compatible with BlueZ 4.
-
-	  Bluez utils will use systemd and/or udev if enabled.
+	  BlueZ utils will use systemd and/or udev if enabled.
 
 	  http://www.bluez.org
 	  http://www.kernel.org/pub/linux/bluetooth
@@ -31,7 +26,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_OBEX
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBICAL
 	help
-	  Enable the OBEX support in Bluez 5.x.
+	  Enable OBEX support.
 
 comment "OBEX support needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
@@ -40,75 +35,77 @@ config BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	bool "build CLI client"
 	select BR2_PACKAGE_READLINE
 	help
-	  Enable the Bluez 5.x command line client.
+	  Build the command line client "bluetoothctl".
 
 config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
-	bool "install deprecated tool"
+	bool "install deprecated tools"
 	depends on BR2_PACKAGE_BLUEZ5_UTILS_CLIENT
 	help
-	  Build BlueZ 5.x deprecated tools. These currently include:
+	  Build deprecated tools. These currently include:
 	  hciattach, hciconfig, hcitool, hcidump, rfcomm, sdptool,
 	  ciptool, gatttool.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
-	bool "build experimental obexd plugin"
+	bool "build experimental tools"
 	help
-	  Build BlueZ 5.x experimental Nokia OBEX PC Suite plugin
+	  Build experimental tools. This is currently only the
+	  "Nokia OBEX PC Suite tool". So, only if OBEX support is
+	  enabled this option has an effect.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
 	bool "build health plugin"
 	help
-	  Build BlueZ 5.x health plugin
+	  Build plugin for health profiles.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MESH
-	bool "build mesh profile"
+	bool "build mesh plugin"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
 	select BR2_PACKAGE_ELL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_READLINE
 	help
-	  Build BlueZ 5.x mesh plugin
+	  Build plugin for Mesh support.
 
 comment "mesh profile needs a toolchain w/ headers >= 4.12"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_MIDI
-	bool "build midi profile"
+	bool "build midi plugin"
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	help
-	  Build BlueZ 5.x midi plugin
+	  Build MIDI support via ALSA sequencer.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC
 	bool "build nfc plugin"
 	help
-	  Build BlueZ 5.x nfc plugin
+	  Build plugin for NFC pairing.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
 	bool "build sap plugin"
 	help
-	  Build BlueZ 5.x sap plugin
+	  Build plugin for SAP profile.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
 	depends on BR2_PACKAGE_HAS_UDEV
 	help
-	  Build BlueZ 5.x sixaxis plugin (support Sony Dualshock
+	  Build sixaxis plugin (support Sony Dualshock
 	  controller)
 
 comment "sixaxis plugin needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_BLUEZ5_UTILS_TEST
-	bool "build tests"
+	bool "install test scripts"
 	help
-	  Build BlueZ 5.x tests
+	  Install the python test scripts from the "test" directory.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_TOOLS_HID2HCI
 	bool "build hid2hci tool"
 	depends on BR2_PACKAGE_HAS_UDEV
 	help
-	  Build BlueZ 5.x hid2hci tool
+	  Build hid2hci tool
 
 comment "hid2hci tool needs udev /dev management"
 	depends on !BR2_PACKAGE_HAS_UDEV
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
