Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D33C001B0
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 16:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63DF6408E9;
	Wed, 26 Jul 2023 16:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63DF6408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OekWjOWon8Uy; Wed, 26 Jul 2023 16:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA6E41D62;
	Wed, 26 Jul 2023 16:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FA6E41D62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83B551BF2B1
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 16:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63CA7817BA
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 16:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63CA7817BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpq64IY6P9p5 for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 16:39:02 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B87681585
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 16:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B87681585
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AFB4DA4C09B1;
 Wed, 26 Jul 2023 18:38:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56966)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOhXP-0002Ax-1S;
 Wed, 26 Jul 2023 18:38:59 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 18:38:59 +0200
Message-Id: <20230726163859.480495-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690389539;
 bh=rXC1A8xo+wHe48AJQfQRIs21JOYJoSnMYrYhJNu4HqM=;
 h=From:To:Cc:Subject:Date:From;
 b=P+9sFViAn8et2o5sZndHPYzj5bDw2nTrV4vTeg0qP+CsHbI3SLvinqCazjQ8GZznk
 NMvA2l/SYoVXyQ9DRX+T7T8JJWFVzvVsCC0MEh5ABWEeAamQxs3q3Zd8D+d1lWWpjl
 QeixC6NAp0wm1CFaK1CauJNnllKTBuEvkprZTuWESo4jPtNNtZrUtckt4+jNdDkmFO
 Orv1YzvWYTlm33yGFoafMaZfU5JF4bWYQa+ohxLsWSuz9F4vpM+Ye/Xh2ypAc53PV8
 IcX//U+/Fjr7kmXtxo0/ozlxL633t/oO/rp1XcsdQdPA3JwV8lpkBkWCR6U4G0jUrV
 78Ke4CXUsR43Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=P+9sFViA
Subject: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.46.0, 3.2.0_libuv_v1.46
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/libuv/libuv/blob/v1.x/ChangeLog

Switched libuv to tarball provided by upstream. removed autoreconf.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 6 +++---
 package/uvw/uvw.hash     | 2 +-
 package/uvw/uvw.mk       | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 3ca184feaf..1fd286d9e9 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  458e34d5ef7f3c0394a2bfd8c39d757cb1553baa5959b9b4b45df63aa027a228  libuv-1.45.0.tar.gz
+sha256  94f101111ef3209340d7f09c2aa150ddb4feabd2f9d87d47d9f5bded835b8094  libuv-v1.46.0-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 640c5bb1ce..75590ad8f2 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,11 +6,11 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.45.0
-LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
+LIBUV_VERSION = 1.46.0
+LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
+LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
-LIBUV_AUTORECONF = YES
 LIBUV_LICENSE = BSD-2-Clause, BSD-3-Clause, ISC, MIT
 LIBUV_LICENSE_FILES = LICENSE LICENSE-extra
 LIBUV_CPE_ID_VENDOR = libuv
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index 8e54ea7d60..2dc6e879e1 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0a612bd243150fbbe1365cdaf48203d32061c1d14f93825a31876b183922f93b  uvw-3.1.0_libuv_v1.45.tar.gz
+sha256  bd5aed741765950074b1ea2507291dce81e528abdf56c406991ad4a27d8d1714  uvw-3.2.0_libuv_v1.46.tar.gz
 sha256  e2a4062818ab05e2a0908737ad49b7c01202247364e900167ac81105de8713f3  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 364a2eded4..12149d43ca 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 3.1.0_libuv_v1.45
+UVW_VERSION = 3.2.0_libuv_v1.46
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
