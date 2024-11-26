Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6D6D3B98B
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4CB56F4FC;
	Tue, 26 Nov 2024 13:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_aJhrkFl4OT; Tue, 26 Nov 2024 13:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C006F559
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8C006F559;
	Tue, 26 Nov 2024 13:27:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CEAFDB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F45261B39
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQpTJHxH050g for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 221A76F4A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 221A76F4A8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F64B86640; Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 14:24:50 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 8952252da7bce5eccfdb79d9126f832d35677c11
X-Git-Newrev: cd42b188bfb9c4432291b40f2ca471fac8b82121
X-Patchwork-Hint: ignore
Message-Id: <20241126132639.1F64B86640@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/libpng: fix arm
 build with NEON
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd42b188bfb9c4432291b40f2ca471fac8b82121
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Fixes:
http://autobuild.buildroot.net/results/52c/52c974e70f922e9d7efea4c538e4438a22faa846/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-authored-by: Peter Korsgaard <peter@korsgaard.com>
[https://lists.buildroot.org/pipermail/buildroot/2024-November/767661.html]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 54cfff355c4011f3f049dc49bbac24ab66f905ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 9761993d79..c0b3ad24d5 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -16,10 +16,12 @@ LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
 LIBPNG_CONF_OPTS = --disable-tools
+LIBPNG_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_aarch64),y)
 LIBPNG_CONF_OPTS += --enable-arm-neon
 else ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
+LIBPNG_CFLAGS += -mfpu=neon
 LIBPNG_CONF_OPTS += --enable-arm-neon
 else
 LIBPNG_CONF_OPTS += --disable-arm-neon
@@ -31,5 +33,8 @@ else
 LIBPNG_CONF_OPTS += --disable-intel-sse
 endif
 
+LIBPNG_CONF_ENV = \
+	CFLAGS="$(LIBPNG_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
