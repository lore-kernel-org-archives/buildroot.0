Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D04C4708E
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 19:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D272460D6D;
	Tue,  3 Jan 2023 19:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D272460D6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HudA3zUaCkpU; Tue,  3 Jan 2023 19:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2011560784;
	Tue,  3 Jan 2023 19:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2011560784
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4CC1BF834
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF5681761
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 19:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF5681761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rw06dRPLdfYB for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 19:37:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 457D281450
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 457D281450
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 19:37:08 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.231.8])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E241E13F88E;
 Tue,  3 Jan 2023 20:37:03 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 20:36:47 +0100
Message-Id: <20230103193649.7488-3-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103193649.7488-1-ju.o@free.fr>
References: <20230103193649.7488-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672774626;
 bh=g+n3dtyW7nQq8cnZ85Zj5DsWXNE9/dZQ9EHofFTsr9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RHdBeJo8lcmjh0rfm7ff37fQSoGAdomacykBwq8SqtrxYs6n2xNzY80JiDUGCAwda
 lMPZFDaH8HA8terO+qfjHPRaBKES+Q/rtqMV0OITIEfn/bF9xBIrLTBS3C2tpLbX5D
 gPLMQxJ4iRQpJQpUs6t8yxGOFsgOZ9poFKXiSy5O3lXhuH/DPplg7k7hlfLFE5UNJt
 LQ6ZEq9RnfyD3t92GFLdftdutWzNaQH+JonfKkjIBVI31aaGz916ez8hW/Rwd58BT/
 cO/8+Zi3e2drt86r8apbPoD0KetgNPxHuJZlvjYvQoblXs9u7sOHtku+w9dpgNWLv8
 aqwGEqVGXd9Pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RHdBeJo8
Subject: [Buildroot] [PATCH 3/5] package/libgpg-error: bump to version 1.46
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For the changelog, see:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=log;h=libgpg-error-1.46

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgpg-error/libgpg-error.hash | 6 +++---
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index b29ec37598..ffe27e9d99 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,10 +1,10 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  fe724ed37b4935964059a47b7c64d5f8246659d8  libgpg-error-1.45.tar.bz2
+sha1  a6e5efdd72e848aab4064e5ef4c6835ba344bcf1  libgpg-error-1.46.tar.bz2
 
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.45.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.46.tar.bz2.sig
 # using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  570f8ee4fb4bff7b7495cff920c275002aea2147e9a1d220c068213267f80a26  libgpg-error-1.45.tar.bz2
+sha256  b7e11a64246bbe5ef37748de43b245abd72cfcd53c9ae5e7fc5ca59f1c81268d  libgpg-error-1.46.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 252d95ac7f..ab3c7c3bf2 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.45
+LIBGPG_ERROR_VERSION = 1.46
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
