Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9E8C7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 12:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC74860FE0;
	Sun, 19 Mar 2023 12:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC74860FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8HkRj4WtHeM; Sun, 19 Mar 2023 12:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBADC60FD3;
	Sun, 19 Mar 2023 12:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBADC60FD3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D78DB1BF5A2
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 12:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD58640176
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 12:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD58640176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HcTpTL6Uzq3K for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 12:24:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D399740396
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D399740396
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 12:24:08 +0000 (UTC)
Received: from localhost.localdomain ([146.241.96.213])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dry8pQfQR9J5Hdry9pXwyU; Sun, 19 Mar 2023 13:17:01 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 13:16:59 +0100
Message-Id: <20230319121659.88039-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230319121659.88039-1-giulio.benetti@benettiengineering.com>
References: <20230319121659.88039-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKYdhobOo5PtnH3oFzs7x3BGaHhiHaS1ewLaUP7b2G/gbariXLpjMLbZaazFaxS87EFBAlVjPlliXD7zME549hQXbc+VlfK/l9nAVBhbTgeH8ZVG5xPe
 /IdXfSGhHzhGQVYK2qWk3NLofoYXtsnvkSfBSRHk357vY8TAL1SoUUIsYus5D65W+Pqx5PCmqOaKBXTDZP/agjiGFzI+sDtVJFQkXtI57DsY7/VD/5SnOmWc
 bo9d/yH7zLPtd+AeWGgLhBYZojRHqLsR67npjeonfrcWIoTq8P2O27R3ZE+FhdNoBYWUsZLgUnX4Ese2A+FpGxzEcUlDC3w7MW+xGxA89Y+LFUlL8+Lbdq7r
 1YOT5z56BE0b6fkmRApzryv16y1TW/ewx+ubsjwcpXWH8W9b9hA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679228221; bh=7UgIxikr46ihTR3Kcq5ggU85fFrsyL6NI0VpM0dWPt0=;
 h=From:To:Subject:Date:MIME-Version;
 b=YWrjz40oafj2UOQJILunhhLhkqjhMZGy+HEZExcV9ae80DYpFbtp3r8sHcOoJTFV/
 aaQ9jwchY/emAdq6MBqRWQutY0NF4somWHdfGYVqPo/7CN7ztkW8Jee60f8MLVeJKT
 X4UsB+sZLzy/dn/9qh+bK3+T/PZFjKSoRZgOG/d3vUDJdK8epN/M1lwuV40fOkj5Ml
 r75s9C2Wgo4YcWmhgGQf+tgXQHUgiErliFFrCSnhTMolmafPmSZNl6KZFPAtxWg0pi
 cGEXMCcDkBQ61jaYesH8uiL9tsoErSf6X1R0iAjH4TASUBDy72CUt+mbweF3n5rBVq
 pM86e/QaiOW2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YWrjz40o
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to version 2023-03-13
 on branch rtl8189fs
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Indrek Kruusa <indrek.kruusa@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rtl8189fs branch is specific for rtl8189fs controller and diverged from
master so let's switch branch from master to rtl8189s to fix runtime
failure.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 4f117cfd14..018e5b8a77 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  96347dbfedd95a217fb89b7b295fe417b711dbad3db896ef0c2fa733c6d150fd  rtl8189fs-e58bd86c9d9408c648b1246a0dd76b16856ec172.tar.gz
+sha256  20382dbb1ac33425e6b3198cc9be269b79cd1423ea656e0ccd16dedafa3e2a2a  rtl8189fs-ed6741b52bc998875298117b55d18b0d557c37a6.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 15a5329a45..2dd9e6097c 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = e58bd86c9d9408c648b1246a0dd76b16856ec172
+RTL8189FS_VERSION = ed6741b52bc998875298117b55d18b0d557c37a6
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
