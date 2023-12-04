Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B03C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3954A400BA;
	Mon,  4 Dec 2023 21:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3954A400BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8L6RxQ4OQ6S; Mon,  4 Dec 2023 21:12:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A1C44011A;
	Mon,  4 Dec 2023 21:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A1C44011A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9871BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16FFA408D4
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16FFA408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Akbnumznmlnu for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:12:10 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 267924024D
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 267924024D
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 23686A4C0C51
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 22:12:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45530)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGEY-0006NN-2z
 for buildroot@buildroot.org; Mon, 04 Dec 2023 22:12:06 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:12:06 +0100
Message-Id: <20231204211206.12522-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724327;
 bh=IFMKGdCoBj0J6zJMVUWYf5GeeI/DIkD/NiO4suNMwsk=;
 h=From:To:Subject:Date:From;
 b=OqQW/NVqgD7zOLO0U3W2PfDSTwugYYHCd9aI/OvYFafzmAyTpFuKl1VEUGs8gIit5
 ZbF0Fzcp5Btfz/DdA1KD1mYmkG7iNj1ynL7CTHvQcHoNiNp/9xmxip1X42AijRo71Z
 zCWejbSgPewuQC840GOoR85aLI/WJdKhsSbi3NDeMF4EL/7/KECEgqcyr+XNvV5XU+
 k81ZubqNzFS2E557N9cIODZrjRGKPiF72mTxHK4EqzUs0QsRfmEXhOZTiKkk9B+NVC
 Tu13Fsv5mz24DFng1i624FacCaFa1a/7nfWGrMCdPAlSsFNU8VN231+NL8hsKte/2v
 fuYVC4FCITTyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=OqQW/NVq
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.44.2
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

Changelog:
https://sqlite.org/releaselog/3_44_2.html
https://sqlite.org/changes.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index ffeb1ff89c..38cff902d7 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  39116c94e76630f22d54cd82c3cea308565f1715f716d1b2527f1c9c969ba4d9  sqlite-autoconf-3430100.tar.gz
+sha256  1c6719a148bc41cf0f2bbbe3926d7ce3f5ca09d878f1246fcc20767b175bb407  sqlite-autoconf-3440200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index f69097f3b7..99b1c4aa71 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.43.1
-SQLITE_TAR_VERSION = 3430100
+SQLITE_VERSION = 3.44.2
+SQLITE_TAR_VERSION = 3440200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2023
 SQLITE_LICENSE = Public domain
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
