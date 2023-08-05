Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A01C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A544D60D9D;
	Sat,  5 Aug 2023 21:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A544D60D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7-lNYF-Ch0E; Sat,  5 Aug 2023 21:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF38860AEE;
	Sat,  5 Aug 2023 21:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF38860AEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75EDF1BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 107248142D
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 107248142D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LaOwiyNL-Wbk for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:36:54 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AC038145C
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC038145C
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A55CA4C03A4
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 23:36:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35742)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSOxA-00019F-16
 for buildroot@buildroot.org; Sat, 05 Aug 2023 23:36:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 23:36:52 +0200
Message-Id: <20230805213652.3588314-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691271412;
 bh=g52tE2eQobiQLNrk9RbJzN0z+FkAuUPqqAZM0mUpeI4=;
 h=From:To:Subject:Date:From;
 b=a4z4fkY85kcSePaSnJH681QlU7EOoTrO43bJDhzGsQv1k49XdM2LJbBi1QECE/Cti
 xUfyggpNPrGuG86/yXPEjAlLzHGNnTxHVKjBa2Ht57xdL9lfjQnAt6ERcRlmS1Fonj
 YW84EhzuwEEuOQUvxRa61Zd/rie0+lFe9eht5qYjEeXcBT+ev7iKoPT8NoAfx9IK++
 x/epqgTtcFQxJgNbpaGSjbqDARiZVIInAiWgqnfMtr+cd4AvkGqRreYZ0tq31uOl1L
 9z3zmxZzC4xWDV2THwfoOZtqcera5hJtUe6YJ8gg1+OoSGegHiRoGYN97O59C+AqbL
 bDr11RT2kB5Bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=a4z4fkY8
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.373
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 84979a70fa..6915e04e46 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8059ed6f696b5be4bf77c59d57fc26e35d9e579ba2629e325400a6eb8b91089f  hwdata-0.371.tar.gz
+sha256  0db28dc635d5059ad23d068d2e56ef5dc540f95bc813ea5a3c0f5d63b03d20d6  hwdata-0.373.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index cac6b80185..025f5b4969 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.371
+HWDATA_VERSION = 0.373
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
