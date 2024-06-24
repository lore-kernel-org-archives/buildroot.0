Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF55FC2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 06:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94EB780FB4;
	Mon, 24 Jun 2024 06:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nyb87aubKQvc; Mon, 24 Jun 2024 06:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DB7580F6C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB7580F6C;
	Mon, 24 Jun 2024 06:59:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF7231BF20F
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D92EC80F6C
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 06:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9JRExqaTgPc for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 06:59:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5E5380F62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5E5380F62
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5E5380F62
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 06:59:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.90]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiJV6-1ssDFs3pBu-00dj1N
 for <buildroot@busybox.net>; Mon, 24 Jun 2024 08:54:02 +0200
To: buildroot@busybox.net
Date: Mon, 24 Jun 2024 08:54:02 +0200
Message-ID: <20240624065402.3501-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:UbCtMzU1cxSk9gWDiNayF05z02LpbbzFS+B7cIFgJzFRe6Embb1
 2spyjd9XUaTtaltehEPFKCK2D2RyGXlFoQJ8GstuLmqQfn8ICuE2owqk/4/O1bEY9lSGAbR
 d4hoy8Y97yOmV4O2WBR1fDr7n5nq+hp65D/ikjpJqCA8ev91E2qtswBp3pwezFJ57Hbj/gG
 ZJ5tvXJ2qcAuHXT8kws0w==
UI-OutboundReport: notjunk:1;M01:P0:7GVnDSBsP3E=;TnnGvsCbNy7Rd/iGJDYyqs62lJI
 79Ynb0AsZz6znPuZP/731npE2hpgH37vcTDctPn9VZesdXGOoXaUKj8ZoFRbnikOEDT+zfZG/
 ZqktUhrSRT76drdcBVyvztOVch1R5OIOxf6HVBmexce7LI/GHwKan8oHfBLmLSWaJU/WjdGnO
 ZkAEoXCMONgP5zABrSnhDsT5+HJm6ka6cWQRMWSpdrmiMcd2RjYlwLBpfekBzrfIcnjdRX4PH
 +EZUswE+zbFjamUXJO0ONZPAumaVHjG77POgsFsRY81GSOdBIDn3LSHNU9i6u7hj4KgXCyoX0
 PViQoryL2IstrAop3FGjZ65BSlMXF8jOX/KpTNJqJkvnDvZqGIucWGXvjbYRPULS7EGAjacpF
 FLDbuWyAr1VAxuXe6tyulfmZTP8pPzho2ljciEEybg1Iug3fQCsZcenIfBOb0Pak0s8JuyS9d
 qZXoPPi3dqWxPWSTmDSm4kwl1ftcS7YBwIceaQwb2b9hBLz8C0KmJPLj+xAU/WDSbaqd7kn6y
 ZyNlqG+A0nvmlXP2+Dp7xdknau743B5m7Dr3OlffgNJ6IXeqvKGfgPPM0Vl4ZCeXS1IhTBhg6
 z6IZEeKe5ioriPaTZwIZoM0f6lCUA1U74fesLrR5CVGrM+BxpEtKnJadP43GX0W5v4Qym4Qjt
 Uare/3sBI2WThd/5NWOXWsY3F9SGOb2dR4EB0aI0KEtDEj0oOlZ3UWkmy75wKzhSEufRiA87N
 lAFLOIJxbxv+b6PwKi7fJfDP5Cj6wG31WhTbaVZZVcbZVniJ31ddrXzgHS7l3qwf65BZMvXQs
 S8c1VG4+dM15wtplWWj1DEPCLf4dKI7OZCQC7+j2O+sYY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719212346; x=1719817146; i=ps.report@gmx.net;
 bh=MOSt2PkUpg5Z/oY0eqaKU/gujHv/fR2GTafuIuAxi2U=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=akC0gntcoybFURy2meQvFyXh7CBcUe6eL/fooUF+W1gq2EOU+ApHEXf52oD7LNYJ
 NQK06ZyUf0vVsAEHcoyMuPqNwJaj84K9FD3B0OS7oLNSnqYDYRnAc1opqWal0Byrs
 KNWnWaHwXlfU88rgzLs4yZ5mXBF2k7Y+VUKu0+FGkrMDIB+tB/cb7aj21q1GGdiva
 66MSJDQ44anjIVEMCe9iWAKSl16iTjc3E54FXLkc9UeggUFXCQoIYqqV2Oa5haoAs
 XniI7VvRa1WZNuVKT99437sNfyKCQTgopzLj3SEs6ZrAnyYM4Q0TClMey62WLFBKw
 NH458UI8hAsp10SWLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=akC0gntc
Subject: [Buildroot] [PATCH v1] package/hwdata: bump version to 0.383
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 92b7eaab6d..9ada55450b 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b98ef646d530d5fd3afa3180efbf7c8e22d3da0088f5836f41ee25380d87b092  hwdata-0.379.tar.gz
+sha256  97f328f85e51ea78ad14620705dba269cbbb47911e56bdd8b35360e6cdccc00c  hwdata-0.383.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 555fb58f14..8f9b4dbbb2 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.379
+HWDATA_VERSION = 0.383
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
