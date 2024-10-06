Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634DECFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 17:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F2C40394;
	Sun,  6 Oct 2024 17:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPtvcYB5Y_WG; Sun,  6 Oct 2024 17:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 720A740393
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 720A740393;
	Sun,  6 Oct 2024 17:34:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28FD21BF310
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 17:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18706810E9
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 17:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjCwbNN9kjsi for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 17:34:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20C95810E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C95810E8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20C95810E8
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 17:34:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 82278B00573;
 Sun,  6 Oct 2024 19:34:30 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 19:34:24 +0200
Message-ID: <20241006173424.1487914-1-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728236071;
 bh=MaWXpIdJR1lZFvRmGz1PXyX5rucvnMq5rtSxevXBJBU=;
 h=From:To:Cc:Subject:Date:From;
 b=LrblP+l4A/wCNWKA/b2cVk5R1vfJKJadQcre/LTH+ICEZYYyVpVu1LmuqxHq25KM4
 2NVYme/z9YPQ6dbkUwloDg1XuH9A2JZb+nu1+2wU2Zf3UpRVm5wcVtZWbOrE1XuWDH
 803RFUTwmaGtDZNhqKPmYMXhxYRStIkotwngHFUcjniDRfqiNVqEFegxwgeMz4QyEL
 wGDaosONQ60plNG20/+fUO8YjegVSc6XE3NIUeAaBM0gCARPU89x48JQsI8QJigEwT
 QScumz+xp3+5AY2o3IQGc5UvylFUZs4Fiat1hPazeQHLgrtbqCAb8zVc5xNO1/wrs4
 efSwV74zc/t1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LrblP+l4
Subject: [Buildroot] [PATCH 1/1] package/mtools: bump to version 4.0.45
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

Release announces:
https://lists.gnu.org/archive/html/info-mtools/2024-09/msg00001.html
https://lists.gnu.org/archive/html/info-mtools/2024-06/msg00000.html

For change log since 4.0.43, see:
https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.45/NEWS?view=markup

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8004817614
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 412d67a328..0cad06ce58 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  997ffe4125a19de1fd433ed63f128f7d54bc1a5915f3cdb36da6491ef917f217  mtools-4.0.43.tar.lz
+sha256  32ca85dfc1674c536143d4e0da60e3134039eb9552e0fecfa110e9c8736093ce  mtools-4.0.45.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 96d8e43ea2..7089af339e 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.43
+MTOOLS_VERSION = 4.0.45
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
