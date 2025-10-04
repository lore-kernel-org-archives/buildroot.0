Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1180CAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 13:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5123783B87;
	Sat,  4 Oct 2025 13:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuTcWhU4mKPv; Sat,  4 Oct 2025 13:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71A3E83B8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A3E83B8A;
	Sat,  4 Oct 2025 13:02:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E675226
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 13:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3430E83B8E
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 13:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBMY457p1SXu for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 13:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3374583B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3374583B87
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3374583B87
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 13:02:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77967A4C5D6A;
 Sat,  4 Oct 2025 15:02:36 +0200 (CEST)
Received: from [192.168.1.144] (port=37792 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v51uG-000000001ls-0eLx;
 Sat, 04 Oct 2025 13:02:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Oct 2025 15:02:36 +0200
Message-ID: <20251004130236.2314240-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251004130236.2314240-1-bernd@kuhls.net>
References: <20251004130236.2314240-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759582956;
 bh=RtXf1uHv+fpASJhbYIMxKxKIJcr42sARleqerEfftGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vX4sYajseZQp2W7zH5dd2OB/8XsiwmXrfL0kuggujztoVI9hPRZWIYuyNkBCpZpHt
 biR6lTvZYFXE8vQgjuEx+kiAv5LYjNiV9lbzCYeHPWZT6hEInQohIoLLgVpDXkp99+
 uKvtMfLJG2nTONG8fXvDFXhdLx/SNGE9dbwrE/mGaX0pHntb3N3lo0iYKfWd+0Mvn9
 9139GcK1SkgLykdWxWw+YIX/DAitTQ9P6jbrNjEvE2V6CBJQgtv+PRzs2kEtzTJMJJ
 BUyjquJlUcmeURefTjLaE0zmx2rpB2nHhoJpfuFBSxlKs3IY4Q+e8XmUwhTiQ2Bg0t
 R+eE1WIKYyx7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=vX4sYajs
Subject: [Buildroot] [PATCH 2/2] package/libidn2: bump version to 2.3.8
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

Release notes:
https://gitlab.com/libidn/libidn2/-/blob/v2.3.8/NEWS?ref_type=tags

Updated license hashes due to upstream commits:
https://gitlab.com/libidn/libidn2/-/commit/61ee87ee229c811bd9bf945084645058249b52cc
https://gitlab.com/libidn/libidn2/-/commit/1e863fa32b34c9df5b715c9f2fdf57895d9e31f7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libidn2/libidn2.hash | 8 ++++----
 package/libidn2/libidn2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libidn2/libidn2.hash b/package/libidn2/libidn2.hash
index 3d2a41a00e..412ec8804d 100644
--- a/package/libidn2/libidn2.hash
+++ b/package/libidn2/libidn2.hash
@@ -1,8 +1,8 @@
 # Calculated locally after checking signature
-sha256  4c21a791b610b9519b9d0e12b8097bf2f359b12f8dd92647611a929e6bfd7d64  libidn2-2.3.7.tar.gz
+sha256  f557911bf6171621e1f72ff35f5b1825bb35b52ed45325dcdee931e5d3c0787a  libidn2-2.3.8.tar.gz
 
 # Hash for license files:
-sha256  73483f797a83373fca1b968c11785b98c4fc4803cdc7d3210811ca8b075d6d76  COPYING
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
-sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSERv3
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSERv3
 sha256  01d621eef165cf4d3d3dbb737aa0699178d94c6f18cf87e9dde6db3ca7790f46  COPYING.unicode
diff --git a/package/libidn2/libidn2.mk b/package/libidn2/libidn2.mk
index 59db3662e4..00a87d46b8 100644
--- a/package/libidn2/libidn2.mk
+++ b/package/libidn2/libidn2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN2_VERSION = 2.3.7
+LIBIDN2_VERSION = 2.3.8
 LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN2_LICENSE = GPL-2.0+ or LGPL-3.0+ (library)
 LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
