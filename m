Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A902EC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 18:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32F81605A9;
	Fri, 23 Aug 2024 18:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vV4WCFcKSaqs; Fri, 23 Aug 2024 18:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13E286063F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13E286063F;
	Fri, 23 Aug 2024 18:33:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3688E1BF2E4
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 18:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 314F26063F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 18:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GN_LhDRPM_CU for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 18:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E02B605A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E02B605A9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E02B605A9
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 18:33:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.118.8]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKUv-1sPcyV1O87-00O5Am; Fri, 23
 Aug 2024 20:33:28 +0200
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 20:33:11 +0200
Message-ID: <20240823183312.2127240-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ib/N5eSgg0pavmRmhxL3X3EduIVK5QH7+d7rkOjBF+glThjjc02
 hGXx68wdKdK5fVnAtPxozrgOciZIbF4pE+T57+mzSe4fQgeXwlebFXAHsC+930x9mu511pV
 CWXZqMv/nsH7XnvIcP1sBodHRkNFA+Px30u6r2/YRjP/OIi53RBjwfMzoQo57c1RpxMxYNF
 4iuS71E9d0SVV72PCwJQg==
UI-OutboundReport: notjunk:1;M01:P0:DlzVBlIOBIE=;1EjO/74aInRYMA/aCRvrOUlM7vM
 A1SJVZ8knTJrfyw/gfcw8vVDEi5wW4f8+v598CzCGm4uJWVfvdM8d50imiSt+7q6+jc/PSbm0
 Vga+ZMOcsO6aKBFZLp2x/usUkBvAvRjmsEdzF2ooOjUSk7IM5JwLPOiRSebVStz2STWtZulvI
 1eTiA3Cp7ShDKseXyROeQ6ladPfY8dvtbEf0tA6VxTebZ9sYaZNQpw1TqWBAa3uJNM3YBLwM3
 P7QgKW8MTlm9rC93fYf/USOqrLkk3ZN1ZTQb88h1157r+/Tt8TYerJXa7sj1hUPeTJ3fCFfUn
 1lgQGbpCPPZwhGQk3j+4IhpeopDaMK+UhjT52iH+kWWK8n2MFg2Jva+qNv6YGMYAgTPxq9pV9
 QbmS+Bz81n2tzuDfzaYseEwj9/hxGf5BwlXTO9VX82mGX8CY+Vg31RoKVUQc6Sa0KKKpPSHs5
 HIkd21uheJgXOt8seqgtvWzkOynl6hak/tzl8zX8Sjnd6aNY898MEUDyRyvMM2ZnGpzGYsAJS
 E4iqTRn9xkYcx1HXxFVBL8AxbTCeCUMKelTe3DRySphUFYOGHGtGO1lt+67pLJaP69lrQ9gd+
 KF4rIN2VfK5i1m+5cH00+KMSMPQEED4XumXL6zhZXm4kQ4XhxoWUOAIuziwE2cwAqHuRyzSx7
 pUok4Fk7mLV3AGg8ioXMP+p/lHuoXxtWmLDOlsjJNweg+lsSPU3jU7H98FbKCuISDvuLeIXMp
 EiHDhm6oq6wNUR3IQHkp8nDd0zvGVCxrbTj/N2fsmKZ3xfysBMo/za1HpQtCaNUIvE6/GpHo7
 IRwXFdpPzfqFBM9xkIkFYEqw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1724438008; x=1725042808; i=fiona.klute@gmx.de;
 bh=3XaigiS4cRTo9gHRCCWdJh/r7CtLHeOWBwjxtzP8WP8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=gAiLvVh2D5QMSSOH7sFJPy7xBuBVGx0qup/V82Lqn8CVCZGc7L/ebypQBy+iJM0d
 oz0oG9DJwPDCu2d1IMnCG0u+LjGG9Fx7jSo4TG9uh8u1Ut6Rw/jlhQXrHUntZjcAt
 dlms9QtuWh2B79yXl/dXt5u74OlGaSvcyJjQ10a0o2MCLS+TkOMAmMKZ9BmsT6+Pa
 vhsh4Cx4BEmVv1FUrf1ERAvidaE3KoUFNkjrbWHuG42l9YnA4uYJdNShTeBzOMYoi
 ccfCVioKwTODBDE5gNCew0HHYv6Tkgfa59pCM+utCvTC+upj3LfOkK+xEhMY5IxTL
 dhlTz6qcVDrY0EGF2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=gAiLvVh2
Subject: [Buildroot] [PATCH next 1/1] package/network-manager: bump version
 to 1.48.8
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.48.8/NEWS?ref_type=tags

Packaging changes:

NM removed UPower suspend/resume support because it has been removed
from UPower, the new fallback is consolekit.
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/05ef682bb5bf16a4de2cef4ed9eba4f9473ff19d

