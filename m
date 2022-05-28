Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE74EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5728541BE5;
	Sat, 28 May 2022 09:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jtv6Kdshoonp; Sat, 28 May 2022 09:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF4D341BB8;
	Sat, 28 May 2022 09:19:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D22B91BF5DA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1256460B56
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdQ7fjpqX2pG for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FBBF60B26
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D747F8424B; Sat, 28 May 2022 09:05:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 10:56:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: bc4ab10c4d8e8e459796d3c47a1fb96200003530
X-Git-Newrev: fe4e72251b2b2eaed6a2842b92198a9f78fe5d55
X-Patchwork-Hint: ignore
Message-Id: <20220528090537.D747F8424B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkg-meson: add
 support for new cpu families
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe4e72251b2b2eaed6a2842b92198a9f78fe5d55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Add mappings for new cpu families based on the reference table:
https://mesonbuild.com/Reference-tables.html#cpu-families

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0a91f37c482914d70336454cb4ab4fa8ffda30a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-meson.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index f1390a18d0..ff850fa79f 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -36,6 +36,8 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 PKG_MESON_TARGET_CPU_FAMILY = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 PKG_MESON_TARGET_CPU_FAMILY = aarch64
+else ifeq ($(BR2_csky),y)
+PKG_MESON_TARGET_CPU_FAMILY = csky
 else ifeq ($(BR2_i386),y)
 PKG_MESON_TARGET_CPU_FAMILY = x86
 else ifeq ($(BR2_m68k),y)
@@ -50,8 +52,12 @@ else ifeq ($(BR2_powerpc),y)
 PKG_MESON_TARGET_CPU_FAMILY = ppc
 else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 PKG_MESON_TARGET_CPU_FAMILY = ppc64
-else ifeq ($(BR2_riscv),y)
+else ifeq ($(BR2_riscv)$(BR2_RISCV_32),yy)
+PKG_MESON_TARGET_CPU_FAMILY = riscv32
+else ifeq ($(BR2_riscv)$(BR2_RISCV_64),yy)
 PKG_MESON_TARGET_CPU_FAMILY = riscv64
+else ifeq ($(BR2_s390x),y)
+PKG_MESON_TARGET_CPU_FAMILY = s390x
 else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
 PKG_MESON_TARGET_CPU_FAMILY = sh4
 else ifeq ($(BR2_sparc),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
