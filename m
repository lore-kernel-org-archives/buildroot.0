Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75AAECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 14:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F1F4404D3;
	Mon,  9 Sep 2024 14:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21xSZSj9-A_I; Mon,  9 Sep 2024 14:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AF72402CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AF72402CE;
	Mon,  9 Sep 2024 14:57:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 571631BF863
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 14:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43A4A401C8
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 14:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJf85qpGAxnw for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 14:57:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 196A9401BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 196A9401BA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 196A9401BA
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 14:57:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.127.233]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1sp5wK19sB-006DAt; Mon, 09
 Sep 2024 16:57:43 +0200
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 16:57:15 +0200
Message-ID: <20240909145715.65981-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:jpSFBGubfrjBcc3Y1Pno/fwP+pteKQk6D48qtw/ZIMBBeJsjwKS
 4cTdJH7I+xV9e/aXzSmkUkTeHG4BhjIiZB1g/NbE81qvlZyLmiH0PWlgAveDUv11HeUJwCU
 KE9s++vlHWpAyzhmc36GfHi+6IsdVxaUUeKIkAR8aLOw/bWZ0itMduz8gZA2SCU53ikDJAn
 IkXK6MK/Qiguzb7Nzj0Ew==
UI-OutboundReport: notjunk:1;M01:P0:wGQ8uKtKAqY=;d0mBRyrx0k1R4kBpzQMrFPYSESF
 WvfptV7PQUCZE5vyMtIRB8QXD5fQmsUYyOYtvRUV4mOH2QrcDLb7ZF238cV5tLN6vIhxpYuDU
 eLclkARMCX69l3gTA/oJtM8CTCND3wMmEEYLtS3/Jm0fXkF/skT9PloiT0sDlutv4oAZr1Ok+
 m/JjoMxJm0siFAl85u6xV5OTXDFF6DNFjMrdoWycFKJnvuxYjsZaKMtkMuixq1clZICzon49H
 JX0sCGOJZNlbruU7Qauwp9k9L++pzDpuqXo7TrFlQoQv4CGJ95sDumHkwf6eV5ze8kc5qb7Eg
 znRa9JZIsXKz0XzyGopWT+psugyzw0CicPCH6dhf5Ei1b52RZNN9IxDy7HVM+LJ0TDhG8CGg+
 dpeUfK1FQ7nAAiF4eqm1azwz6nu4jgKMi6rHMTZfry7+QnaPJC/dB3cyQFqsVI2Rn3KEPiz2g
 Fp2CKMPb56C4QNxwPe4m5bUdocKNJTN/OzCe45EBCmOoWF8PZWgNIb+AaFOCD8noXIKxTHI9L
 wNnZTEn+wlZjeGF1LQem4fF0hAdpOG+wntTfItW5VfiYqhemAIVJe5jGZ1l1/XNhw0YCSWPEW
 0r6dbL4tDt+PHGv2GwXzIyLjoc9T+cBrp4FosaNyxLB9vJWQ236ZSikgjW1T+FaEZCwgjLBFb
 hUZqxUMZySVgp3eup5l8qGb1YP17gXfhh8rRpG7tzeOf0ntLTAOjGSW0U0cliShv0liu4L91J
 S90OERcFMriSDafvQYZpY8NNqXHIflBCU5NduXt8D2sIp03Y0x8qASnlba+JzIEk7NKoimlxc
 UCPIMvXZM5yo77BL0ycAQQYQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725893863; x=1726498663; i=fiona.klute@gmx.de;
 bh=qdWoyzupTCSJ1GrSEYd8u1D//N1mYjz+zMJJLySHOiY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=C9XNpSbefqTkaF0AB4DQvKg7axXvnBbctkWDix21Ino3TTLW17QJoIVchWd1AZjC
 OHBpHj8sGOO6n9UOLipmJ7upjOyIDPdIDH0c5g3WfbJNgqFURE6PgoI67nIcxCJuN
 YNStoqnAn0OGwcWNbN7a8I1aPBfdHIzdM579NQ/M59bD4TP76wd1SRWNqC6cdiTDY
 WD/dftITCPHjrv/DVJZlIfLvAWmSPHtasPBH7uqjpmmMAZhDEKfPzr6GKQAz1yPjC
 koX1QIC1+mOtjUaSys9VtlpqVjYrQJcEzh/lKPVgswRswfdyIsLTt+kh6S3OOtF6X
 ailo8JVZaXBDq9g9Eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=C9XNpSbe
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump version to
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

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
---
Supersedes the 1.48.8 patch I sent a while ago, no fundamental differences.

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

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