Add patch required to build with musl due to changes in imported
libsystemd code (already merged upstream):
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/118e3117fe48f18cb2175b3cbc95a6ea3ced28b2

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
This update can be applied independently of the
libglib2/gobject-introspection series I sent earlier.

 ...isable-sd_dhcp6_client_set_duid_uuid.patch | 68 +++++++++++++++++++
 package/network-manager/network-manager.hash  |  4 +-
 package/network-manager/network-manager.mk    |  6 +-
 3 files changed, 73 insertions(+), 5 deletions(-)
 create mode 100644 package/network-manager/0001-libnm-systemd-core-disable-sd_dhcp6_client_set_duid_uuid.patch

diff --git a/package/network-manager/0001-libnm-systemd-core-disable-sd_dhcp6_client_set_duid_uuid.patch b/package/network-manager/0001-libnm-systemd-core-disable-sd_dhcp6_client_set_duid_uuid.patch
new file mode 100644
index 0000000000..7b41382509
--- /dev/null
+++ b/package/network-manager/0001-libnm-systemd-core-disable-sd_dhcp6_client_set_duid_uuid.patch
@@ -0,0 +1,68 @@
+From 118e3117fe48f18cb2175b3cbc95a6ea3ced28b2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jun 2024 14:03:15 -0700
+Subject: [PATCH] libnm-systemd-core: Disable sd_dhcp6_client_set_duid_uuid
+ function
+
+When building on musl systems ( with out systemd ), and using LLD linker
+from LLVM project we fail to link with undefined symbols.
+
+This symbol is in sd_id128.c but its disabled, so let disable the functions
+which need this function.
+
+| x86_64-yoe-linux-musl-ld.lld: error: undefined symbol: sd_id128_get_machine_app_specific
+| >>> referenced by sd-dhcp-duid.c:202 (/usr/src/debug/networkmanager/1.48.0/../NetworkManager-1.48.0/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c:202)
+| >>>               libnm-systemd-core.a.p/src_libsystemd-network_sd-dhcp-duid.c.o:(sd_dhcp_duid_set_uuid) in archive src/libnm-systemd-core/libnm-systemd-core.a
+| x86_64-yoe-linux-musl-clang: error: linker command failed with exit code 1 (use -v to see invocation)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/118e3117fe48f18cb2175b3cbc95a6ea3ced28b2
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c    | 2 ++
+ src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
+index e664a4a7207..28abddfbc5e 100644
+--- a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
++++ b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
+@@ -193,6 +193,7 @@ int sd_dhcp_duid_set_en(sd_dhcp_duid *duid) {
+         return 0;
+ }
+
++#if 0  /* NM_IGNORED */
+ int sd_dhcp_duid_set_uuid(sd_dhcp_duid *duid) {
+         sd_id128_t machine_id;
+         int r;
+@@ -209,6 +210,7 @@ int sd_dhcp_duid_set_uuid(sd_dhcp_duid *duid) {
+         duid->size = offsetof(struct duid, uuid.uuid) + sizeof(machine_id);
+         return 0;
+ }
++#endif /* NM_IGNORED */
+
+ int dhcp_duid_to_string_internal(uint16_t type, const void *data, size_t data_size, char **ret) {
+         _cleanup_free_ char *p = NULL, *x = NULL;
+diff --git a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
+index 7c20116409e..a6b55d07e0b 100644
+--- a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
++++ b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
+@@ -244,6 +244,7 @@ int sd_dhcp6_client_set_duid_en(sd_dhcp6_client *client) {
+         return 0;
+ }
+
++#if 0  /* NM_IGNORED */
+ int sd_dhcp6_client_set_duid_uuid(sd_dhcp6_client *client) {
+         int r;
+
+@@ -256,6 +257,7 @@ int sd_dhcp6_client_set_duid_uuid(sd_dhcp6_client *client) {
+
+         return 0;
+ }
++#endif /* NM_IGNORED */
+
+ int sd_dhcp6_client_set_duid_raw(sd_dhcp6_client *client, uint16_t duid_type, const uint8_t *duid, size_t duid_len) {
+         int r;
+--
+GitLab
+
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 952b0cea93..61bebf88f2 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.46/NetworkManager-1.46.0.sha256sum
-sha256  722649e25362693b334371473802a729b0ec9ee283375096905f868808e74068  NetworkManager-1.46.0.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.48/NetworkManager-1.48.8.sha256sum
+sha256  6200eac8f1d3fe6a3ea1f2c4158b3c95b3b9f91e74cd704e97b0b051b5a54878  NetworkManager-1.48.8.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 3937982c5f..a7c8d6e3c4 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################

-NETWORK_MANAGER_VERSION_MAJOR = 1.46
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION_MAJOR = 1.48
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
@@ -144,7 +144,7 @@ NETWORK_MANAGER_CONF_OPTS += \
 	-Dsystemd_journal=false \
 	-Dconfig_logging_backend_default=syslog \
 	-Dsession_tracking=no \
-	-Dsuspend_resume=upower \
+	-Dsuspend_resume=consolekit \
 	-Dsystemdsystemunitdir=no
 endif

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
