Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BF7C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 20:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B39794137D;
	Sun, 11 Jun 2023 20:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B39794137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USUbB9P9Rwc4; Sun, 11 Jun 2023 20:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 943EB4138D;
	Sun, 11 Jun 2023 20:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 943EB4138D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85C851BF271
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 20:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 654E94138D
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 20:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654E94138D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2Q-BunSZzS6 for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 20:39:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C60304137D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C60304137D
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 20:39:24 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 06F90B0051E;
 Sun, 11 Jun 2023 22:39:18 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 22:39:08 +0200
Message-ID: <20230611203909.113108-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1686515961;
 bh=oHj/FgOUGw/pOZRA6/1hLckyDk7Q8MQDDg4LMfXr1gM=;
 h=From:To:Cc:Subject:Date:From;
 b=RCi4iMRCVVWbsrX31mp7IiMnMMSJ89cv8b7vvrmvQdOVorCWcA0KfDmMZoWoo9UMi
 rIFqCeCKial5zUHTHhod5KoljypNrJRCTxnshjKDxtpyGxhePQTDyUAOkoR+HLezL9
 wMrwyCQ0nSYSeL4wr9jhFYin0d3gzDap28O+AW1lLl167WTh9n1fV4yhA8K3OInLuh
 LDPYt0SoRYIKp+QPWQHWNNkPNTd3kqPFM6oz8OBfHH4SbbahpKnKKdZ84L5d9DaAHC
 2ahITyPOU9Wo14/k7h+fNEt3tzPiuz9MtUp5uwfQ7wGfSIPnj+NKBfqBmartL/spWx
 /GvPG1HQ36Lig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RCi4iMRC
Subject: [Buildroot] [PATCH 1/2] package/dos2unix: bump to version 7.5.0
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

The license hash changed due to URL and year update,
since version 7.4.3:

-See also http://www.freebsd.org/copyright/freebsd-license.html
+See also https://www.freebsd.org/copyright/freebsd-license.html

-Copyright (C) 2009-2022  Erwin Waterlander
+Copyright (C) 2009-2023  Erwin Waterlander

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index a16c1aecac..032c8ea2d2 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.4.3.tar.gz.asc
-sha256  b68db41956daf933828423aa30510e00c12d29ef5916e715e8d4e694fe66ca72  dos2unix-7.4.3.tar.gz
-sha256  275ce1371734904b275e83bf760e3e6d2a520614545a3850c9568d1892b940fd  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.0.tar.gz.asc
+sha256  7a3b01d01e214d62c2b3e04c3a92e0ddc728a385566e4c0356efa66fd6eb95af  dos2unix-7.5.0.tar.gz
+sha256  6009a35c7aaee9888fd4844972c37b84bce22e7407893727c70f4f3560ae3eac  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index f16a527f2e..6d1e70cf26 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.4.3
+DOS2UNIX_VERSION = 7.5.0
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
