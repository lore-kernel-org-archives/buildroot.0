Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB2CCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 18:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A28041734;
	Sun, 24 Sep 2023 18:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A28041734
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJWpdz4VDMMi; Sun, 24 Sep 2023 18:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F1041776;
	Sun, 24 Sep 2023 18:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F1041776
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5BE1BF337
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63675417A8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63675417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1xcYug8ymuW for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 18:36:38 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78DDE41739
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 18:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78DDE41739
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DC3DA4C09E7;
 Sun, 24 Sep 2023 20:36:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42944)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qkTxu-0008Qi-2R;
 Sun, 24 Sep 2023 20:36:22 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:36:21 +0200
Message-Id: <20230924183622.41519-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230924183622.41519-1-bernd@kuhls.net>
References: <20230924183622.41519-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695580583;
 bh=HkS8FrABYEL6p5FBn9BMf/GKeXhb7++8o8UjcFgyvVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QQ2eBLvdyUVKieP/fsf3U0Jm3m1UP0TzAywGBjBCE66i4u8qc46A6X7LkVu+FBdbY
 LSuTI7dVfN7S2WyPXlu7LhtKa5+4tE9ix3GTm6sVIPYo57yxaSRiQLoIPc/ZgDm9Fa
 gDxN2TM8bxKwNWjl4eowZs74dhsgydEN5hbXJIVJHnjn4/lXBJC2uiiWwI+r4WyYJl
 coNMstpwG9NC5LVHYvvxIjrgX4HI6K1UwyeCTDyAREVogdwTG0XS3ebM5DXbObd99F
 LrmYNJ2IveRc3n2gyHCcX856i4NBxNRvbE4MT8SNfUQ8ljb7Vgn032LV8oYmPeZhw9
 hWp+2iu+/CBIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=QQ2eBLvd
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: bump version to
 23.3.3
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 012317db3d..d2ef168a64 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6a0fc8513fb60e2e2fc2178a8fb0b25cb5dbacf52a645af9a9297fc5f43822ab  intel-media-23.3.2.tar.gz
+sha256  66bcce50e9ade800891d08ae3e6cac5aeda60c7ede945ab19e8d2a33e321d06e  intel-media-23.3.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 53975eb735..bdb4c699c0 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 23.3.2
+INTEL_MEDIADRIVER_VERSION = 23.3.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
