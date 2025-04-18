Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0367C369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 14:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A24D408AF;
	Fri, 18 Apr 2025 14:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9jHrtj41KOO; Fri, 18 Apr 2025 14:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5B9241DD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5B9241DD6;
	Fri, 18 Apr 2025 14:42:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31576228
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17565424E9
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNVnKIX2aVDh for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 14:42:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF9C241DD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF9C241DD6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF9C241DD6
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:42:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.208.157.35]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N6bfq-1vCai11rby-01450V for <buildroot@buildroot.org>; Fri, 18 Apr 2025
 16:41:59 +0200
To: buildroot@buildroot.org
Date: Fri, 18 Apr 2025 16:41:03 +0200
Message-ID: <20250418144104.24180-2-dalang@gmx.at>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:KJuHaq0zbh4nFuAFZVOkDKsCtkQUu8jrJCi/Irhi2RBfTYLrDEU
 JgAMr0bqJqu4BVN5C3lwT+DKgM6eEhpczKp3zSrrnCtNuJBPCtbW3RnIqCzXpX6Vjizc2be
 cLWLSlAKqyCMEQAblu4UB5vVTyLRfRJbqnS46HZPSnVQ1kcBM7RWQ3v+ltCh9Ie6677y9d7
 Fr4GFeFIo4avX1RDgB9BA==
UI-OutboundReport: notjunk:1;M01:P0:bhkssLNNvk0=;NETVmiwDGqV3VEM0HLaKedPVfVS
 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
 ZbwiYb9DhDiqE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1744987319; x=1745592119; i=dalang@gmx.at;
 bh=c34WWCSPhmOFoghjCuj2vaAqqZFHG6VQM+adjVl+QMI=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Lhk888ormIwGn2MwHowRM1bSx+Y2X7gp70/RnzMc0tRD8kXpYTx+sPI8ajF5yWPv
 Qg7SOGxoyfa990SKkL79/e2aZEOxtzulAegaB4/MJ5BRv+6f/J6a4Fa7HDEfW/hWO
 VaY6hfHZWujOjiRJOdyN2CnaffIaB8CQVLrMXWg1+lVINEI565bvzqFlt7FptNMMP
 LYoPrSRMFnd3juoEtxzJL206leQ1rSUkh8zpJZx3xEHKOVCj7rgaexq94LMpz6SRC
 Yrfq7sibgxIi1T6LQGxArBduIAhGD6g+6P72/5TrMGT+7ph/k8AZW2rXIxFyigEKd
 JZ7doNoHyLiDDANxsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=Lhk888or
Subject: [Buildroot] [PATCH] package/pangomm2_46: bump to version 2.46.4
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/pangomm/-/blob/2.46.4/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/pangomm2_46/pangomm2_46.hash | 4 ++--
 package/pangomm2_46/pangomm2_46.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pangomm2_46/pangomm2_46.hash b/package/pangomm2_46/pangomm2_46.hash
index 8d05dbc2ff..eb4e1c58e9 100644
--- a/package/pangomm2_46/pangomm2_46.hash
+++ b/package/pangomm2_46/pangomm2_46.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pangomm/2.46/pangomm-2.46.3.sha256sum
-sha256  410fe04d471a608f3f0273d3a17d840241d911ed0ff2c758a9859c66c6f24379  pangomm-2.46.3.tar.xz
+# From https://download.gnome.org/sources/pangomm/2.46/pangomm-2.46.4.sha256sum
+sha256  b92016661526424de4b9377f1512f59781f41fb16c9c0267d6133ba1cd68db22  pangomm-2.46.4.tar.xz
 # Locally computed
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/pangomm2_46/pangomm2_46.mk b/package/pangomm2_46/pangomm2_46.mk
index 1725158491..3640641af1 100644
--- a/package/pangomm2_46/pangomm2_46.mk
+++ b/package/pangomm2_46/pangomm2_46.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGOMM2_46_VERSION_MAJOR = 2.46
-PANGOMM2_46_VERSION = $(PANGOMM2_46_VERSION_MAJOR).3
+PANGOMM2_46_VERSION = $(PANGOMM2_46_VERSION_MAJOR).4
 PANGOMM2_46_SOURCE = pangomm-$(PANGOMM2_46_VERSION).tar.xz
 PANGOMM2_46_SITE = https://download.gnome.org/sources/pangomm/$(PANGOMM2_46_VERSION_MAJOR)
 PANGOMM2_46_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
