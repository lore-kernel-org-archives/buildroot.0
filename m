Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2647CDB46B
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 12:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 854286FAB1;
	Sat, 20 Jun 2026 12:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4xrOFf2r-pn; Sat, 20 Jun 2026 12:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11F616FA02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781957262;
	bh=VnpSutsHriTL+puJIbHKSxXNibi1ImhdExUYokXERRg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J4gmTFCSRHTVa61n3Har/OB20v6/iXQQ5JaxwMYzPhwCoFqMPcleF9H2GCqmQBaY3
	 cU1Mr0AxwnBSIsIv15dAkVp2Oz+aiVsv2dyiqSz6/Oblh/LJAN3Yt5NUPaBLka7SCj
	 jDkuRKFp7VRKhJeCZWXVzRgM/OPru8cGHhEM6w62ddYA+4D/a44p9ZJgEzzwznY3UV
	 3ZtMtvON3dYtJIVMRofvkPMypkhk9vU4/s0/+qDyzb1eI7Vh8Py+TqcF5ORqeIHQ4/
	 8ODkvMjcUpR/gVPW7XQ/fUKVWeZwFznOHPuveV2QkqvDu26p4bclJm2oc0SQt2cefo
	 LwYasJG3C9gKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11F616FA02;
	Sat, 20 Jun 2026 12:07:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B9524D
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 12:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D6CB6FA02
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 12:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-73tDDPcHNx for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 12:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37BE860BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37BE860BC7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37BE860BC7
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 12:07:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17UQ-1xKWrS3UMs-00t0vM; Sat, 20
 Jun 2026 14:07:37 +0200
Message-ID: <9ced22b5-0813-4301-bd9b-b49fb08753b9@gmx.de>
Date: Sat, 20 Jun 2026 14:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>
References: <20260615100619.1061672-1-buildroot@heine.tech>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260615100619.1061672-1-buildroot@heine.tech>
X-Provags-ID: V03:K1:bzQsjKUn4bH1/UA5O0iHNnO3JsyHRhVhNMhAR5mug4E9X5Wo7cF
 ZDQOL7pABsRgihzSjY4B5AqeFB6xNhTuVtSHAQYmWI9QtudBC1fvXInJk3iXk63u4XxSnmm
 8v9Teaoq5pqbjQVw0SS8DwSAzTeo1iI8/8gJe46Q2RMJH+z+sq5wC2xrsJ5sOUdwYcor+JQ
 PbV4YuwvSOmDH4FP0pFbw==
UI-OutboundReport: notjunk:1;M01:P0:+CfE2J4PFaU=;jL8Pay9Im3cGWGQS+D0OvP4P3T6
 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
 AZPcdW0I4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781957257; x=1782562057; i=fiona.klute@gmx.de;
 bh=/M4tVr6EOoJvsCYPNYeDOzQznWixLROmKR5zz3JOFSI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=YPUn0sjMQFS3by7QN3+TNdfOdhdRQZOqCT/59wV2Q3LQwk1yURcXqjtDUCI3FS9Q
 2cXPuReESoEXA5svmHy2qx3uYPchRRRdfSq2B3L5wz1JZMBh+YA/rRbBpyE1qYIWU
 z4tvNmwd5LvEQNH1J5x4PVt1shYWG5ja4juhN5osOzBhP/hp34sqBYxpH/X5lmSkH
 ZOvvBltKhLi484p8HRWEKxGrV7kCG8/T6veQwBiSkFHvK8WX5VzEwHKO8oqwNnI1J
 ZBb5whDW/5R8GRcknHpf4PkfKc8puWetTDKMjzfnrihomw3u4jZHg264P21B/pVCa
 qi11f+A8631rLvGq9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=YPUn0sjM
Subject: Re: [Buildroot] [PATCH] package/bluez5_utils{,
 -headers}: bump to version 5.86
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 15.06.26 um 12:06 schrieb Michael Nosthoff via buildroot:
> - plugins sap and health have been removed
> - headers moved to bluetooth subfolder
> - drop upstreamed patches
> 
> Changelog:
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog?h=5.86
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

