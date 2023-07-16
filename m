Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95FDEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 13:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3E1C4090D;
	Sun, 16 Jul 2023 13:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3E1C4090D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCJ5yyyRJZGn; Sun, 16 Jul 2023 13:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB98540908;
	Sun, 16 Jul 2023 13:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB98540908
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4631E1BF279
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 13:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C67F60812
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 13:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C67F60812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDUOpyEdBCfg for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 13:56:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ECBF605B3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3ECBF605B3
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 13:56:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 462D5A4C00B8;
 Sun, 16 Jul 2023 15:55:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50368)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qL2EA-00040o-03;
 Sun, 16 Jul 2023 15:55:58 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 15:55:57 +0200
Message-Id: <20230716135557.4180899-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689515758;
 bh=iNw5mUalTJXBtZ/xOID4P6li50vrDmnjW66zwiQmM/4=;
 h=From:To:Cc:Subject:Date:From;
 b=Z4xqlzplIfjf/Nh3ezitFH4G03OAeIHKHscc0m9RFJXpwVyF50UDEJBFd3MoYpQqh
 A4G/MlD2qrNfLJueu4IQ1y3+fVzQeg0+zZ1AhpvyPXwTpGaV+Hy+r/STvQ1DCPjrDa
 SNF/0yR+J/0IQXstB13fbxV4aLPvKJtbTLWTfM9fZ6isNJOxEnAsRVIryNvuuRM/kL
 3U754wwpVYn6I635APdt1+Jl6IgC7JaKmWAH42VseoaBCfc7FSEM+5qBbkbtndnE1m
 eKv7UNzLgFJ2AXSvarlVnlpy2UVFJiSe1VLe5yicsFtjZZ9C7iawJDqY8LeYCk4FB5
 ODiyDr8dwhYrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Z4xqlzpl
Subject: [Buildroot] [PATCH 1/1] package/supertuxkart: fix build with
 bluetooth enabled
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The wiiuse code force an out-of-tree build:
https://github.com/supertuxkart/stk-code/blob/master/lib/wiiuse/cmake/cmake-4.0.0-modules/RequireOutOfSourceBuild.cmake#L41

Fixes a build error not yet caught by the autobuilders:

-- Configuring WiiUse version 0.15.5
CMake Error at lib/wiiuse/cmake/cmake-4.0.0-modules/RequireOutOfSourceBuild.cmake:41 (message):
  You must set a binary directory that is different from your source
  directory.  You might consider

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/supertuxkart/supertuxkart.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 1f9ad4102b..6bdd512eac 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -44,6 +44,7 @@ SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF \
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 SUPERTUXKART_DEPENDENCIES += bluez5_utils
 SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=ON -DUSE_SYSTEM_WIIUSE=ON
+SUPERTUXKART_SUPPORTS_IN_SOURCE_BUILD = NO
 else
 # Wiimote support relies on bluez5.
 SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
