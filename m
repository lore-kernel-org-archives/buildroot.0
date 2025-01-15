Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEB5C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 10:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF05383FAF;
	Wed, 15 Jan 2025 10:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWrjMgcCakNP; Wed, 15 Jan 2025 10:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C0AD83FA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C0AD83FA4;
	Wed, 15 Jan 2025 10:28:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E32BB89
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 10:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B5AC60B18
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 10:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Z7LoL24cSbw for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 10:28:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B72360679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B72360679
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B72360679
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 10:28:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9MpS-1tSUHE1lTw-00xFyg; Wed, 15
 Jan 2025 11:28:48 +0100
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed, 15 Jan 2025 11:28:27 +0100
Message-ID: <20250115102827.3479245-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:XI4B/Cb9ztE66MYGCsSmbU4E8mtiipnxDoH9mpiTONBzSqQMWCo
 IgYPJvQKD4bFZiiSGywT1wk9LU/Eh3RUkwdu9Uc+HF7KJR4uuhO8O6LhFcHwWuSMxA4hU2z
 eSM7JP/N4EGOAKusu5EqplRon9h1V2fBJUgccpawar5sXCzJ+HmaWJlYTkR/nKuCu6daEY7
 GBfzXu+pCy1IzHDScapGw==
UI-OutboundReport: notjunk:1;M01:P0:rJ1URLaJhSA=;GroeZvEqH1ps18fK19wIKCd59nq
 47RPsCCkk/AhGv4klfBH04fh0AkkHFrEEBu0+HauHt6iWvTJTya2NFmBdjNiZQ4LOI5hKkh5F
 ACy2RMTM3yMdla9gNy1BvcZVH2M0jhOsjlTsdqhEGJKox9TLr0IUZ/m5e5W4q5/qhPy147pty
 jAXwt/iqMFFsWowRRv6VMIUfDsPEjd6cfLywPjCkS9dabPbSOkRqNFYv5N+U1ubcTp2n26JcE
 tFvjhNHDITwUuEmxJv6eN4wIwiYhv/zl1tdmhuZYg6GwK8X3rGwTQ5p6I7jESYD2Tguck+PiI
 pns6EWf1GTkrsl3rbJ3U9fhOfvTevRtrWJb4i7rqeV3xwR6cIM3MvnlrKZ0UfgT7e1ReR0EI7
 b468js67n7ygOT8hysQYf7hMRgfLrpN+j49Emr5wcIPRlJxegqDpJkYhmPaXACLrvXObm/OBp
 gzn1fTfFulxO3DCP9frVTUx98HBaP1EtDGj5avp6Ij+O9gxc39+32WL2MChRmiIlPi5hjaIbi
 hqZGuppr6HWbJYpYHdP9oP5J8sxKNeN0rQp8Y8L+sMRBb3CcPos9PUuzzrocNfzfv8O4BEUXP
 gIa/pAHWxAY1vKjbKeCXKOrXCMTm8Ro7z65J8eYWLoAYX6cCdhoAayReJMtRpih20eEtP8giD
 FrkC8DDID8PBSYIchmxCw3RtPnlsEMKHXCiS5mHDYm7CFvif4pOG8KAhcJvmuFgToUK4b/fRq
 mJN+W5sv53Yrk+G43rJ6xPN6ujg83UCcok8RqSvnjpuj9LP0echtqdLB0ucAB4bh1KMtmHiS3
 nrIr+HdXwJum121sQlVTpDlaOpXEkeT+FT1aK6rIqyzscWU5rkh4xJTAXYu1pKnu1Hm48k0vs
 RWGzIvIdN0y9vGF/HTedUAXYkjLCBqqkJJgs6zVupPw380fe0UELFJZqTiudaeh87fhCE114D
 TSP+usQKDOpJsx+CAoZyD0YWC1/L+f+SPUeg1c9o4MoBwxKHVvqlKXwOzErEyH8veLexvF+2U
 ClU/dgssqvMAz8sfCbkkSj/1B4VkkPFRwbqK004PYHIhGMhlfZCfHAvEIlkSMtAyAniDkPvsE
 mvJm16DWXa5y1WR9EGZ5U4EJEfD0mk
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736936928; x=1737541728; i=fiona.klute@gmx.de;
 bh=nNxIDqi9SC6zWTF5EWq+G6SbP2gvUtQSxpHPtV9NktE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rmoNfM7oSSraSkjC3UWpin3J8G517tAI8taMf/r9DOffEe2wj1SruWCfVWK+ahuL
 Zh7OLD2t2HkYyd4LcUEe7Noz9Vvzw5GSTh4zktM/SYefkOhPf/NtXGhPZtcdhx5/z
 Tu+JjfVXNqU6Yw3EUsKTTeupKbuWM7jiXaU/7q+VB92cT9C/UcDPFD7e8PeqtX1Pd
 ZWmc5/iAPUj5gzD6vwCL2jjEMBT4TjNYTf/NAWpdbeL0jgMXEz0d3mPp9N1xY5uHz
 Lx0CXagHQr2km9msbWg51nByjwkDxpSHJ7A6kOHVLRuSdJOyQypVa5+cUUFEUB1gS
 uqXBy4rjZHTkH8YK5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rmoNfM7o
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump to version
 1.50.1
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

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.50.1/NEWS?ref_type=tags

Release downloads have moved to gitlab.freedesktop.org, see [1, 2].

Drop patch included upstream.

[1] https://lists.freedesktop.org/archives/networkmanager/2024-December/000364.html
[2] https://download.gnome.org/sources/NetworkManager/IMPORTANT-NetworkManager-releases-moved.txt

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 ...isable-sd_dhcp6_client_set_duid_uuid.patch | 68 -------------------
 package/network-manager/network-manager.hash  |  4 +-
 package/network-manager/network-manager.mk    |  6 +-
 3 files changed, 5 insertions(+), 73 deletions(-)
 delete mode 100644 package/network-manager/0001-libnm-systemd-core-disable-sd_dhcp6_client_set_duid_uuid.patch

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
index 785976a0aa..015e6b212a 100644
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
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
