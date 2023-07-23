Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DE5C001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 17:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7909660BBD;
	Sun, 23 Jul 2023 17:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7909660BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9_tciLj5cZT; Sun, 23 Jul 2023 17:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2BD660899;
	Sun, 23 Jul 2023 17:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2BD660899
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 008481BF345
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3C440995
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD3C440995
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkFnPMal7lka for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 17:03:43 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EED340994
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 17:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EED340994
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D9578A4C045F
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 19:03:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47370)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qNcUc-0006ob-2B
 for buildroot@buildroot.org; Sun, 23 Jul 2023 19:03:38 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 19:03:38 +0200
Message-Id: <20230723170338.833265-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690131818;
 bh=gvM2wvcvTHPjG16j77ezvoNA8neK6iOm1Zq8JvN04uM=;
 h=From:To:Subject:Date:From;
 b=gwPY9Lg+kIyiq1FgrxVUiDiRuCCaJ9B/j3J6VuUUL2Xx9MRlZ1J5vao8rSQ9q58ej
 mRsUDGzHI/n3TWr4oXOz9f3vyzlwoFmk3PE2iIAwsds2qtmjXEq6EUWoz1+s6Y4rwA
 5TVeoNA4O+uygKaEzjINpZh9ZVNVy9syBX8+58OC0Nmge12vrh5/LoWFpwtUHEf7Qz
 EDLg4qpoaqSivs1K/ZsJVazJ+n9jesYodJg5Sx1VMQa0O6iTwp+vAIDneclv2PIet+
 g0pKVTQbqp7jQwj/C9Eo4vNhfePfg/e4WEfgnegWNISQ6b/VqEL7Cw68+YSzdgFzFm
 Dh0L5Gbwh+22Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=gwPY9Lg+
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Bernd Kuhls from pixman
 & vnstat
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
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0ff2dde38e..a7600e8fd5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -447,7 +447,6 @@ F:	package/perl-timedate/
 F:	package/perl-uri/
 F:	package/perl-www-robotrules/
 F:	package/php/
-F:	package/pixman/
 F:	package/pngquant/
 F:	package/pppd/
 F:	package/privoxy/
@@ -479,7 +478,6 @@ F:	package/transmission/
 F:	package/tvheadend/
 F:	package/unixodbc/
 F:	package/vlc/
-F:	package/vnstat/
 F:	package/wget/
 F:	package/wireless-regdb/
 F:	package/wireless_tools/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
