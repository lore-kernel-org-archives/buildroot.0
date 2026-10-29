Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EA7606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=imHreLeb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A168F40A6D;
	Thu, 29 Oct 2026 20:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1TOdOl-YOnDj; Thu, 29 Oct 2026 20:23:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3657340A6F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305429;
	b=GDleC8Weo0ebM1pbCjROEqjDFUPxcXhUEm0F1M11E4TmsyC0oYiuoUL/MQhVkJgAVzbt
	 NAnVE1AVNNswfADpmF8bjprNMXtmLNpPuPCT+u3oHED8dp17VZLExKfmOZubZmdshGV7d
	 PDR7ZKk5i91XvsFo0n5ubiwSixAwgdOrrHABYAim2S1s6NAtaan7kKSqg3YkcC3jPJ78v
	 hineI57/nF3zZcePa0CCBwnTVCUM/yN61iptQLkT3EsANcRL9Zal+iC5Odz55pZY8YvOQ
	 oOn1WcLDEtQMOPnkHW5+iUgLtX9Y/Z3ayqv7jIT7BvjC1KsACZClqc1RcOHb51oAVoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305429;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=X+l4YAeOb60egExVuE3JCfG1VT5XFqF/BDg1teGK3ic=;
	b=RFNwOx5BN1a4Z8pE3OLDD88dzjCqgLXb/aUgo3osMdnbVS/XN7ngnQz7X3nCvwcGsOP3
	 l2XQru4f6GyXhc7J7ZyadElxA9q6wQfdAqH5GSMmKvI/vz5SMrDYfq09qyBk2wmfU6M7r
	 /lT1loz+bk1WeJv9xiSVxEArYgCZhO8NL0cGormHS0oY2VQIrTlChfxWJnR4MU3LxGxkN
	 7bGjVg7j7meGOavwOhdybFHA2T3ucZHAtwRo8WAe2GTRWk3Yi9uit787YsMVl7Z4JA0gz
	 m2YBLHgikX+fx8AN0HHnyaHPoW8GVsFrYs7dWFsjEPBDPGsSFuUA9udIc+hCRQm5BSA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305429;
	bh=X+l4YAeOb60egExVuE3JCfG1VT5XFqF/BDg1teGK3ic=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=imHreLebuJ20bmKZz6Ya6TAT+Ei50dtg+Cq/UD15Ag14TwAJw4Z9XH8RoEbgN5c56
	 Go744DwMYXMKPr8uac6NSZWULni2LbMvcnG/Ev/XIuX0CG0HBqBjqYHB8RHK5vfI3K
	 mZSL076dNSpxpTpveXiEwm14ogXOGaSW21KrFlBhCeLx4mmWqamY1lujBgAVfmVjnz
	 ksdPz1qI5X5yBvWTRiTnYJTyy7cU+2gtsFeezVU8Sze4XPDQ4/+ujwE057mrZNryQw
	 GxRyqysD1aW/isq4mpXAbGyW7d7WPIix3Wu8kNxtX7VqZIpllGdMTov9KYRaJF9vl2
	 MKHaFKGzyGnMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3657340A6F;
	Thu, 29 Oct 2026 20:23:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92E363A7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8510F404F1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEY-aUvrJjv8 for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 66D1C404F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305405;
 b=Ymv6waRTSY9HXaqmFFX5B0Yrzse99luf0zQKBFoiCqB535/I8W1Jg4gJ4P9bg4S41tGu
 uL69SnwQWP3GZDa3bytyDVJIG5e01svTUy/t70E7Zv8wbInZVAIboe5K+3yOd0/qOn+aN
 VJSXoC3+JdnFoGCqYkw0QGSl0ZvkyCflWIEz7yOU42dbwhhekcKTwzkkzOFVRzbQ5JgR6
 eBBn2gq83jzTDDm7vB2sDvjkZLqivNquwfrCMd4g8oxYVWheOgClr2Kd0sMS6E2G3fKiO
 wuDEgD+X1eS0WUDxtXViuDQJy8X5yQu8XhqqFFEoJf5EkOkbzIbYPZ225YGsr5NITxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305405;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hpm+JSQI7ndoTPHynWVvVZE5LWyP93KeFKqmY+jusYM=;
 b=HWhyQQcW1cbN7VznBngMkT8Ys0AyzVcuRoXhPO84/3ZhhS0omlAKeNAX4cCzI5RXm806
 MaVMzu++4dE5beZkD6iOoyj2QzS5aknRbsvwVjygc8fgN92WrpKGaCzc/7LxNtJunf3aP
 uJG38IsXInIb6UQjlGzINIJq6H4Aeus/42dLs8A3AW4HO8YFy/uhIomMSjXBAIIQxwZL4
 eDWhChHPtf99aT5wAWrPUsXqDQtMlkkD6k+mVPRKiDOKrnYuIOIzmwomHdDvaP2mUPKBm
 IVanVJCstMj4qDOOfUqcjK/p0w7D2wjAxq/RJuntB8Y1eKbid6fyp7LRiIxE7uSiemg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66D1C404F3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2C579D2EF; Thu, 29 Oct 2026 20:21:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 20:26:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89b2165d1dc90b89e5c80c94fe5a310097cb7439
