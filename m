Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71C1C5320E
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 08:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 828CB60590;
	Tue, 20 Aug 2024 08:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azeNfmDn_A-G; Tue, 20 Aug 2024 08:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9996060595
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9996060595;
	Tue, 20 Aug 2024 08:59:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00FE21BF228
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 08:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED1B2810DC
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 08:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nby8waxmcP-V for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 08:59:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9E41810D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9E41810D7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9E41810D7
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 08:59:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.13])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id D420A2003CC;
 Tue, 20 Aug 2024 10:58:59 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 10:58:48 +0200
Message-ID: <20240820085848.4242-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724144342;
 bh=kgqpGnVc5lGRhEqB6Cre8I0Jd05QnjQc8yzaZfvnzfo=;
 h=From:To:Cc:Subject:Date:From;
 b=n61LGQspk3K1XtlX8a1r9b4JVX9XM/UdcFZp6YQinGocpNvvZVUvxGF8YpjfvLBuQ
 MKZaCqH+ppVBDtx7bdnNM+JDLCvB8xJBWNkUC/Sh4f6Qn8sw3NZD+NLp5NTPoCIfuS
 p3D69dzM2qXnDsDKLAzhyt0YgYFzAxzuBj4kmZIA+oK/yk7zM5g+K5tUs+AJ69WCP9
 DIcBKMQa978L3f7tbPokPlkmvyI6e7ptbxByksR97FijjdptMDLr37Fl0iP8OfuCEd
 oITgv0sqF0Sxdjftu+k5A//Z8Z4Fj0R+qpcelDLcN9qLoX03pFaKH+juHtVylfE41u
 fo+K6lRLcDMXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n61LGQsp
Subject: [Buildroot] [PATCH 1/1] package/lsuio: bump to 2020 version
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
Cc: Vincent Jardin <vjardin@free.fr>, peter@digitalbrains.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The new version from peter@digitalbrains.com adds some few new features (name,
offset, etc.) and it includes some few improvements.

The former version was more than 14y old.

There is no tag, neither any archive, so currently I assume that HEAD can be used.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/lsuio/lsuio.hash | 1 +
 package/lsuio/lsuio.mk   | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lsuio/lsuio.hash b/package/lsuio/lsuio.hash
index 2df6d074f4..fc897ba49e 100644
--- a/package/lsuio/lsuio.hash
+++ b/package/lsuio/lsuio.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  c88b3850248b2d3419e025abd7b9b0991c8bd33a2d4983f9608408a29900bfb5  lsuio-0.2.0.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  5520415d6e6e37cf70acefd73743915b2a9bb1e1026f61c132a89b41db861d21  lsuio-HEAD-git4.tar.gz
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index 193de15aef..4d5cf35bcf 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LSUIO_VERSION = 0.2.0
-LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
+LSUIO_VERSION = HEAD
+LSUIO_SITE = https://github.com/DigitalBrains1/lsuio.git
+LSUIO_SITE_METHOD = git
 LSUIO_LICENSE = GPL-2.0
 LSUIO_LICENSE_FILES = COPYING
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
