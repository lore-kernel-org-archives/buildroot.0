Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7129CD6E44
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 22:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 846C042681;
	Wed, 27 May 2026 22:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jP1TslwUGbpo; Wed, 27 May 2026 22:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B66EB42686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779922792;
	bh=BV5q8+AlmMuRkXcbt1xbn0e8i+FHtV4K4WepXMNVQ2M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CRyF1Bpmmkc78WxvGJk8ZikKwrmxlB5FdUtJwfL3zgZ4qaPCfYbMmWzwABia2kQ5U
	 BtZswh1Erai37r/qdbhpXz7nbia4HPe1+C3jCcLQFI50fil/uGqLQB7WRMsk97q7vG
	 pbO9D4NzCNMvA7tKXzft8dc3qTaynJynISl1G7gwvtMtQYbnjL8DLE/F2LiBMya5vn
	 2vkrnePKdt6Fbn17EdceepKXC0cPojDGlNAMNvpqELEr05GPcIxvBBWmWurMV1V5rc
	 bykV0tFChVMt0fUqqQMyhFKzuCg4z4Thf0tSBuGSUREWXH5Gjb3sBeuWI5LKmr6qnR
	 Zx8FMQrZNlQ0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B66EB42686;
	Wed, 27 May 2026 22:59:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B76428A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF39661663
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XSPG-fhhMfq5 for <buildroot@buildroot.org>;
 Wed, 27 May 2026 22:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AEC0615EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AEC0615EF
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:59:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91A878708C; Wed, 27 May 2026 22:59:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 00:53:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38358daba978181f08a0b135782116f87c73562d
X-Git-Newrev: f51769b7e9796906bc11d463c1436efe5de7073f
X-Patchwork-Hint: ignore
Message-Id: <20260527225934.91A878708C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: disable neon support for
 armv7m
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f51769b7e9796906bc11d463c1436efe5de7073f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
