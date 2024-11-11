Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33228D2E9E8
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB69C403F9;
	Mon, 11 Nov 2024 13:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tr4YmzxmC697; Mon, 11 Nov 2024 13:14:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 994F3403F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994F3403F3;
	Mon, 11 Nov 2024 13:14:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0886DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DC526072C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCEL8JNsDNHJ for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:14:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 654E960726
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 654E960726
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 654E960726
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:14:01 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3DEEFB0055E;
 Mon, 11 Nov 2024 14:13:57 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 11 Nov 2024 14:13:52 +0100
Message-ID: <20241111131352.257334-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731330838;
 bh=2MkJ6JfKlTJ7Dv2Rz2nV/pwQ2o8J6VSJKMr0I0iC8Kw=;
 h=From:To:Cc:Subject:Date:From;
 b=SXIZYpdHweVB+UOZsEfmdLw5fqLsRQYX7y1D/oXzcEqBCVVHp3eWzP/p3pi1E/yeK
 rbbGPWQJ6rSLe7M1JQ716RyvQRlbVfTsfhjcCnVvcln293/Idx0a7b2YgjiQoyMnbe
 0t07grrxBkkTb2dKjUJVaRqV7BBYBNDjYjkM6gGBzuq4CekbufA/0IPOIiT3beGjCL
 KyukLNAmEwKG9bqkOOlwMaiA3bLGhjgNZjy3WB88kFy20gEDnp2QrOzA7GuskfY16P
 goxmBKvatlUWzrQ9xP91P0iwsYYpo7Wsg6XPemI8mtwWfygOJ5IxW1ANGmVPgSOlb+
 McYcvDGKXyAFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SXIZYpdH
Subject: [Buildroot] [PATCH 1/1] package/findutils: bump version to 4.10.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release announce, see:
https://lists.gnu.org/archive/html/info-gnu/2024-07/msg00002.html

This commit also updates the hash file comment, to use the sha256 hash
published in the release announce, to provide the signature URL and the
pgp key id used for the signature verification.

See the gnulib documentation for details [1]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), findutils will be Y2038 compliant.

[1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1536449589
---
 package/findutils/findutils.hash | 7 +++++--
 package/findutils/findutils.mk   | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/findutils/findutils.hash b/package/findutils/findutils.hash
index 0284c0e7b2..a431827784 100644
--- a/package/findutils/findutils.hash
+++ b/package/findutils/findutils.hash
@@ -1,5 +1,8 @@
-# Locally calculated after checking pgp signature
-sha256  a2bfb8c09d436770edc59f50fa483e785b161a3b7b9d547573cb08065fd462fe  findutils-4.9.0.tar.xz
+# From: https://lists.gnu.org/archive/html/info-gnu/2024-07/msg00002.html
+# After checking pgp signature
+# https://ftp.gnu.org/pub/gnu/findutils/findutils-4.10.0.tar.xz.sig
+# with key A5189DB69C1164D33002936646502EF796917195
+sha256  1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfecb8ae698789f0a4f5  findutils-4.10.0.tar.xz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 9731a35047..ad1fbdd6c6 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FINDUTILS_VERSION = 4.9.0
+FINDUTILS_VERSION = 4.10.0
 FINDUTILS_SOURCE = findutils-$(FINDUTILS_VERSION).tar.xz
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPL-3.0+
@@ -14,6 +14,7 @@ FINDUTILS_CONF_ENV = \
 	gl_cv_func_stdin=yes \
 	ac_cv_func_working_mktime=yes \
 	gl_cv_func_wcwidth_works=yes
+FINDUTILS_CONF_OPTS = --disable-year2038
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 FINDUTILS_DEPENDENCIES += libselinux
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
