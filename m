Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE67CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 19:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 101B5409C5;
	Mon,  8 Sep 2025 19:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uai_bQnkkzAU; Mon,  8 Sep 2025 19:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 085BE409B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085BE409B3;
	Mon,  8 Sep 2025 19:24:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4706234
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5E1760B62
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGcvd35plYSY for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 19:24:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14AE660B66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14AE660B66
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14AE660B66
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 19:24:38 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id vhTgurtBI6z5ZvhTgunOaA; Mon, 08 Sep 2025 21:24:36 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  8 Sep 2025 21:24:31 +0200
Message-ID: <20250908192435.214306-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
References: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfE0HR1ihY2NquXSLp/W0DFklDZ1XolNnbg1Euj/K/qJRaSp/zsczjHGNqVr2eb5JSwGfp4K6caE3fL0u6qRDbsdCMGuUS9IP4lNRHhpCQH4MnE5rcOS8
 LQbcToPu7VlrrIQoKesw01BDC6ZE4FGg1p10UcXRVrGC7Yk0QRSNvq3jmzhN+ien0N4MABwY8GsdMt7VGnlVp0OrcwkxqvlwWR4OUcl8Mp5Nag02ztlb/H/u
 t2VablxNv5X2zSeJxWrJWTEmJMXu+pMp5j4Dkxw/zRlPaCZpb+jXIC7w8xoZ/wmQcNMCQgfdXgqdfGB8fze7zOgmAJKOOXbFewFnc5itZRUUThERql0FaW9y
 ueOeiqqnUhS6bm5vunUswPvDuJjdluEZ5VJJCFEa+8kUtD7BrKti7r1d84UysvyD9cHtfJwT
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1757359476; bh=ME0IWSVZciSp54TUDiLMyLgV/2rhIHUQpp0m28k0Bh4=;
 h=From:To:Subject:Date:MIME-Version;
 b=DxR0ZN9QF1b4KhzGN6/AItgHp0B17IJV6ksMLWl4J9J3zK/FdexG/l5gyU9XbIQwA
 uBoQwKO7lpAC3WiyqS+0KsNQ5GUgPj2S2CTH98N+ofPTPUc2tW4PYSc2xZHbMAdwz9
 EVaGQ2ZtKPKKROerHktZDyCq1anZ2TeRDSNQazJcB45Y7FxNc7JlnOiX0Hv10HI980
 ZG5T4NhAm5kx+jyS2oWO4WobtZHskKJYEAIeaV9fmjvGLyVfPu13Xr5K/O8t4s7no6
 IOUtfjPEjhJPsbEs6TsvVLXtkQNMx1HIWZvfwwj/axXKu1UQKjklNk48kyba5xov5/
 e+oIlUr8OqFag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DxR0ZN9Q
Subject: [Buildroot] [PATCH] package/rtl8723bu: bump to 2025-09-08 version
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

This version allows to build with Linux 6.16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index c0216dd1eb..39d2202d6e 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  e50ce66539a5216b91460b8278606874040f3c21ce8afbe1f5e84595dafa6868  rtl8723bu-523cb38e4c62bb181d6b95024884e938835cf8cf.tar.gz
+sha256  f0d5fecf6f8fd9668d46c462d0cdb13d5cb91ecc383123989812f3d50ff28e65  rtl8723bu-89b6e527ad6bbae19caa6781ebac849b927d87db.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index d9719a2cad..92fd93ccd2 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 523cb38e4c62bb181d6b95024884e938835cf8cf
+RTL8723BU_VERSION = 89b6e527ad6bbae19caa6781ebac849b927d87db
 RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
