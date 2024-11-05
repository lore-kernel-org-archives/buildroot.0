Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3B0D2B92E
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FE3A608A8;
	Tue,  5 Nov 2024 14:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTX3cw6Bla9t; Tue,  5 Nov 2024 14:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89B816089E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89B816089E;
	Tue,  5 Nov 2024 14:36:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 412563B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E9A4401F1
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haY6Uh46CPAd for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 14:36:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 455B84020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 455B84020B
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by smtp2.osuosl.org (Postfix) with ESMTP id 455B84020B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 14:36:24 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.87.173])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wDXz2BjLSpn6JZFAA--.8176S2; 
 Tue, 05 Nov 2024 22:36:21 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Date: Tue,  5 Nov 2024 06:36:06 -0800
Message-ID: <20241105143606.5034-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDXz2BjLSpn6JZFAA--.8176S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrKr4xXF4rAryxCrWrZFyftFb_yoW8JrWkpr
 WDGr12kr1xZw1DJ34xCr17Zr1S9FWq9r4UGw4DXw1jqwnrJF1jya45Ka18Ar47WF4Iyw45
 Xa1UC3ZrXrWUt3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUga9xUUUUU=
X-Originating-IP: [223.102.87.173]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXBqOjWcqLFAMKAAAsQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=IC2II
 lxRerUWwKlSF7TOV88esCr2opRUwI+tc9ncCD0=; b=Bm0wfO6OJVH02djkSPqJa
 rHc/FvZuVVw0EWVCFLmvEWXEsknEtirAh17OMHmKAL58hR9IdsA4KszELZO/9F89
 X76xw6z3XfySGzawP95208HaVXOjzcKKmHyahgKTVDp8dFtva84RBirk7jFJszY+
 u0OoqHXXnC03oOEUuCVIak=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Bm0wfO6O
Subject: [Buildroot] [PATCH 1/1] package/crun: bump to version 1.18.2
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

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/crun/crun.hash | 2 +-
 package/crun/crun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index b111e941dd..6f2d676bed 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  a03ba1e58b8823ae77d010024b43bd94c5a99f7d652257b1b23abd2d2cdb087f  crun-1.15.tar.gz
+sha256  fdd530a398e32c36ccb597a43d17692631257374b9121027d88bbc5bccb24442  crun-1.18.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index be5897dbc2..255c1b8861 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.15
+CRUN_VERSION = 1.18.2
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
