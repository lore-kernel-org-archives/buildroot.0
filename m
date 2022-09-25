Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD856C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 12:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5257D404C4;
	Sun, 25 Sep 2022 12:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5257D404C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PdXY8FkhPSgx; Sun, 25 Sep 2022 12:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CAC6404B0;
	Sun, 25 Sep 2022 12:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CAC6404B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00E411BF5A1
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D11D68248F
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11D68248F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5a0-OXtqt26 for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 12:40:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1248681DCA
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 12:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1248681DCA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F186885FE0; Sun, 25 Sep 2022 12:40:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 14:26:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6211c9e38112c611b61f00787fd790a8612328a1
X-Git-Newrev: e461c9adc82a889deb6e259ce811193cb8d00f36
X-Patchwork-Hint: ignore
Message-Id: <20220925124008.F186885FE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc64*: bump to binutils-2.38
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6712513377632945787=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6712513377632945787==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e461c9adc82a889deb6e259ce811193cb8d00f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1e2fe860f3a2 (configs/qemu_ppc64*: downgrade binutils to 2.36.1).
Since then, we've dropped support for binutios 2.36, and hte default is
2.38.x, which has the required changes to fix:
    https://github.com/linuxppc/issues/issues/388

Pin the qemu-ppc64 defconfig to explicitly use binutils 2.38.x

Signed-off-by: Cédric Le Goater <clg@kaod.org>
[yann.morin.1998@free.fr:
  - explictily force binutils 2.38
  - reword commit log to explain why
  - reword commit log: it's not really a revert
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/qemu_ppc64_e5500_defconfig      | 2 +-
 configs/qemu_ppc64_pseries_defconfig    | 2 +-
 configs/qemu_ppc64le_powernv8_defconfig | 2 +-
 configs/qemu_ppc64le_pseries_defconfig  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index 8458f2739a..6ad03c4c87 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -3,7 +3,7 @@ BR2_powerpc64=y
 BR2_powerpc_e5500=y
 
 # System
-BR2_BINUTILS_VERSION_2_36_X=y
+BR2_BINUTILS_VERSION_2_38_X=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 480ebea29d..50844dc93b 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -3,7 +3,7 @@ BR2_powerpc64=y
 BR2_powerpc_power7=y
 
 # System
-BR2_BINUTILS_VERSION_2_36_X=y
+BR2_BINUTILS_VERSION_2_38_X=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 
diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
index 8de4cf5189..f6a5c3d409 100644
--- a/configs/qemu_ppc64le_powernv8_defconfig
+++ b/configs/qemu_ppc64le_powernv8_defconfig
@@ -3,7 +3,7 @@ BR2_powerpc64le=y
 BR2_powerpc_power8=y
 
 # System
-BR2_BINUTILS_VERSION_2_36_X=y
+BR2_BINUTILS_VERSION_2_38_X=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_SYSTEM_DHCP="eth0"
 
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 98c6afdf93..7ce5a9d310 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -3,7 +3,7 @@ BR2_powerpc64le=y
 BR2_powerpc_power8=y
 
 # System
-BR2_BINUTILS_VERSION_2_36_X=y
+BR2_BINUTILS_VERSION_2_38_X=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_SYSTEM_DHCP="eth0"
 

--===============6712513377632945787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6712513377632945787==--
