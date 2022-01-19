Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E455C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 22:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D139C40204;
	Wed, 19 Jan 2022 22:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jZ3bDCUZKlO; Wed, 19 Jan 2022 22:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D04A4401A1;
	Wed, 19 Jan 2022 22:37:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA561BF3FF
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 22:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A8A3401A1
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 22:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzOLTlOqUvz2 for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 22:37:28 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEC10400A4
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 22:37:27 +0000 (UTC)
Received: from calakmul.fritz.box ([151.61.70.64]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.17.189]) with ESMTPA (Nemesis) id
 1MEFjJ-1n2vVB1bN7-00AI3e; Wed, 19 Jan 2022 23:32:20 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 23:32:08 +0100
Message-Id: <20220119223208.1196891-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:9d8MGcMp4BY5hR0z0GODGJXZpl3iL0pmrS87mSJFUcFVak5pth8
 b1OQWLl2Yb/cEuIHuYa+ZCLcP5XR/3cVBJM22yIl2rwgtDRWhb530F+qac/fJXHjCzyaeAE
 vbPWF2E8wTDCJoDN/bXsyEpi6bAE9bYTxWJKvftS3wY310F2lSRQUJS4s/k0YrpPXXTzWbN
 zlgdQjW4jM4DOxa036uYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1zA637039uk=:lKOPoAGUmLZOL3C0mAIryK
 1WUxNR75OqTK4Y2obwETDMnSk86n3aV3Tvu7tnxmj0ujrA5RpAmrOhoYfyH6ebdUvTX3DN6Tt
 Jj3hsZLbs2Nh8rE+d1MtZs1gmYw7JA9VDe8YXhLUWbTaCcB7wg0GokyA+yHUrPV/leQPgE7AX
 XTcrUAICLLET2Ez4Oq1TFie3Nf1I1prrOw6WjQLF1WNvoCKp93lSN6Bhz1q+m9Gu6vXiudxrc
 YDa3kYffX3/BFX6CiQDK2poXgfMsqwpUlbSA+UqOmixoO3g0UlbAzOHwBoigF/o+LkOWVkbip
 ZLTx6yDrzmwvDLy/oQlPzzDaEgjufgk0dr6A0MGBbpQMIF0inDBHlYaa3xD8HB+OoGxebIFam
 NgxgdpmMLTwk5DzUxZDDOguWTDUnGSELiFonL2prELxs8XZN7Ala37OXFOP6HUFql9Sf6rY4u
 vpxpoLFb8S8w3+FLYF9MJ2fL9zOqav+BggjTsaEALfIAb20TV11zlNJjvst7+FDS2YjHpLu0Y
 rRNj72yfK+ai4sV7N9DH9ZjkLLElInGb8vNrT32Orq5N96dp8YelH4l01FJgTMHt6CdA32wCo
 oZ17qSIIVEBzkpecqzp5rQvmlPVFiTugtEPdS+/nwOUdZOXb195RmPx4EHpcuIxWthiaKJ0Bp
 WmGHfGKPvYJP4CHQhaSobITGdyCvJwxtB9GCL/XFf028gkr5HBZ61Bp1EEI/PYqmIOeIETO9a
 z4AvJANWYzhF4a7N
Subject: [Buildroot] [PATCH 1/1] package/libunistring: bump version to 1.0
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
Cc: Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update indentation in hash file (two spaces)

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/libunistring/libunistring.hash | 6 +++---
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index 2e4595b17d..145c8c3e54 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz.sig
-sha256	eb8fb2c3e4b6e2d336608377050892b54c3c983b646c561836550863003c05d7	libunistring-0.9.10.tar.xz
+sha256	5bab55b49f75d77ed26b257997e919b693f29fd4a1bc22e0e6e024c246c72741  libunistring-1.0.tar.xz
 # Locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
-sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LIB
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 1ed7ecf906..a69eacd676 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 0.9.10
+LIBUNISTRING_VERSION = 1.0
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
