Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384CEC77B7D
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 19:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F48141EE3;
	Fri,  5 May 2023 19:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F48141EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmg7zCEEEp5u; Fri,  5 May 2023 19:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69B7A41EAA;
	Fri,  5 May 2023 19:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69B7A41EAA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D90D41BF389
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 19:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A812C40412
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 19:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A812C40412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dP2wfbNTVQ-m for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 19:29:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91FF3402D0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91FF3402D0
 for <buildroot@buildroot.org>; Fri,  5 May 2023 19:29:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.225.6.203]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M7b6b-1prQ543L7l-007zn9 for <buildroot@buildroot.org>; Fri, 05 May 2023
 21:29:28 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Fri,  5 May 2023 21:27:43 +0200
Message-Id: <20230505192743.6844-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:5KSPvn1HhfkhpimtJCNu48iEEiX8e77gMeRtNyV96o0Rso3qwJV
 EcvEt78h2OK9rMfsm9ndVJwaDtKlgo8Ua+yOrqoY72CE91AUG8SAkonzZSfnpmpBA5bN17K
 Mk8wQOqDrd0KMY8L5se4EMAS6UBEiET3OH6WHGAS3EoA8S9G/dP8DF1kPwRo4LR4LZqyVkB
 tsjpErKDWI4fNyX8lJQvg==
UI-OutboundReport: notjunk:1;M01:P0:FksxPW+4DyY=;eGBK7vQwsxi+J82zsbY1ccjv+wa
 ZBTrz/SJUlJtJVLhJu0g0ARDbMWMt76aHQeLhECXfrXZGEWVy8L10Ikr21CMcYi1eTYmFmmfx
 O8TdT20j0vTIENGuJkaWvyf913uMgQjy5sEo3/etrckFClPaX2yPWkwb0l0Gxw+kzDQV3Xyb8
 7/GvHDZrtyeM7vb3etitpQ4omlErczKdxi7cjTKFFesQcsiuY/ra+3Wa0pddDIdiQ5JiP5/Sx
 uL4u8zAWZiy3oo6OeA2JFGPxpUj1G01P2i6l7Rli4XaZsByvCenKMZx7JrdkaycTmlZ0CzpaK
 28nSMBv4bAVpEJOD6MS7HzsUtfvpmJGkzw//WKF+2+DbdM00cIk9r6v4ab6v9M2QCO/9ON2h/
 fT+X/tu8A5RRwG+uxJbm7UlBDqYLtOxxZPOaeibyHkaCicW0ZcB1Gcm75YGcoQfPmGYLkZ1MC
 mEiNtVRqfUNQ/0pKXmLycpPL0A3ye4V2gx/fMo6MSiBOeR6FViFv4wQzIWRBdPIBboi1jQTSs
 wUQc3ZrvpAXyj9f4BLBiL83Q69jIF4s50VNShebY7LRVVXNUaCJTooJDL/hYhlqPtQay0/md4
 lGJh0gHoiO57KnqC/Mul8l46lZMoTJVI4f6JFPyMRQQQgz0nlYosuqWvu1MRhrOXa4z3b0on4
 sWxT+81hqGU3qlZY6I4wcPV1zpeZQh8xsivNwfYrsX24JAkVv0xnrtV2gBFDh5pIxzUXe9IvC
 GQPB1WuQzYt53Pez52KaSQMVYXx66XaGSwzUlcvHOwQlLinDjiBJcs/tcygOc0Vomz2MSJax4
 XW/SXJiWz6+qlh14pk9wB3o2nVCPubDIPktdv7U/Tk4QYUROyoyU2/5/ACN93t+qIFZme9Yzs
 LL1hp7+AZzz1Bwo2A1e1HcBDhFfvjLie0Hr5FX51NM6xRY/VuIaXPEWGo+N44h1xf2BPXj5Zh
 TWcqa0O/Fc21aZ/Rgb9cPx/V/jU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683314968; i=dalang@gmx.at;
 bh=cKDFFe2KqgY2Q0Ngye6hkXRYqtrjSV5+Fzq4UBskwKU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Suxu6bf3Wqa17waMSUe+mWZyRrSHSohhXYrBRNJCZitVhL7EotuqgUN6sJqQoZM72
 X8kzru0diI4MajNh2hEJbsUydLajQaFzbNIX6Ex4M3CnIghEOtDnoGO92szbBZq+Sg
 aW8vckCjyccHOXpa2NRZSN2IHGCZzdwhqQNtj3UkCBtz58itDSOW5D2ajK3zFXuLl+
 MNHlRGekKyUMUj2rtfy8NbBSD4MIpc/TZUsV/FkGDkOUIICuodzNUowFLl7bH7zHlL
 1MveqgO4c51n/9fNHxGFDaCAp3bbVFkyJG1FBGU1yXpZQPhZswLTmNNtD+kUJy+Ug+
 /syzMiw6PeSqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=Suxu6bf3
Subject: [Buildroot] [PATCH] package/ncurses: security bump to 6.4.20230429
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

Update to 6.4 and use latest snapshot to fix CVE-2023-29491.
COPYING has been changed in snapshot 20230107 to update the year [0].
Update CVE version to major.minor.snapshot, as NVD uses the snapshot date as patch version [1].

[0]: https://github.com/ThomasDickey/ncurses-snapshots/commit/eedb756850fdddcd2767d488ed5ea323d40b37ec
[1]: https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:ncurses

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/ncurses/ncurses.hash | 4 ++--
 package/ncurses/ncurses.mk   | 9 +++------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index c96bf77bce..a5f83c8725 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4057d800ee96623ae70d06b05b2dadb481a80c030e4968aa5d9bcea4439441da  ncurses-6.3-20221224.tar.gz
+sha256  004603a9b3ec51599ef0a0089482004ee3d33b0240d87ce17b6f77525b51fb4e  ncurses-6.4-20230429.tar.gz
 # Locally computed
-sha256  63de87399e9fc8860236082b6b0520e068e9eb1fad0ebd30202aa30bb6f690ac  COPYING
+sha256  0413b2f4ea863194c174673032f0fca84f1ea1ed4eed6476baea68c075a631ce  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 73e3c3feb8..4753da299c 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When there is no snapshost yet for a new version, set it to the empty string
-NCURSES_VERSION_MAJOR = 6.3
-NCURSES_SNAPSHOT_DATE = 20221224
+NCURSES_VERSION_MAJOR = 6.4
+NCURSES_SNAPSHOT_DATE = 20230429
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
@@ -15,12 +15,9 @@ NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = COPYING
 NCURSES_CPE_ID_VENDOR = gnu
-NCURSES_CPE_ID_VERSION = $(NCURSES_VERSION_MAJOR)
+NCURSES_CPE_ID_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),.$(NCURSES_SNAPSHOT_DATE))
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
 
-# Fixed since snapshot 20220416
-NCURSES_IGNORE_CVES += CVE-2022-29458
-
 NCURSES_CONF_OPTS = \
 	--without-cxx \
 	--without-cxx-binding \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
