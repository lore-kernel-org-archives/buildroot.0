Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF20C47DA9
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 21:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C50D840025;
	Mon, 29 Jan 2024 21:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C50D840025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bR4ncA_k7SzU; Mon, 29 Jan 2024 21:38:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED1D401B2;
	Mon, 29 Jan 2024 21:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED1D401B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95BA41BF39F
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 21:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E9B2813CF
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 21:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E9B2813CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xoRwpvnqat9 for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 21:38:30 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D934813CB
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 21:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D934813CB
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 70A2013F8A2;
 Mon, 29 Jan 2024 22:38:26 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 29 Jan 2024 22:38:20 +0100
Message-ID: <20240129213820.528731-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706564307;
 bh=I7dnUNttno9hGz1alGQocZs+i/MeKHQnkIaQAbA5F0k=;
 h=From:To:Cc:Subject:Date:From;
 b=Rlzdq+0xLWa4SzrJDw42c/QSble7aqV2PvrZNdZOJGA/hhuhgxsb4p1dGerftaACu
 wbsJJsMzHdavV1+CPKngOY4Px6Di4I/JYt+1O1IjDRh8gDwePrj9jZTIejYL3mp0vt
 MiIX816DwE7TwoyhS9jLLmuHsOdFrpMGqMWfCOToJAnSbuu80JZrNhiB9FvfzLEw5Q
 DHQDG+i3LTmnu8Fl5QJFfdjyikLqFiShxqNJVgEu+IlvEWP4I0WOaZ7n8UT08EDtsY
 ndooxqa1DCr5/6hcdCrN1Or69lOzMZx4RRG6NoApcyxDWbcyaF+XM6HP/Jd4gJFKe2
 AygxsAJFWdNog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rlzdq+0x
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.12.5
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

For change log since 4.12.4, see:
https://github.com/Z3Prover/z3/blob/z3-4.12.5/RELEASE_NOTES.md#version-4125

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index c20bbce2d6..e8110991fa 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  25e9b18d04ee22f1d872dfe0daaf4c39034744525214e34fedd206e25140e96e  z3-4.12.4.tar.gz
+sha256  70e211e0a8e77febccc51865e45111066f623356a4ef0b527c3597362bc6db72  z3-4.12.5.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index f9510ba592..facbdec486 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.12.4
+Z3_VERSION = 4.12.5
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
