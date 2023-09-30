Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5338BE77354
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 05:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B89F14020B;
	Sat, 30 Sep 2023 05:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B89F14020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z65A49caglti; Sat, 30 Sep 2023 05:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 147344051C;
	Sat, 30 Sep 2023 05:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 147344051C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B54E1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 05:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF75F42E8D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 05:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF75F42E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 855f2VlI8eIZ for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 05:43:27 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A80D42E81
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 05:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A80D42E81
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([178.115.66.189]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MvbG2-1rbXTj17Re-00sgzr; Sat, 30 Sep 2023 07:43:21 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 07:42:52 +0200
Message-ID: <20230930054253.486201-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:jvAf8K6QwfsuWwi83948fan9UYyWGe8rLdd4ogC+tKWJJfkX1Kx
 lMTWLtVxmALjaeL3JI1A7zguAc25q8hU7KxztNiSCIdZ06BW8NEqwC8u9AEhpnQDwRq+AvK
 IfomHJ+Oj3teiBdx0dgyzFINMfxtg3aNvTj3j0a1wuLY3LObBFTfe8HSAquBlCuzwg6wDwl
 zHVO5zweVaNnH25Qdbi8A==
UI-OutboundReport: notjunk:1;M01:P0:MOEJ0L82kVA=;SzX9bnx3cPXRltkr6hM2ME1J1Fc
 QMSWUrczPgTbxQsB6ZT4kFimP5bPySyZJMM30tFeVrqwwkPKt6ItdRW9dbAovjfhf6AElKt2C
 NN/GDUtpfaGoPqYCseFs7yeqOlek1gFo+Fg7OBeM+PE5U2DtKLoSAgGNvXs0ib2XVYj1wZdrV
 /rFshLATu5odiWQD9ec1Rc60TuSq7TqFK5cU9DMh+pRJmoaw6j/EYtED14q8qujjTyoOmF0oX
 Jsw9enIYGbwQh0aS3prrTbnJ2eRxPPBLi0krfyjCVPKvWUMAUBkVJxgeiUpDgmxfXqOettyhz
 5xLN43OeKzOCWvMB72QvhLo+sFVfziYM9lFtz+8H8VF+NjYhDT28gx416tk/JPhH9Bc0LIBPv
 yeuGFDGg0tAMS2uEYbK0LT4Rqg8/6E/hgtbV39fqUlOReQ9GfifqcjicgUVMeLznIzzog6MkI
 iOCtUne9D3A61MVF2wbM6WRk3NmkzJhqX6rbmKSD1mJmnziXBZNn2LAOEnvQBHJMZiXdV4oyO
 1NyWaBUcxMKmEkHGDs7JPqksxqL3lCog03rLrrQw6oA5g3o1TC8AV0glnwKRMHPxY5udDuwUf
 W32wnjFDW7Ob5CM15tT1/ryl3G9VCtcNPYkYaDRAtoXy89uRx2TsYWn8kKHRpmadI6j8GI7U8
 vQ5MruTJQxRi8odOIH6AinVX0jR6iTy6/bmGnBfPnNaV/gMoGfUCh3pdRbSB6imGxgw1fCKaY
 aYdoYtrwFboC7UAQ4Pcli73nBgMaNNglK4EZDC7o/Z/48bH3lFwOxyzmuAgEvJY2jIE60sieG
 q6HaQbvl8eHSzHw/2jeuxf51B58P+pti1rHlYCx68x9g0VsixNqNoOiOvjrmvN7NpQG/seDaz
 Xu7PwR7kKc1CZPG0koGixoW0GG1S1selYcHXqzrS7lMctFzMp4UlYPiiOY0FIQXl7GlllSkEL
 ysmlzBU8gTHOPH76tVrS3EZM9Rg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1696052601; x=1696657401; i=dalang@gmx.at;
 bh=iG7q+BPoDVeSjPofVhyXIVKhB2jLmdRNSOTt3m2YN0k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=eICRrgoGdacY/mzjKea1qKh05wu0DSqkqvGCKXH4+bstQjHiU9pnCTW46QQToM/oFLjKcHfrfEW
 Red+PQXhJUehjeniWmpCnOz38bkNsLityGdm1xSCoGBa5C4qmZmcIYLyHWx9Q5JKSc+U6gSr5aKMX
 a5lbDyej5U5QYDqlsbTQJp9zS0/f6qNapnvb0sW0jGS0+yYgxJ0PlJIQtXhF20DWkviUyxSLztu6U
 ncNQ/bZ42Lz9HEaH/5MJHc0FvKdyLgSFuCGJ0jTEWnkOP3GqWJVTe0KA0G7VNy1UJyTiSsEARD7fb
 OUppYOiG7Dmx2vIOaPRP6NRIFcGLGeHO6GoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=eICRrgoG
Subject: [Buildroot] [PATCH] package/gtkmm3: bump to version 3.24.8
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
Cc: James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.8/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/gtkmm3/gtkmm3.hash | 4 ++--
 package/gtkmm3/gtkmm3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gtkmm3/gtkmm3.hash b/package/gtkmm3/gtkmm3.hash
index c54862de67..9bfd68e027 100644
--- a/package/gtkmm3/gtkmm3.hash
+++ b/package/gtkmm3/gtkmm3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.7.sha256sum
-sha256  1d7a35af9c5ceccacb244ee3c2deb9b245720d8510ac5c7e6f4b6f9947e6789c  gtkmm-3.24.7.tar.xz
+# From https://download.gnome.org/sources/gtkmm/3.24/gtkmm-3.24.8.sha256sum
+sha256  d2940c64922e5b958554b23d4c41d1839ea9e43e0d2e5b3819cfb46824a098c4  gtkmm-3.24.8.tar.xz
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
index f5a2fee6b9..f4fc54849c 100644
--- a/package/gtkmm3/gtkmm3.mk
+++ b/package/gtkmm3/gtkmm3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GTKMM3_VERSION_MAJOR = 3.24
-GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).7
+GTKMM3_VERSION = $(GTKMM3_VERSION_MAJOR).8
 GTKMM3_SOURCE = gtkmm-$(GTKMM3_VERSION).tar.xz
 GTKMM3_SITE = https://download.gnome.org/sources/gtkmm/$(GTKMM3_VERSION_MAJOR)
 GTKMM3_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
