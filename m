Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931BFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 05:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2965660ADB;
	Sat, 17 Dec 2022 05:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2965660ADB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GRoR5szyQiXq; Sat, 17 Dec 2022 05:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7167A60C06;
	Sat, 17 Dec 2022 05:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7167A60C06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E98C51BF38B
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CE888176D
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CE888176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id okTobaLBnOmX for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 05:40:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64AE781DFE
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64AE781DFE
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 05:40:04 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1p6PvV-0005FR-MJ; Sat, 17 Dec 2022 08:40:02 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 08:39:58 +0300
Message-Id: <20221217053958.34337-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD90D1502B3BE350FE420345CBC5A180DD43DEA314B30AECAB400894C459B0CD1B95AEB44AA9B28109E343046A12F34B39F47167CE9FF9CB41F2F5D89ECF26BB078
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74E2C4641A2CB07F2EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378B6D775AC58C227F8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8143AC467975E110537C4918E65389F436F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A4F00A9E8C511CEB9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751F618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B6BA66BB79834B351A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB24F08513AFFAC7943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5544192086EF7013777EEA320BC5F69AB2DBC93D4A23A1F6F4EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF50F2237FE565727C05
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C1D376EF32BB0896B5C1511F97D4EBF49706DA1D54FD7AEF7EC9CAC5B11E14DBAEF613EE03C8DF861D7E09C32AA3244C78576D7E80EDB21DC11078584178D5EEB4DF56057A86259F729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqUfYwWCey2LNOjddN2gaHA==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF597FAABBDD6ABED49678C3E0328C472DE98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=wFvi6G4HTUdEFv3Wf11U6QqbJWVXmzD2oCcWq2jJyJg=; 
 t=1671255604;x=1671345604; 
 b=bxGQSlAUthuv8boOcdqeVBQy5Qy5DyrRkJ4x8qzufq24SFw8zhouV4T+Ec6fjyqF4KV8Xyh+q3XpkwRJ2roNBBx4k2Wagjsc+c0eMWj9bRtgZ0tXOJB5nj6TU5c8YZo9Y7+3aW/feqeSUf4uhJ5fLeyDpe+BhC2hubZxnh76oqiLGh3sNeUfTseaSs4ilWrVPTa5dVH1HCxVGkeD8uYm3KbXyvdl0Edy3MQ/j++weKxd7qLf/UQucXFWzkDx5d1OpULC8Aizb4n6xgT59EF8vUzTkykGSxfVJ9ePnMW2nTSygLMTXZ9QcUGXdv76NGYPeIsZtvOZc+V7I7PC/xoBIA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=bxGQSlAU
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.11.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/libgeos/geos/releases/tag/3.11.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 34b2b855d6..cd0a4e0330 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  79ab8cabf4aa8604d161557b52e3e4d84575acdc0d08cb09ab3f7aaefa4d858a  geos-3.11.0.tar.bz2
+sha256  6d0eb3cfa9f92d947731cc75f1750356b3bdfc07ea020553daf6af1c768e0be2  geos-3.11.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 55c975eb4a..c6d470dc97 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.11.0
+LIBGEOS_VERSION = 3.11.1
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
