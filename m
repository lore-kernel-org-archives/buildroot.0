Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E96BEDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50FBE608BB;
	Tue, 10 Sep 2024 20:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3HeA-KlkSb0; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14A8B608BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A8B608BF;
	Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6821BF95A
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A43840211
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMtmeV5zXv5E for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E1CF40210
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E1CF40210
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:46:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14DAD86F5A; Tue, 10 Sep 2024 20:46:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:44:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75b543880ceaeb8ff039b0cf3a2ba3e1d38aba37
X-Git-Newrev: 817b22f114ab3543d69341efa7c6da5008ec419b
X-Patchwork-Hint: ignore
Message-Id: <20240910204657.14DAD86F5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: bump version to
 1.48.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=817b22f114ab3543d69341efa7c6da5008ec419b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changelog:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.48.10/NEWS?ref_type=tags

Packaging changes:

NM removed UPower suspend/resume support because it has been removed
from UPower, the new fallback is consolekit.
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/05ef682bb5bf16a4de2cef4ed9eba4f9473ff19d

Add patch required to build with musl due to changes in imported
libsystemd code (merged upstream in 1.49.x dev branch):
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/118e3117fe48f18cb2175b3cbc95a6ea3ced28b2

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ore-disable-sd_dhcp6_client_set_duid_uuid.patch | 68 ++++++++++++++++++++++
 package/network-manager/network-manager.hash       |  4 +-
 package/network-manager/network-manager.mk         |  6 +-
 3 files changed, 73 insertions(+), 5 deletions(-)

diff --git a/package/network-manager/0001-libnm-systemd-core-disable-sd_dhcp6_client_set_duid_uuid.patch b/package/network-manager/0001-libnm-systemd-core-disable-sd_dhcp6_client_set_duid_uuid.patch
new file mode 100644
index 0000000000..7c5d4bde78
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
index 952b0cea93..9fe9ce4e8b 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.46/NetworkManager-1.46.0.sha256sum
-sha256  722649e25362693b334371473802a729b0ec9ee283375096905f868808e74068  NetworkManager-1.46.0.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.48/NetworkManager-1.48.8.sha256sum
+sha256  5dc188fdffcf2d23c89d34b1e6319a6b20203e12eaec24b30037b7ea8ac8c613  NetworkManager-1.48.10.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 3937982c5f..8349b6c79b 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.46
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
+NETWORK_MANAGER_VERSION_MAJOR = 1.48
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).10
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