X-Git-Newrev: 933e27c0de451e94d1a3a7da5eaedd434d5a0f1b
X-Patchwork-Hint: ignore
Message-Id: <20261029202157.D2C579D2EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-screensaver-*: mass version
 bump to Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/933e27c0de451e94d1a3a7da5eaedd434d5a0f1b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash      | 2 +-
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk        | 2 +-
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash      | 2 +-
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk        | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash    | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk      | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash          | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk            | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash      | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk        | 2 +-
 .../kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash    | 2 +-
 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk  | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash        | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk          | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash                | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk                  | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash              | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk                | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index 0210157d2a..a68c3ca3b3 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  468527220845a411af4dd021a907c6449327015fb848e61adfb46b47edde331a  kodi-screensaver-asteroids-21.0.2-Omega.tar.gz
+sha256  5682dd86180706b6bee99a3b16797378b68d64832abf8fde180e6e5da741e07a  kodi-screensaver-asteroids-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 878ab22c3b..f680a69cf5 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,xbmc,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index c63d3be3e8..c7bd9973da 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  de92f8773f23c77f388201d316273f1a06103965bdb9684cbda19a73180c1488  kodi-screensaver-asterwave-21.0.2-Omega.tar.gz
+sha256  049ddd84606576439531a76f04bf6732ecab1776d151a5bfe7b69a1a488080ee  kodi-screensaver-asterwave-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 90507bf8b0..90518360fc 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 22.0.5-Piers
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTERWAVE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 865f31b201..9f163c5dd6 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fdd5a5abf98318e01e22c88f81ae3838b2f3b76f99b39e01fc94af528a200849  kodi-screensaver-biogenesis-21.0.2-Omega.tar.gz
+sha256  a67269b38cdb3d9d39f8c7ae5c014af6496159ede7701fdfc102e78280e1ac56  kodi-screensaver-biogenesis-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 4455caedda..25cbfb8cbe 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index bb6918a03b..35e6186c19 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f56b57dfc8535331e36527462bd820e06e287a5a48ffdb33d00bdf1a2dc62b90  kodi-screensaver-cpblobs-21.0.2-Omega.tar.gz
+sha256  c611deff379023ef3310f3a4eb75f0d1ae694310efa857fc79e35a178c751c01  kodi-screensaver-cpblobs-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 8154bda2e1..0b97d3271e 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_CPBLOBS_VERSION = 22.0.3-Piers
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index df652f3286..034993ff3b 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ed9dba2040268bfd82648856b3e07da5cf51f39909c71c2579475221477e3a6  kodi-screensaver-greynetic-21.0.2-Omega.tar.gz
+sha256  cb87ccf7c3cbbca7682196e0ed6b5556662a9b630cfa462536fe019ff8e7cdaa  kodi-screensaver-greynetic-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index e484305485..1049386374 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_GREYNETIC_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 27bba5d3ba..a339fd3932 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cc342d201606e682fc9def894a308784b74633f981209570c87d1bd206894311  kodi-screensaver-matrixtrails-21.0.2-Omega.tar.gz
+sha256  906de731f0b1f559d27c874c29f3de8bcd82551a99547181ba5a3cbf4ab9dfb4  kodi-screensaver-matrixtrails-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index ab51a5bc2b..21b1a652b9 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 22.0.5-Piers
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 867ebf865a..2dbae3ef54 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4d7c15a0070e4792b4b56726d9a37ab6ca8c569186e0beebd256a57203d5e362  kodi-screensaver-pingpong-21.0.2-Omega.tar.gz
+sha256  b2d773288bc4e07e695ba847805a498b43d35784fbc066f878f8d0217d422cb4  kodi-screensaver-pingpong-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 5d1854b9a2..63b89a18d3 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_PINGPONG_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index 23d1e1b1f3..7a3f8c0642 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4a6b5d7efd789be40226ffe337bac8f64c47335c40085d940d624d42cdaa1be0  kodi-screensaver-pyro-21.0.2-Omega.tar.gz
+sha256  70e519246b05bad18ef97f0973a082bc4796a438fd6054532b44a8af3bb4dcfc  kodi-screensaver-pyro-22.0.6-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 72bbf2e913..6ffbf563b1 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_PYRO_VERSION = 22.0.6-Piers
 KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 6f9ca93d8d..c611a7cfd8 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  86a479a4c6d0b27723a701330b83704f223566eabe7a25302ecf8f0a66e5b27e  kodi-screensaver-stars-21.0.2-Omega.tar.gz
+sha256  45da0470fd95cc059356f87ae34db32a117ac11c9e30e4b65c7f018b942bc534  kodi-screensaver-stars-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index cff60ae5db..4dc7577b6b 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 21.0.2-Omega
+KODI_SCREENSAVER_STARS_VERSION = 22.0.5-Piers
 KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