It's a bit odd that upstream didn't mention sap & health plugin removal 
in their changelog, even if the removal commits say they assume those 
plugins aren't really used any more. But that's not an issue with this 
patch, so: Accepted into master, thank you!

> ---
>   Config.in.legacy                              |  12 ++
>   .../bluez5_utils-headers.mk                   |   4 +-
>   ...0001-gdbus-define-MAX_INPUT-for-musl.patch |  33 -----
>   ...eave-config-files-writable-for-owner.patch |  35 -----
>   ...03-input-fix-HID-compilation-w-o-HoG.patch | 140 ------------------
>   ...04-input-fix-HoG-compilation-w-o-HID.patch | 120 ---------------
>   package/bluez5_utils/Config.in                |  10 --
>   package/bluez5_utils/bluez5_utils.hash        |   2 +-
>   package/bluez5_utils/bluez5_utils.mk          |  16 +-
>   9 files changed, 16 insertions(+), 356 deletions(-)
>   delete mode 100644 package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
>   delete mode 100644 package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
>   delete mode 100644 package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
>   delete mode 100644 package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index ee2e34822b..b8a95fd812 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,18 @@ endif
>   
>   comment "Legacy options removed in 2026.08"
>   
> +config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
> +	bool "bluez sap plugin removed"
> +	select BR2_LEGACY
> +	help
> +	  Build plugin for SAP profile.
> +
> +config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
> +	bool "bluez health plugin removed"
> +	select BR2_LEGACY
> +	help
> +	  Build plugin for health profiles.
> +
>   config BR2_GCC_VERSION_13_X
>   	bool "gcc 13.x support removed"
>   	select BR2_LEGACY
> diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
> index 7acf62b226..71027b45ba 100644
> --- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
> +++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # Keep the version and patches in sync with bluez5_utils
> -BLUEZ5_UTILS_HEADERS_VERSION = 5.79
> +BLUEZ5_UTILS_HEADERS_VERSION = 5.86
>   BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>   BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>   BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
> @@ -19,7 +19,7 @@ BLUEZ5_UTILS_HEADERS_INSTALL_TARGET = NO
>   
>   define BLUEZ5_UTILS_HEADERS_INSTALL_STAGING_CMDS
>   	$(INSTALL) -d $(STAGING_DIR)/usr/include/bluetooth/
> -	$(INSTALL) -m 644 $(@D)/lib/*.h $(STAGING_DIR)/usr/include/bluetooth/
> +	$(INSTALL) -m 644 $(@D)/lib/bluetooth/*.h $(STAGING_DIR)/usr/include/bluetooth/
>   endef
>   
>   $(eval $(generic-package))
> diff --git a/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch b/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
> deleted file mode 100644
> index dc823e9277..0000000000
> --- a/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 9d69dba21f1e46b34cdd8ae27fec11d0803907ee Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
> -Date: Sat, 2 Nov 2024 16:10:18 +0000
> -Subject: [PATCH] gdbus: define MAX_INPUT for musl
> -
> -This is the same solution as was done in src/shared/util.c
> -
> -Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9d69dba21f1e46b34cdd8ae27fec11d0803907ee
> -Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ----
> - gdbus/object.c | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/gdbus/object.c b/gdbus/object.c
> -index 84f116bf1..7b0476f1a 100644
> ---- a/gdbus/object.c
> -+++ b/gdbus/object.c
> -@@ -20,6 +20,12 @@
> - #include <dbus/dbus.h>
> -
> - #include "gdbus.h"
> -+
> -+/* define MAX_INPUT for musl */
> -+#ifndef MAX_INPUT
> -+#define MAX_INPUT _POSIX_MAX_INPUT
> -+#endif
> -+
> - #include "src/shared/util.h"
> -
> - #define info(fmt...)
> ---
> -2.45.2
> -
> diff --git a/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch b/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
> deleted file mode 100644
> index 09ebe5edf1..0000000000
> --- a/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From b1fd409960001a77cda2a09ecc00147ebd9c3667 Mon Sep 17 00:00:00 2001
> -From: Fiona Klute <fiona.klute@gmx.de>
> -Date: Mon, 9 Dec 2024 16:40:43 +0100
> -Subject: [PATCH BlueZ] build: Leave config files writable for owner
> -
> -This is needed for builds running as non-root users, so the build
> -process and any distribution tools can create/move/delete files in the
> -config directory without adjusting permissions separately. Limiting
> -writes from the running service needs to be done in the systemd unit
> -(already the case) or init script.
> -
> -See also: https://lore.kernel.org/linux-bluetooth/4d1206df-598b-4a68-8655-74981b62ecca@gmx.de/T/
> -Reviewed-by: Bastien Nocera <hadess@hadess.net>
> -Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b1fd409960001a77cda2a09ecc00147ebd9c3667
> -Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ----
> - Makefile.am | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 297d0774c..29018a91c 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -32,7 +32,7 @@ confdir = $(sysconfdir)/bluetooth
> - statedir = $(localstatedir)/lib/bluetooth
> -
> - bluetoothd-fix-permissions:
> --	install -dm555 $(DESTDIR)$(confdir)
> -+	install -dm755 $(DESTDIR)$(confdir)
> - 	install -dm700 $(DESTDIR)$(statedir)
> -
> - if DATAFILES
> ---
> -2.45.2
> -
> diff --git a/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch b/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
> deleted file mode 100644
> index 941e9fb68f..0000000000
> --- a/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
> +++ /dev/null
> @@ -1,140 +0,0 @@
> -From b111b5e15eb74e08b74cb3c7e91bcb21f54be4c7 Mon Sep 17 00:00:00 2001
> -From: Thomas Perale <thomas.perale@mind.be>
> -Date: Thu, 1 May 2025 18:35:35 +0200
> -Subject: input: fix HID compilation w/o HoG
> -
> -Commit [1] introduced a dependency with the HID plugin in the HoG code
> -As a result, building with --enable-hid --disable-hog caused linker
> -errors due to undefined references to HoG-related functions:
> -
> -```
> -> ./configure --enable-hid --disable-hog
> -...
> -> make
> -...
> -  CCLD     src/bluetoothd
> -/usr/bin/ld: profiles/input/bluetoothd-manager.o: in function `input_init':
> -/home/../bluez/profiles/input/manager.c:122:(.text.input_init+0x1c8): undefined reference to `input_set_auto_sec'
> -collect2: error: ld returned 1 exit status
> -make[1]: *** [Makefile:6376: src/bluetoothd] Error 1
> -```
> -
> -This patch moves the reading of the HOG specific configuration of the
> -'input.conf' file: LEAutoSecurity, to the HoG plugin file.
> -
> -[1] f2778f587 input: Add LEAutoSecurity setting to input.conf
> -
> -Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b111b5e15eb74e08b74cb3c7e91bcb21f54be4c7
> -Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ----
> - profiles/input/device.h  |  1 -
> - profiles/input/hog.c     | 40 +++++++++++++++++++++++++++++++++++-----
> - profiles/input/manager.c | 11 +----------
> - 3 files changed, 36 insertions(+), 16 deletions(-)
> -
> -diff --git a/profiles/input/device.h b/profiles/input/device.h
> -index 7b87ce5903..036a88980e 100644
> ---- a/profiles/input/device.h
> -+++ b/profiles/input/device.h
> -@@ -25,7 +25,6 @@ void input_set_userspace_hid(char *state);
> - uint8_t input_get_userspace_hid(void);
> - void input_set_classic_bonded_only(bool state);
> - bool input_get_classic_bonded_only(void);
> --void input_set_auto_sec(bool state);
> -
> - int input_device_register(struct btd_service *service);
> - void input_device_unregister(struct btd_service *service);
> -diff --git a/profiles/input/hog.c b/profiles/input/hog.c
> -index 017e320f07..f82648fec8 100644
> ---- a/profiles/input/hog.c
> -+++ b/profiles/input/hog.c
> -@@ -57,11 +57,6 @@ static gboolean suspend_supported = FALSE;
> - static bool auto_sec = true;
> - static struct queue *devices = NULL;
> -
> --void input_set_auto_sec(bool state)
> --{
> --	auto_sec = state;
> --}
> --
> - static void hog_device_accept(struct hog_device *dev, struct gatt_db *db)
> - {
> - 	char name[248];
> -@@ -228,10 +223,45 @@ static struct btd_profile hog_profile = {
> - 	.auto_connect	= true,
> - };
> -
> -+static void hog_read_config(void)
> -+{
> -+	const char filename[] = CONFIGDIR "/input.conf";
> -+	GKeyFile *config;
> -+	GError *err = NULL;
> -+	bool config_auto_sec;
> -+
> -+	config = g_key_file_new();
> -+	if (!config) {
> -+		error("Failed to allocate memory for config");
> -+		return;
> -+	}
> -+
> -+	if (!g_key_file_load_from_file(config, filename, 0, &err)) {
> -+		if (!g_error_matches(err, G_FILE_ERROR, G_FILE_ERROR_NOENT))
> -+			error("Parsing %s failed: %s", filename, err->message);
> -+		g_error_free(err);
> -+		g_key_file_free(config);
> -+		return;
> -+	}
> -+
> -+	config_auto_sec = g_key_file_get_boolean(config, "General",
> -+					"LEAutoSecurity", &err);
> -+	if (!err) {
> -+		DBG("input.conf: LEAutoSecurity=%s",
> -+				config_auto_sec ? "true" : "false");
> -+		auto_sec = config_auto_sec;
> -+	} else
> -+		g_clear_error(&err);
> -+
> -+	g_key_file_free(config);
> -+}
> -+
> - static int hog_init(void)
> - {
> - 	int err;
> -
> -+	hog_read_config();
> -+
> - 	err = suspend_init(suspend_callback, resume_callback);
> - 	if (err < 0)
> - 		error("Loading suspend plugin failed: %s (%d)", strerror(-err),
> -diff --git a/profiles/input/manager.c b/profiles/input/manager.c
> -index 95ca0a7ee5..1c0b6122a1 100644
> ---- a/profiles/input/manager.c
> -+++ b/profiles/input/manager.c
> -@@ -85,7 +85,7 @@ static int input_init(void)
> - 	config = load_config_file(CONFIGDIR "/input.conf");
> - 	if (config) {
> - 		int idle_timeout;
> --		gboolean classic_bonded_only, auto_sec;
> -+		gboolean classic_bonded_only;
> - 		char *uhid_enabled;
> -
> - 		idle_timeout = g_key_file_get_integer(config, "General",
> -@@ -115,15 +115,6 @@ static int input_init(void)
> - 		} else
> - 			g_clear_error(&err);
> -
> --		auto_sec = g_key_file_get_boolean(config, "General",
> --						"LEAutoSecurity", &err);
> --		if (!err) {
> --			DBG("input.conf: LEAutoSecurity=%s",
> --					auto_sec ? "true" : "false");
> --			input_set_auto_sec(auto_sec);
> --		} else
> --			g_clear_error(&err);
> --
> - 	}
> -
> - 	btd_profile_register(&input_profile);
> ---
> -cgit 1.2.3-korg
> -
> diff --git a/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch b/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch
> deleted file mode 100644
> index b2824e5e18..0000000000
> --- a/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch
> +++ /dev/null
> @@ -1,120 +0,0 @@
> -From 9c52188d753002a6afd6ae145f921a2ff52c1c81 Mon Sep 17 00:00:00 2001
> -From: Thomas Perale <thomas.perale@mind.be>
> -Date: Thu, 1 May 2025 18:35:36 +0200
> -Subject: input: fix HoG compilation w/o HID
> -
> -Commit [1] introduced a dependency with the HID plugin in the HoG code
> -As a result, building with --disable-hid --enable-hog caused linker
> -errors due to undefined references to HID-related functions:
> -
> -```
> -> ./configure --disable-hid --enable-hog
> -> make
> -/usr/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_accept':
> -/home/../bluez/profiles/input/hog.c:184:(.text.hog_accept+0xbb): undefined reference to `input_get_auto_sec'
> -/usr/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_disconnect':
> -/home/../bluez/profiles/input/hog.c:205:(.text.hog_disconnect+0x12): undefined reference to `input_get_userspace_hid'
> -collect2: error: ld returned 1 exit status
> -make[1]: *** [Makefile:6344: src/bluetoothd] Error 1
> -make: *** [Makefile:4695: all] Error 2
> -```
> -
> -This patch duplicate the read of the 'UserspaceHID=persist' config entry
> -in the HoG plugin file to remove the dependency on the HID plugin files.
> -
> -[1] 1782bfd79 input: Add support for UserspaceHID=persist
> -
> -Fixes: https://github.com/bluez/bluez/issues/1228
> -
> -Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9c52188d753002a6afd6ae145f921a2ff52c1c81
> -Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ----
> - profiles/input/device.c |  5 -----
> - profiles/input/device.h |  1 -
> - profiles/input/hog.c    | 14 ++++++++++++--
> - 3 files changed, 12 insertions(+), 8 deletions(-)
> -
> -diff --git a/profiles/input/device.c b/profiles/input/device.c
> -index a7bc4d44fa..3642cc3267 100644
> ---- a/profiles/input/device.c
> -+++ b/profiles/input/device.c
> -@@ -112,11 +112,6 @@ void input_set_userspace_hid(char *state)
> - 		error("Unknown value '%s'", state);
> - }
> -
> --uint8_t input_get_userspace_hid(void)
> --{
> --	return uhid_state;
> --}
> --
> - void input_set_classic_bonded_only(bool state)
> - {
> - 	classic_bonded_only = state;
> -diff --git a/profiles/input/device.h b/profiles/input/device.h
> -index 036a88980e..9056695026 100644
> ---- a/profiles/input/device.h
> -+++ b/profiles/input/device.h
> -@@ -22,7 +22,6 @@ struct input_conn;
> -
> - void input_set_idle_timeout(int timeout);
> - void input_set_userspace_hid(char *state);
> --uint8_t input_get_userspace_hid(void);
> - void input_set_classic_bonded_only(bool state);
> - bool input_get_classic_bonded_only(void);
> -
> -diff --git a/profiles/input/hog.c b/profiles/input/hog.c
> -index f82648fec8..a3c876cf9f 100644
> ---- a/profiles/input/hog.c
> -+++ b/profiles/input/hog.c
> -@@ -40,7 +40,6 @@
> - #include "src/shared/gatt-client.h"
> - #include "src/plugin.h"
> -
> --#include "device.h"
> - #include "suspend.h"
> - #include "attrib/att.h"
> - #include "attrib/gattrib.h"
> -@@ -55,6 +54,7 @@ struct hog_device {
> -
> - static gboolean suspend_supported = FALSE;
> - static bool auto_sec = true;
> -+static bool uhid_state_persist = false;
> - static struct queue *devices = NULL;
> -
> - static void hog_device_accept(struct hog_device *dev, struct gatt_db *db)
> -@@ -203,7 +203,7 @@ static int hog_disconnect(struct btd_service *service)
> - {
> - 	struct hog_device *dev = btd_service_get_user_data(service);
> -
> --	if (input_get_userspace_hid() == UHID_PERSIST)
> -+	if (uhid_state_persist)
> - 		bt_hog_detach(dev->hog, false);
> - 	else
> - 		bt_hog_detach(dev->hog, true);
> -@@ -229,6 +229,7 @@ static void hog_read_config(void)
> - 	GKeyFile *config;
> - 	GError *err = NULL;
> - 	bool config_auto_sec;
> -+	char *uhid_enabled;
> -
> - 	config = g_key_file_new();
> - 	if (!config) {
> -@@ -253,6 +254,15 @@ static void hog_read_config(void)
> - 	} else
> - 		g_clear_error(&err);
> -
> -+	uhid_enabled = g_key_file_get_string(config, "General",
> -+					"UserspaceHID", &err);
> -+	if (!err) {
> -+		DBG("input.conf: UserspaceHID=%s", uhid_enabled);
> -+		uhid_state_persist = strcasecmp(uhid_enabled, "persist") == 0;
> -+		free(uhid_enabled);
> -+	} else
> -+		g_clear_error(&err);
> -+
> - 	g_key_file_free(config);
> - }
> -
> ---
> -cgit 1.2.3-korg
> -
> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> index 2fe25466b4..58c6213364 100644
> --- a/package/bluez5_utils/Config.in
> +++ b/package/bluez5_utils/Config.in
> @@ -72,11 +72,6 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
>   	help
>   	  Build plugins for audio profiles (for A2DP and AVRCP).
>   
> -config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH
> -	bool "build health plugin"
> -	help
> -	  Build plugin for health profiles.
> -
>   config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
>   	bool "build hid plugin"
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
> @@ -126,11 +121,6 @@ config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_NFC
>   	help
>   	  Build plugin for NFC pairing.
>   
> -config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP
> -	bool "build sap plugin"
> -	help
> -	  Build plugin for SAP profile.
> -
>   config BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS
>   	bool "build sixaxis plugin"
>   	depends on BR2_PACKAGE_HAS_UDEV
> diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
> index 9b39b19c08..fdfb7edb3a 100644
> --- a/package/bluez5_utils/bluez5_utils.hash
> +++ b/package/bluez5_utils/bluez5_utils.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
> -sha256  4164a5303a9f71c70f48c03ff60be34231b568d93a9ad5e79928d34e6aa0ea8a  bluez-5.79.tar.xz
> +sha256  99f144540c6070591e4c53bcb977eb42664c62b7b36cb35a29cf72ded339621d  bluez-5.86.tar.xz
>   # Locally computed
>   sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
>   sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index e3b47e1e80..38fe9a523f 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # Keep the version and patches in sync with bluez5_utils-headers
> -BLUEZ5_UTILS_VERSION = 5.79
> +BLUEZ5_UTILS_VERSION = 5.86
>   BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>   BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>   BLUEZ5_UTILS_INSTALL_STAGING = YES
> @@ -86,13 +86,6 @@ BLUEZ5_UTILS_CONF_OPTS += \
>   	--disable-vcp
>   endif
>   
> -# enable health plugin
> -ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HEALTH),y)
> -BLUEZ5_UTILS_CONF_OPTS += --enable-health
> -else
> -BLUEZ5_UTILS_CONF_OPTS += --disable-health
> -endif
> -
>   # enable hid plugin
>   ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID),y)
>   BLUEZ5_UTILS_CONF_OPTS += --enable-hid
> @@ -137,13 +130,6 @@ else
>   BLUEZ5_UTILS_CONF_OPTS += --disable-nfc
>   endif
>   
> -# enable sap plugin
> -ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SAP),y)
> -BLUEZ5_UTILS_CONF_OPTS += --enable-sap
> -else
> -BLUEZ5_UTILS_CONF_OPTS += --disable-sap
> -endif
> -
>   # enable sixaxis plugin
>   ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_SIXAXIS),y)
>   BLUEZ5_UTILS_CONF_OPTS += --enable-sixaxis

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
