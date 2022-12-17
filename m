Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7216C4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 05:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 564EC40535;
	Sat, 17 Dec 2022 05:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 564EC40535
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wOZFN8mShwW; Sat, 17 Dec 2022 05:30:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BDEF4017B;
	Sat, 17 Dec 2022 05:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BDEF4017B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 821251BF38B
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D1F560BF2
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 05:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D1F560BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1dd6LNeVPazW for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 05:30:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D52C060BDB
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D52C060BDB
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 05:30:38 +0000 (UTC)
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1p6PmN-0007w0-Tx; Sat, 17 Dec 2022 08:30:36 +0300
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 08:30:34 +0300
Message-Id: <20221217053034.11752-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD90D1502B3BE350FE420345CBC5A180DD43DEA314B30AECAB400894C459B0CD1B979FF2DDF1BF591879C5569F04FCF763B47167CE9FF9CB41F1310F8E5CB569241
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77FAFB841CE9024F9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376473F174BDE74BA48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D875652E73301434A3886DB1CAF0B006D96F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FE5D25F19253116ADD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B972D20C7389F068BA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB24F08513AFFAC7943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5B7E5E5D510D5324F218FEEB4155666E32FE1AEF48441948D4EAF44D9B582CE87C8A4C02DF684249C2E763F503762DF508DC63EAE0DBA7CFC
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3473457D764E1CDE777EB4BB1A8539BC88B0E0A4046090A6782A9D3CCA4231708520ECE8A97CE77FF51D7E09C32AA3244C0ECDED4A02236352F6B17F2B401A69E8F26BFA4C8A6946B8729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqUfYwWCey2J+dGp4je1Qtw==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF502C9058E05BB0FFE9C5A485DEB50828C98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=kIQXJqCtydsCh8ObdjVnoKvq0ZKibmXfyde+HD9Kyw8=; 
 t=1671255038;x=1671345038; 
 b=vBdw5vcj2NjhcaGz/CoDoL3qRa1V2jHWvsIjsXNs4y2bZYZ90OsYtpEMzAPe2WzgZEhNwSk+IyXarU+6MG55QrTreowhKuAFuQ6rMZgIVB2exzKcSG5SMvuOLbDdz8Qhz1Q4HB0Ag+YXKLVAsmsspziX7/zrENgoygjL6xcvlEqtyFou6MC4f/J5cfuZucMVmWK+j+3oKEmna8AW+6IJofsRvMoSSY7re9VTgZwb8k+b2MNgq0XiaydZ7x6dCKFBWdrrUlHqCqsMzjnIU9lMoS9DNaAGyVFwBb+DReZdwOCicRG3ELOPM/KwQaYn8uThrdhxBUgC5cURRv4WRUgmVg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=vBdw5vcj
X-Mailman-Original-Authentication-Results: smtpng3.m.smailru.net; auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.9.0
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/timescale/timescaledb/blob/2.9.0/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index f546b17d0a..a970ffa1ad 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  22a057c4472d23bf08778932e391f38f350ef0307cf99fb8e279c8245667d3e9  timescaledb-2.8.1.tar.gz
+sha256  666f5427cb036500bca731d24d845285299cff82f576ad4474f85da682b2ee78  timescaledb-2.9.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 659d07bd0c..7530368498 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.8.1
+TIMESCALEDB_VERSION = 2.9.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
