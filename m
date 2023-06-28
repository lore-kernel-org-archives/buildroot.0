Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778E3EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 15:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09737402B3;
	Wed, 28 Jun 2023 15:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09737402B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2NMDSy10tzB; Wed, 28 Jun 2023 15:13:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC54940570;
	Wed, 28 Jun 2023 15:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC54940570
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4DEF1BF38D
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 15:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D1D640570
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 15:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1D640570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WRndfaXTQ3ye for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 15:13:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C7C6402B3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C7C6402B3
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 15:13:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79E7EA4C0740;
 Wed, 28 Jun 2023 17:13:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37088)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEWrA-0008UB-0q;
 Wed, 28 Jun 2023 17:13:20 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 17:13:19 +0200
Message-Id: <20230628151320.554700-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687965200;
 bh=GH01tDQxZYz7qmbu78KUxM31lbM1rSDYqlOmlMLRQ/s=;
 h=From:To:Cc:Subject:Date:From;
 b=ftyip0nY0NLTHg8r+AF87Pw+vg53HH2oTeEDSdziLyDSmPuBIvPgcIXfqq9fAb5sK
 mPeMPMCfFn8sdlQNZysv29o3xIx3r/yEhScNBkIyIa1BrZPLIYeKFgssHUuH7W3FDM
 ndK351T9himiTlHdA6rdSOZQ9WYva+iALArGYE4vW3ws6KZwS/2ggjQqtU9eRQ08k/
 +BXoEDcFQ/wzVMu1taHB46TS9NWd6Zca5cF8LSDUxUxmtuhfX1tbSVsRJvtEN9GrCv
 Bw/XqNw/t3YQj+cw2TGttwYXWkSpnYJl7a+Ba08tAAhd9VAPVe2TEey5DIFUrzoq9h
 K5AsoJAIDWvzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ftyip0nY
Subject: [Buildroot] [PATCH 1/2] package/libmd: bump version to 1.1.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://archive.hadrons.org/software/libmd/libmd-1.1.0.announce

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libmd/libmd.hash | 5 +++--
 package/libmd/libmd.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libmd/libmd.hash b/package/libmd/libmd.hash
index 1a3c9d80df..7174b270ae 100644
--- a/package/libmd/libmd.hash
+++ b/package/libmd/libmd.hash
@@ -1,5 +1,6 @@
-# From https://lists.freedesktop.org/archives/libbsd/2021-October/000311.html
-sha512  731553ecc5e0e1eb228cced8fccd531fe31fb5c7627ca30013d287e1aeb8222959cf7498fbb7414bbabb967b25d4e8b0edd54fc47f6ccf55fc91087db0725ce3  libmd-1.0.4.tar.xz
+# From https://archive.hadrons.org/software/libmd/libmd-1.1.0.announce
+sha256  1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332  libmd-1.1.0.tar.xz
+sha512  5d0da3337038e474fae7377bbc646d17214e72dc848a7aadc157f49333ce7b5ac1456e45d13674bd410ea08477c6115fc4282fed6c8e6a0bf63537a418c0df96  libmd-1.1.0.tar.xz
 
 # Hash for license file
 sha256  4365ef6255ad553fce69dd4bc0e093472c5d0e41b8ea493a545cc926ce171aa6  COPYING
diff --git a/package/libmd/libmd.mk b/package/libmd/libmd.mk
index 19a2458982..8bbebc1bf1 100644
--- a/package/libmd/libmd.mk
+++ b/package/libmd/libmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMD_VERSION = 1.0.4
+LIBMD_VERSION = 1.1.0
 LIBMD_SOURCE = libmd-$(LIBMD_VERSION).tar.xz
 LIBMD_SITE = https://archive.hadrons.org/software/libmd
 LIBMD_LICENSE = BSD-2-Clause, BSD-3-Clause, Beerware, ISC, Public Domain
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
