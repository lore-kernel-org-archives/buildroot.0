Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6C8EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 15:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7793640920;
	Wed, 28 Jun 2023 15:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7793640920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fSBWi9CUitF; Wed, 28 Jun 2023 15:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7384191F;
	Wed, 28 Jun 2023 15:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E7384191F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CAFE1BF38D
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 15:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74757405DF
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 15:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74757405DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCuYYdCu7njP for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 15:17:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8880D400FE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8880D400FE
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 15:17:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F4A9A4C0740
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 17:17:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35380)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEWuj-0000fs-0Y
 for buildroot@buildroot.org; Wed, 28 Jun 2023 17:17:01 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 17:17:01 +0200
Message-Id: <20230628151701.561756-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687965421;
 bh=utcIYo9JRqNvUebGDC96fxac+YR/hqVJTkQljDgAAl4=;
 h=From:To:Subject:Date:From;
 b=f61yLnuwCdkCFFareg/9HtLdgrdrnhzrM/a1uPHdYJ4ygudfMnQhhXUSvfNBPTM2J
 l3priMQLa445vr15fiEw+l/Bzj/Y6OSuyzKv5+yKt/erEQcCmLxFFUZhTUajVk+QOv
 POqAYz7351/0Csm16CUWMpSTAxAbAZmWecaU/s2T5hBFXtm2K0BmM9GSN4ItyAP/gx
 7XE3Pz2eC8ErhAMwpKeH35K9gmJ4NuOFqvpOnpiJKtd12wdUefYadirwyYL5AEQf3N
 TwmLGcqNZV9wLeNaJE1R65F+EZwHLIaNwcOuELvCrxGVRWrDsUmBU6qAxpSqP4wHXz
 8cnLU3bAcgNeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=f61yLnuw
Subject: [Buildroot] [PATCH 1/1] package/diffutils: bump version to 3.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00009.html

Added sha1 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/diffutils/diffutils.hash | 4 +++-
 package/diffutils/diffutils.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
index ff0e9ab278..df160a124d 100644
--- a/package/diffutils/diffutils.hash
+++ b/package/diffutils/diffutils.hash
@@ -1,4 +1,6 @@
+# From https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00009.html
+sha1  c16a9cf107ad1f0f791b6d00852dc5e961c1c451  diffutils-3.10.tar.xz
 # Locally calculated after checking pgp signature
-sha256  d80d3be90a201868de83d78dad3413ad88160cc53bcc36eb9eaf7c20dbf023f1  diffutils-3.9.tar.xz
+sha256  90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e  diffutils-3.10.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 1004437026..2c66434a9a 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.9
+DIFFUTILS_VERSION = 3.10
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
