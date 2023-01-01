Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82327C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 11:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE53660E39;
	Sun,  1 Jan 2023 11:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE53660E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJmU5u7ilJNo; Sun,  1 Jan 2023 11:25:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C9C160E37;
	Sun,  1 Jan 2023 11:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C9C160E37
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C97AB1BF392
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 11:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E42E40895
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 11:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E42E40895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpI8aGRSLs5x for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 11:25:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3400F4087C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3400F4087C
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 11:25:47 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.10.36])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AC08313F85F;
 Sun,  1 Jan 2023 12:25:41 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 12:25:27 +0100
Message-Id: <20230101112528.11170-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672572344;
 bh=BsSiiRjP0scTd5ePKECH7JOTrI1LJ/QDH1uIBhAe6bw=;
 h=From:To:Cc:Subject:Date:From;
 b=QcVu3SJY6mmV6yMwmduCGcai1VS5fg2x5+04mciYgK4V/9OfMzIOvz6Yg09eCOVEz
 vsxRcXa8rWQOQfbf5d/Nk9+wZi9/spJDjNY6wGAscXCTQ++hGWUK3BkYOVeFArA2rB
 3geCJUfnbo+bgd7TbHby1PO1rXVClYWF9DbTYBq8PO3yrhn4JMAZphap118pXovAVQ
 7f9gZjzUXvKNoXJCoPiY5c3HmlxgYAHr/Jy9oEPPkKvQNDkv0Thd2d5D4a9XxF74+h
 k/XSVC7PjPOBjj3uyZ6s2e8oNfHUsxci5n89cK6ju0dWHozBxHQhgEpMGsRMBnwPMm
 pJSiyHYfnw2LQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QcVu3SJY
Subject: [Buildroot] [PATCH 1/2] package/fmlib: bump to version LSDK-21.08
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
Cc: Julien Olivain <ju.o@free.fr>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License file was updated in commit:
https://github.com/nxp-qoriq/fmlib/commit/22126510006f366981c078a340e012a1e0415429

Notable changes in the license update are:
- GPL-2.0+ option was removed,
- Copyright years updated,
- NXP was added,
- License text was reflowed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fmlib/fmlib.hash | 4 ++--
 package/fmlib/fmlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fmlib/fmlib.hash b/package/fmlib/fmlib.hash
index d4dcf3be5c..f81b017869 100644
--- a/package/fmlib/fmlib.hash
+++ b/package/fmlib/fmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6e9e6bdb42dc2a6a76cfd756a2d4cdfcc2be90925c1f439e8a11eafa871896a6  fmlib-43fa98fdbf0c697167e415c3f060896d5b482791.tar.gz
-sha256  837559e20d83910a005e7883b876cc5c42805fe4abcf7e5c5b3c8d036b7f61c8  COPYING
+sha256  64dc76c0adc3aa58bce6aba470dee7dee001d4964ccb1958e899a59d9917b21d  fmlib-LSDK-21.08.tar.gz
+sha256  5d7770fa9f70f0c6f0b4784bbca8401811259a4b1e03455dbd863ffd0d34d2ca  COPYING
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 9509f3de56..3d185979d5 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FMLIB_VERSION = 43fa98fdbf0c697167e415c3f060896d5b482791
+FMLIB_VERSION = LSDK-21.08
 FMLIB_SITE = $(call github,nxp-qoriq,fmlib,$(FMLIB_VERSION))
-FMLIB_LICENSE = BSD-3-Clause, GPL-2.0+
+FMLIB_LICENSE = BSD-3-Clause
 FMLIB_LICENSE_FILES = COPYING
 FMLIB_DEPENDENCIES = linux
 FMLIB_INSTALL_STAGING = YES
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
