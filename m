Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C240DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 10:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 483D440362;
	Mon, 22 Nov 2021 10:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVDdvuA6Oq8H; Mon, 22 Nov 2021 10:16:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6AF540357;
	Mon, 22 Nov 2021 10:16:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A35B1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 10:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2954B40357
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 10:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GdG1oacCCTLl for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 10:16:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpng3.i.mail.ru (smtpng3.i.mail.ru [94.100.177.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDE57402DD
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 10:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=O/YR4RbEeeqJgvnRcH7xUmQ44ojDIyoQetuSdXVGf5g=; 
 t=1637576203;x=1638181603; 
 b=IRzHXv5+Hm5CqpuKC02zVS2iE+0s5lvqsEM9OF0rDnFL8RRR+5CJ+o+T7iqqlDIYxEz2ejt9U+TXejX2RR+XAMjLUsezlX9HujXDbywq50oE92fOUmIHYLZ8eUmA1Q/w/UEOfwPHGYwIckw8BI1ogsLGAPbkPEV+4D5s5aBMLyEjfENQvq5Ps9UNmjsNafOzPyHhGHkQE2CqGfvBMkEHWEuB0Cx7U8nOu1we2scl2xOYkBgPLDy1EFW0Cch/jizE/MJVumS0/Ido5wv0chcIcYn4Xl/0Xtx91zIL6I/mTRJfJXS8NAZEnbExDFojbUHXnXV+YLc7NvQ6mljhw7MHAw==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1mp6NL-0006em-J1; Mon, 22 Nov 2021 13:16:39 +0300
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 13:16:33 +0300
Message-Id: <20211122101633.814059-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru
 smtp.mailfrom=fido_max@inbox.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9FE0487E50246814620C6330E291889C6CBB3D68DBF0DE0F2182A05F538085040094D3B0EE234E8DBC557036E78ECF37E7D9EEBEBF461B81C110936CF7A410949
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7963A96EF19BF462AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063770519A3AF4A224F58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C32ADC74DCAF53F0A395A0F88B5231D66F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74796267E12EBBF229FA2833FD35BB23D9E625A9149C048EE26055571C92BF10F6FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B1BE95B8C87527B4BA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE31A2885C41F97C443847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CC559E5F89E84DC5596EDA97FE84257F6C781B5764E607D2D9C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D1B2EFE7B39F7738393EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C2E47CA9A5606090A7CCE4910621890AB6E33AA6C420BE08D4D496DE438FC19A3DDAF10DC4EE8A481D7E09C32AA3244CDA03F618D9B0FF22FFC13960F4A95AF333C9DC155518937F729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojp2KOOpFlmzeHyCu5OmHOeg==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5D9D39EEA2A224C8C4ADB877E6432AE4D898CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888E0D4ABDE8C577C2ED
X-Mras: Ok
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.10.1
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

Changelog: https://github.com/libgeos/geos/blob/3.10.1/NEWS

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/libgeos/libgeos.hash | 2 +-
 package/libgeos/libgeos.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 3508ba9077..d2c27955ac 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e630507dcac9dc07565d249a26f06a15c9f5b0c52dd29129a0e3d381d7e382a  geos-3.9.1.tar.bz2
+sha256  a8148eec9636814c8ab0f8f5266ce6f9b914ed65b0d083fc43bb0bbb01f83648  geos-3.10.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 097ad54d03..745eb32256 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.9.1
+LIBGEOS_VERSION = 3.10.1
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
