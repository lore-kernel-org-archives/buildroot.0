Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859CDC19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 08:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD4F540AA4;
	Thu, 11 Aug 2022 08:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD4F540AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vXf3M7aUXvyA; Thu, 11 Aug 2022 08:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03BC6402E8;
	Thu, 11 Aug 2022 08:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03BC6402E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D43C1BF85D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 08:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6043417A9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 08:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6043417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKFmGkbCr-am for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 08:47:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66BCF417A3
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66BCF417A3
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 08:47:39 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1oM3qq-0007XE-KH; Thu, 11 Aug 2022 11:47:37 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 11:47:34 +0300
Message-Id: <20220811084734.1620010-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD999D8F08CF16C6CA7C9CEC6E4C4E60C3E7D2DE53433FB520900894C459B0CD1B92DC6CEE588E3ADD3A5498E632D6BB2E18D50EBB1FB29A7D8BD00B114EC3005A8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77BF46084C0059042EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D08E1E5B2BD3D3B78638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D851DA0DDE8C3D9E6D5FD7547FABC271576F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE71AE4D56B06699BBC9FA2833FD35BB23D9E625A9149C048EE0AC5B80A05675ACD6FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B5FC25ED3FCEC3375A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C837C4FEFBD186071C4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C41E93BD56E7067354307CAA32FF218580205367B2BCC23E5B25E13A71C679B22CE7E65F06B2D3BF1CAD91A466A1DEF99B6ED91DBE5ABE359A3485EE9140A7D39DEC7A4B9C63C612FF360583C7422455C3F1055A48C272B030457EE4B4996FC546C6CDE5D1141D2B1C55B83B7585D69F4B7A2029C551FA8E32125FD5078010E403AD91A466A1DEF99B296C473AB1E1421878B0D43A06A4C936638A446BE3E5C627BF0CFE790FC11A72BA7CCD254A1CF5E8C19A449F2BED0899410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34CA9B3B5DE5D383E69719BFF8AAF05895F595B7B475F1538CEB9116D453B3FCCDA5CFC8787A48F8BD1D7E09C32AA3244CF54CC81D2C8E63E8C72A819A62E57B513A92A9747B6CC886729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojfXJM3siCnClFWn/wFUeIww==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284EC6B1564A9BAE3494CC8F7E69BD945A7D98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=9qVuSIJnUS++4xDndMptSt3PYhNhUFiqNVliB0gyLAI=; 
 t=1660207659;x=1660297659; 
 b=gFAn90JCl/K/hVkcm4XPDl+kDf2nF+RXuHKxdEoX3Yp92A//lPElI52yy+jwReQ7xyLUU7xfVLD78H+iDaA/oIO8yGgLKUnXwJM4Rh2mHjNQPIvHnt93upw6IV3ysgLR4zNcRg/oByAb1UcdnNKB+XexuB4ZaTtrZn+ejJbhWs9veTg9hY9QnGeQcR3rGt8p2G7V16i+E96laazWI7QopJA6vy+GjjZbXzRiAXRdwqtdcnZTFlpt6Xg3ieb7KMTAbd8EzzD/kEDowCyhP0KA95VuY8ce7YaV+9+jOlWjhKoTE+tHMVLQTrPVRG2OxuER7yv6UKlHWPeCn4nDk5u41w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=gFAn90JC
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.2.2
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

https://git.osgeo.org/gitea/postgis/postgis/src/tag/3.2.2/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/postgis/postgis.hash | 2 +-
 package/postgis/postgis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.hash b/package/postgis/postgis.hash
index 018e6523f3..9569ca71dd 100644
--- a/package/postgis/postgis.hash
+++ b/package/postgis/postgis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fbab68dde6ca3934b24ba08c8ab0cff2594f57f93deab41a15c82ae1bb69893e  postgis-3.2.1.tar.gz
+sha256  18cf3d013f45b1aa8ed59d78bc707e9e125e250d8f0615396ae9bfe3dd7c3d7c  postgis-3.2.2.tar.gz
 sha256  55b69f22e1752830dd565852dc7ff242daf289dbd3a6bfede5db43f90d2e28c9  LICENSE.TXT
diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 1b5a7bc3ad..e6ea52bf7a 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGIS_VERSION = 3.2.1
+POSTGIS_VERSION = 3.2.2
 POSTGIS_SITE = https://download.osgeo.org/postgis/source
 # parallel build issues
 POSTGIS_MAKE = $(MAKE1)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
