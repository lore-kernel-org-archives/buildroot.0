Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0294FCD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7C7960A8E;
	Fri,  5 Jun 2026 12:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HVcidLj2gnL; Fri,  5 Jun 2026 12:37:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C48DE60A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663066;
	bh=/krXjAJPZA8iQvNK62SUypo+s+UYxJfSSw45WzrtbsE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q2Jy8PnoBElTvgdLztvzdjjTVsM0E+Yi3Xp/j+lllPuaiEYcG1CFoLrv8ck+UWnNL
	 YhdJzeR3DqqRsowRg9TFu/o/mn4svHetIhHfyZPL7NcK/xFnIcMHAo9DCEF/r7YZfK
	 Hqyi79IROrJlNoo0/egmOrJAOCYr3Q+d2s4qIEEKyrz9mHBkLk8y95xMAli7L/dBMt
	 1VUMnQbFAn6vP+XU6ZIsvhMyUrQ4EKAmnH+QIBzyY3ntcniQMkFGQNCxErIf79pdsG
	 eHf2pR5GoDK+QIXzQZ0JdpSjEwLsYEiMecbyE+Aeq2ksX26nPrHC2JKO2hVct62gW7
	 q2AX/ddQYI61g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C48DE60A97;
	Fri,  5 Jun 2026 12:37:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06486F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7CD281E6C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9FY84X9dt8R for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58A0481B7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58A0481B7B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 828FB87B42; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:30:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bc86c8c52af5f502d41899aecdd301b7b45044a9
X-Git-Newrev: b3a27e6850762d831a0ccdf123a0acfecc4807c1
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.828FB87B42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libde265: disable
 neon support for armv7m
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b3a27e6850762d831a0ccdf123a0acfecc4807c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit d4b8a42fb253116befe539e5529ac4efd97ab421 bumped the
package from 1.0.16 to 1.0.18.
Upstream added optional neon support in version 1.0.17:
https://github.com/strukturag/libde265/commit/f22cf00a86f4a47f9423deb3b1daa35d981b2ec9

The configure check detects neon support:

-- Performing Test HAVE_NEON
-- Performing Test HAVE_NEON - Success

but causes a build error at linking stage:

[100%] Linking CXX executable dec265
/builds/bkuhls/buildroot/br-test-pkg/bootlin-armv7m-uclibc/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real:
 error: ../libde265/libde265.a(hevcdsp_qpel_neon.S.o):
 conflicting architecture profiles A/M

so we add a configure option to disable neon support.

The build error was not yet detected by the autobuilders but can be
reproduced using this defconfig:

BR2_arm=y
BR2_cortex_m4=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
BR2_PACKAGE_LIBDE265=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f51769b7e9796906bc11d463c1436efe5de7073f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libde265/libde265.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index d7e3df83ca..b559a9f607 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -16,4 +16,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LIBDE265_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
+ifeq ($(BR2_ARM_CPU_ARMV7M):$(BR2_ARM_CPU_HAS_NEON),y:)
+LIBDE265_CONF_OPTS += -DHAVE_NEON=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
