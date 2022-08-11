Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B9BC19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 08:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5CC04020B;
	Thu, 11 Aug 2022 08:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5CC04020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aoqi4i_8GDoy; Thu, 11 Aug 2022 08:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D861B4025F;
	Thu, 11 Aug 2022 08:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D861B4025F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 874471BF85D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 08:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56BEA60AB2
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 08:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56BEA60AB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hpl0yEwD0zUP for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 08:53:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8667608F5
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8667608F5
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 08:53:28 +0000 (UTC)
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1oM3wU-00077H-71; Thu, 11 Aug 2022 11:53:26 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 11:53:21 +0300
Message-Id: <20220811085321.1644156-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD999D8F08CF16C6CA73690FBA0B7D74E7E436A8D667CF9FF2800894C459B0CD1B96A1D89D6B19D3E2DFB116F3A158B422CC75206CFFF958D0D012184F85FB44711
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E9C30BC00893CB9AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637BFD6B3F1638522B88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D86C3DDF07CED9F15061614FCA596AF8CC6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78A0F7C24A37A3D769FA2833FD35BB23D9E625A9149C048EE9647ADFADE5905B1C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B47272755C61AA17BA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C837C4FEFBD186071C4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C41E93BD56E7067354307CAA32FF218580205367B2BCC23E5BA121F24FC5A8CFC0E7E65F06B2D3BF1CAD91A466A1DEF99B6ED91DBE5ABE359A3485EE9140A7D39D976169AB2023FA38360583C7422455C3F1055A48C272B03013BDA61BF53F5E1DC6CDE5D1141D2B1CD2ACD226F2831DEFB8A2E6ECB3874B023FB726932CE69555AD91A466A1DEF99B296C473AB1E1421878B0D43A06A4C936638A446BE3E5C627BF0CFE790FC11A72BA7CCD254A1CF5E86CC74F0925D5E26B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34D6AC337C1E637B8A98A4099816BE9416203204E37BC03845C246AEFBD04FFC870AADB48C11BD64A11D7E09C32AA3244C522112BE543AB3CE1B66637D0C05F6E633C9DC155518937F729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojfXJM3siCnCk0/DgdQNNkEA==
X-Mailru-Sender: 689FA8AB762F7393CC2E0F076E87284E2A499E3F3EF773E7DF709C7CF67BB59198CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=QMtOIzvrz1v+PrTA9mIwKwNOO78mHbKLypxWBgsKq2k=; 
 t=1660208009;x=1660298009; 
 b=ZqeZZ/A2K0oZy8wLLW7T/OLUSRa/fFQHxTE63bjFUGI3Iy9AVg/r8P7JSCmsriSP/C+Wi8WTW3BaEZx6aiMFkkBQYBURwanviFnxOoGNZNsvQYar7sI01NrULX83aiB4eurcLbJPY8WuIwZ+7qCoN0O0rpO5mfdYI7MFomDyliCaYV6d/D2Di/5bKBOpI7x8wW2D4s4mCN7H6wHEePevSzuuX+9qcfYrKnuadbac1vnGoGqY2Z5VhPho2jI2+7YrLsq0/pzE3kJ9SYX/wU/BT7lCWFKeYvZg5ub9yvZDApS5L6cubTj07jL81m6bJxclAgRVXoHWV+WPzRjaVa6LqA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=ZqeZZ/A2
X-Mailman-Original-Authentication-Results: smtpng1.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.7.2
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

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.7.2

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 6a9d7b2379..281e30dd3a 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9b30952da1186733f144c1ec3aa0c6332379207e5035e81037bd34e1ec9cefb3  timescaledb-2.7.0.tar.gz
+sha256  05560e0c37f702a377957adf96d8893c1ff437a8b4fd1478f351e40ba9730897  timescaledb-2.7.2.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index dce9ea031d..0268712399 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.7.0
+TIMESCALEDB_VERSION = 2.7.2
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
