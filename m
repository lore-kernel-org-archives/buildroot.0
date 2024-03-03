Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB91C54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E12340306;
	Sun,  3 Mar 2024 09:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9usaqxZdP3Kp; Sun,  3 Mar 2024 09:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3EA405A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D3EA405A7;
	Sun,  3 Mar 2024 09:54:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2000C1BF57B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D823405A7
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A-jN12QC-GKf for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EA6B40306
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EA6B40306
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:54:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2668D87F1F; Sun,  3 Mar 2024 09:54:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 10:35:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 64b8cbc13cfd5f9d4863531ab768bf0afbc1f340
X-Git-Newrev: f7f03445cf320adbbc41270a806b38c911d3454a
X-Patchwork-Hint: ignore
Message-Id: <20240303095438.2668D87F1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/musl: bump to version
 1.2.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7f03445cf320adbbc41270a806b38c911d3454a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This release adds two new ports: loongarch64 and riscv32. The former
is not supported in Buildroot, but the latter is, so it gets enabled
in this commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/musl/Config.in | 2 +-
 package/musl/musl.hash | 4 ++--
 package/musl/musl.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 89f41d2ff1..7fba85bcd9 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_powerpc
 	default y if BR2_powerpc64
 	default y if BR2_powerpc64le
-	default y if BR2_RISCV_64
+	default y if BR2_riscv
 	default y if BR2_sh
 	default y if BR2_x86_64
 	depends on !BR2_POWERPC_CPU_HAS_SPE # not supported, build breaks
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 3b5fccc9e2..b105320bac 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://musl.libc.org/releases/musl-1.2.4.tar.gz.asc
-sha256  7a35eae33d5372a7c0da1188de798726f68825513b7ae3ebe97aaaa52114f039  musl-1.2.4.tar.gz
+# http://musl.libc.org/releases/musl-1.2.5.tar.gz.asc
+sha256  a9a118bbe84d8764da0ea0d28b3ab3fae8477fc7e4085d90102b8596fc7c75e4  musl-1.2.5.tar.gz
 sha256  f9bc4423732350eb0b3f7ed7e91d530298476f8fec0c6c427a1c04ade22655af  COPYRIGHT
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 08706c139f..783a103fcd 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.2.4
+MUSL_VERSION = 1.2.5
 MUSL_SITE = http://musl.libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
