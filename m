Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AA4C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BE0E84FD4;
	Fri, 28 Feb 2025 16:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-sdvZWE8PtP; Fri, 28 Feb 2025 16:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75B7A84FD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B7A84FD1;
	Fri, 28 Feb 2025 16:58:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 073F868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8E4D4252C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuV9L6QBC9B7 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DD4C424CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DD4C424CF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44A1485EF6; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:00:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f06c28d1afef98e80f358c35ae65e035aa64f6ea
X-Git-Newrev: 489d1f924979f7a94008e887393702e3c3663705
X-Patchwork-Hint: ignore
Message-Id: <20250228163011.44A1485EF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/network-manager: bump
 to version 1.50.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=489d1f924979f7a94008e887393702e3c3663705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream changelog: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.50.1/NEWS?ref_type=tags

Release downloads have moved to gitlab.freedesktop.org, see [1, 2].

Drop patch included upstream.

[1] https://lists.freedesktop.org/archives/networkmanager/2024-December/000364.html
[2] https://download.gnome.org/sources/NetworkManager/IMPORTANT-NetworkManager-releases-moved.txt

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ore-disable-sd_dhcp6_client_set_duid_uuid.patch | 68 ----------------------
 package/network-manager/network-manager.hash       |  4 +-
 package/network-manager/network-manager.mk         |  6 +-
 3 files changed, 5 insertions(+), 73 deletions(-)

diff --git a/package/network-manager/0001-libnm-systemd-core-disable-sd_dhcp6_client_set_duid_uuid.patch b/package/network-manager/0001-libnm-systemd-core-disable-sd_dhcp6_client_set_duid_uuid.patch
deleted file mode 100644
index 7c5d4bde78..0000000000
--- a/package/network-manager/0001-libnm-systemd-core-disable-sd_dhcp6_client_set_duid_uuid.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 118e3117fe48f18cb2175b3cbc95a6ea3ced28b2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jun 2024 14:03:15 -0700
-Subject: [PATCH] libnm-systemd-core: Disable sd_dhcp6_client_set_duid_uuid
- function
-
-When building on musl systems ( with out systemd ), and using LLD linker
-from LLVM project we fail to link with undefined symbols.
-
-This symbol is in sd_id128.c but its disabled, so let disable the functions
-which need this function.
-
-| x86_64-yoe-linux-musl-ld.lld: error: undefined symbol: sd_id128_get_machine_app_specific
-| >>> referenced by sd-dhcp-duid.c:202 (/usr/src/debug/networkmanager/1.48.0/../NetworkManager-1.48.0/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c:202)
-| >>>               libnm-systemd-core.a.p/src_libsystemd-network_sd-dhcp-duid.c.o:(sd_dhcp_duid_set_uuid) in archive src/libnm-systemd-core/libnm-systemd-core.a
-| x86_64-yoe-linux-musl-clang: error: linker command failed with exit code 1 (use -v to see invocation)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/118e3117fe48f18cb2175b3cbc95a6ea3ced28b2
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
----
- src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c    | 2 ++
- src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
-index e664a4a7207..28abddfbc5e 100644
---- a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
-+++ b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp-duid.c
-@@ -193,6 +193,7 @@ int sd_dhcp_duid_set_en(sd_dhcp_duid *duid) {
-         return 0;
- }
-
-+#if 0  /* NM_IGNORED */
- int sd_dhcp_duid_set_uuid(sd_dhcp_duid *duid) {
-         sd_id128_t machine_id;
-         int r;
-@@ -209,6 +210,7 @@ int sd_dhcp_duid_set_uuid(sd_dhcp_duid *duid) {
-         duid->size = offsetof(struct duid, uuid.uuid) + sizeof(machine_id);
-         return 0;
- }
-+#endif /* NM_IGNORED */
-
- int dhcp_duid_to_string_internal(uint16_t type, const void *data, size_t data_size, char **ret) {
-         _cleanup_free_ char *p = NULL, *x = NULL;
-diff --git a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
-index 7c20116409e..a6b55d07e0b 100644
---- a/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
-+++ b/src/libnm-systemd-core/src/libsystemd-network/sd-dhcp6-client.c
-@@ -244,6 +244,7 @@ int sd_dhcp6_client_set_duid_en(sd_dhcp6_client *client) {
-         return 0;
- }
-
-+#if 0  /* NM_IGNORED */
- int sd_dhcp6_client_set_duid_uuid(sd_dhcp6_client *client) {
-         int r;
-
-@@ -256,6 +257,7 @@ int sd_dhcp6_client_set_duid_uuid(sd_dhcp6_client *client) {
-
-         return 0;
- }
-+#endif /* NM_IGNORED */
-
- int sd_dhcp6_client_set_duid_raw(sd_dhcp6_client *client, uint16_t duid_type, const uint8_t *duid, size_t duid_len) {
-         int r;
---
-GitLab
-
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 9fe9ce4e8b..ffa438aa01 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.48/NetworkManager-1.48.8.sha256sum
-sha256  5dc188fdffcf2d23c89d34b1e6319a6b20203e12eaec24b30037b7ea8ac8c613  NetworkManager-1.48.10.tar.xz
+# From https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/1.50.1/downloads/NetworkManager-1.50.1.tar.xz.sha256sum
+sha256  5f9b881810e83a9f7c152f9c0051ee0bf922bd23053208f642c8fcaa1bdcdd25  NetworkManager-1.50.1.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 8349b6c79b..079f9aa98f 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.48
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).10
+NETWORK_MANAGER_VERSION_MAJOR = 1.50
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).1
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
-NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
+NETWORK_MANAGER_SITE = https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/releases/$(NETWORK_MANAGER_VERSION)/downloads
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
