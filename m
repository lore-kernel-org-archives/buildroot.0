Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C180C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 09:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1863181ABA;
	Mon, 10 Jan 2022 09:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0k64dbJZBkzS; Mon, 10 Jan 2022 09:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EC3F81A5C;
	Mon, 10 Jan 2022 09:24:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D74C1BF3D0
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 09:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B7C881A5C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 09:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BiPl2utM-2cA for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 09:24:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD14A81A3B
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 09:24:33 +0000 (UTC)
Received: from houde.tangerine ([185.195.233.153]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1Mdva2-1mY4OP071i-00b0bg; Mon, 10 Jan 2022 10:24:31 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 10:23:52 +0100
Message-Id: <20220110092352.1247528-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Riz8PcoKAlOdTEsIlIG3+nKDMWfXUzRo9WXez/Gr01usduL1+Cb
 xqhas3uOpgIBgn75fnF8SIzDBZMqaeR1mic/y7TMe/oL+WHGpuqh0R1dZGDTAKA5sFPGn4j
 Xq8OhJVL0n5GR+zM7pJLoMwBu3wrWAw2Olp77W3VAMTHpfujq9zJOo+DJ+AXD07aF347g2w
 H1c8KtBainrw/6Vpq4j4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O4Tu28o+f2Y=:2DOmyQCvr5I9E5tzqHECXI
 XIQnT6mnrPsq7/40C0iK9lvvup03lKdqtMnG3Gf5+R1q2RZTcoETb2YZCiZnzBzz5x0Aa2Qm+
 fJq1Lpa2y0t5hdQJQhn4HcGFS3vFNDKs8zf9bqhYmt3StB0w52uKhEDCP1qUVIV86FboaPXRy
 v+l44iOJuLnucLuv3M8N0tW4tXTNUCGj0MG5PycdC1OGx7V9pbGHrn0gG32ga+681h0Y1qdEE
 RBOWFS0352dFgSr5QypILeDhzesK24HWgJ2abCIXO1ZIPwTkV1HPt1flLZfI3XCTwOAWi822a
 k1rnRwS2cU0HTKFMuqgaca80v5Z3hrhhAw0Hyhmw0D5KM9o7lT5cP0xdGHCor5QF7frUlBxQu
 V+36NMtt07l8cY0eu3OwpB6o/ayQacFn6okmn79GRyv2kU5O2cIyJ/9ANK+aSNGFT95N91LPM
 Po1+GD39JUD9Rg+ijVrfAgrcO3WL3ImnVzRtBmGmAceRAAMB3tHCMJKlEC0eY8WoUF7kYRYTM
 U3RCeT4np+AWYA8whlExMRJA92W3yU6u56x1cl88AiHps7tLG1g+73mwg5FTR+M0Z6O8eDlum
 7AeO2rftCQsDpNkplj5MghF9SOf3Nl7vAqMYhOE2zVruobzVaBiJwPxGkjXUz5QkmsSNHTRW8
 4Nq03gc1tjK3GRqwZYaL3jomr45cLFVC6MEDF3w5X60KtQT1JNqHbk+fW+fyLXB4Bw4KhGeA3
 BIEGUBSkUuEOi1nBkvghbU9x40fMuFc5HXHfgw==
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 6.11.0
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 11eae3de36..b72d5fcde8 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	da3025279bbd6cfb0e82b7af95666bede8fd65e8c620a1bc54bba04cebb7e1d4	v6.10.0-dist.zip
+sha256  8c4751915808a5a84adcd760fff453429a95993cadf77003ac94eae127240c1a  v6.11.0-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 781f9901ea..1f8b485018 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.10.0
+OPENLAYERS_VERSION = 6.11.0
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
