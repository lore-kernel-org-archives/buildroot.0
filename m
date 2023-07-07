Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39B3EB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 15:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45F7D81F61;
	Fri,  7 Jul 2023 15:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45F7D81F61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQuh1bgyOLCQ; Fri,  7 Jul 2023 15:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73CD081E8E;
	Fri,  7 Jul 2023 15:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73CD081E8E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3E001BF39E
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 15:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F1F760C00
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 15:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F1F760C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XAifNBZEfmdY for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 15:18:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87F2E60BF0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87F2E60BF0
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 15:18:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5986AA4C01A0;
 Fri,  7 Jul 2023 17:18:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52032)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qHnDp-0007OV-0D;
 Fri, 07 Jul 2023 17:18:13 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Jul 2023 17:18:13 +0200
Message-Id: <20230707151813.277000-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688743093;
 bh=XCLBnzh1vJWGUgRO+Slo2tynMRdeFX/i38hZJC83+pQ=;
 h=From:To:Cc:Subject:Date:From;
 b=GkD3lFkOL/YiKfB2bR0UrGBiMav5DRufToVVP30bvqVT4h6Vg+4bFC+U6uKRy5fP+
 v/XfIjkXWos/4TbmNIwCxisHgOHtTRDa7OxzzVin80OjjbB7GOBFQkn6n3721xpgD3
 0Vk82oh+c5vs8uUVpzC7ZUh0jQTEG9e4Jvta89QEmZQHRaTdK+qE8YC2xgycZCjBgN
 PHS/s8etfCfKgnNKJgxldSSf1mPVWLrlREAU2mbUPl5rwrGZQRVibHYQQqlO31bG63
 8w/ph7lFyipqHpGaTInR4K1zL9oCuSZ7/O7OD+fOVpJpHAfDdk+X1YBZDNITVPC2JL
 aTK+EMZo6oxxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=GkD3lFkO
Subject: [Buildroot] [PATCH 1/1] package/hwloc: bump version to 2.9.2
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
Cc: Steven Noonan <steven@uplinklabs.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed md5 hash.

Changelog: https://github.com/open-mpi/hwloc/blob/v2.9/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/hwloc/hwloc.hash | 5 ++---
 package/hwloc/hwloc.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index 963a1fd930..d40315a3af 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,6 +1,5 @@
 # From https://www.open-mpi.org/software/hwloc/v2.9/
-md5  49869a8e19754299db512572abc5eb2b  hwloc-2.9.0.tar.bz2
-sha1  ee178b64234fdbf70f576b79963459ab80880583  hwloc-2.9.0.tar.bz2
-sha256  2070e963596a2421b9af8eca43bdec113ee1107aaf7ccb475d4d3767a8856887  hwloc-2.9.0.tar.bz2
+sha1  be2a4f299c0da7670d39724986268bfa3fac6aee  hwloc-2.9.2.tar.bz2
+sha256  0a87fdf677f8b00b567d229b6320bf6b25c693edaa43e0b85268d999d6b060cf  hwloc-2.9.2.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index c97e46999c..6f3b8069e6 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HWLOC_VERSION_MAJOR = 2.9
-HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).0
+HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).2
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
 HWLOC_LICENSE = BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
