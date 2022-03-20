Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96009C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 22:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 238254032A;
	Sun, 20 Mar 2022 22:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IBt8B3PfnrX6; Sun, 20 Mar 2022 22:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 102EA4022C;
	Sun, 20 Mar 2022 22:15:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CA4F1BF402
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 22:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDFA860761
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 22:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHie7IDMnrkN for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 22:15:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7463606EC
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 22:15:24 +0000 (UTC)
Received: from calakmul.fritz.box ([151.61.114.119]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.17.173]) with ESMTPA (Nemesis) id
 1MbizQ-1o5fpU1Jkc-00dCnq; Sun, 20 Mar 2022 23:15:22 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 23:14:44 +0100
Message-Id: <20220320221445.10259-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:uQ0ya6fHmIvrYlCuVW0dfdjy7XyYZQht6+aoahyLv+K5Gn4snls
 4eVkaG0NfkMb9NoCF6bMiLREl1PA0znwqnlgIA0+4g2a9lxM+VCl1xVQes+JppWEE/kZ18o
 wTpEFboLL2W2AhNtra7TFme5fxsAWRbJz+Q2ZnuCtFp70g391NpGskb4VCjpOOIxWBbSFgT
 Y1NkKwOCSBLDZ62JpubOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jPhj9cm2Qv4=:8g2EQ3aKVIxSXQHShVc2Lv
 jyZKXYkIwOUWgi5qYcSMw2SE8ztF/Pulae6iivmrM82Xha7lX5b3GSHUIoi8NT/JWQ7Hwgl+E
 khORvEEwFpl16ceCsd/Vx+//7zJEFGY+aANkbQmxeYPGvbtGWvo4h1UP8uBk7+0wjqwBXgTB+
 7AJOR3/QJvHlzR1ZFV9jujszXCDffArKmJ1ViIDhbf1cxRE2oM4e4gaPwQerBP2QEztmGGG7k
 NHY+Z+XLuFBEMouZZVKWkqGSKymUKP0oWmu67tcPAlf0H/cIbjHHGVEVYAK3LPxVYWlFV4AwT
 bgvQgjJo5Sfe2fMnB0MBC6CEpqWGFC6UGc0VnSDX3LjT4VlYNLYB8N/CfgQIvHEBSSntMutc2
 QlRf62ryUctgXBcja7JnsXdjXheHbG9nW+p+RI+90BvuVISK+WjdC6ZTpBzEc+a8o6sujy5RP
 F4YYIpVwy4YQ3C+QrlMhEljspaN8O/BmQhmQlxRE7T2B8mwJ66+5kcOe0QqdRcsiBrL5bBeRe
 vYd5u533azI6UClerCEh0xHg2sCXNJlxfgxJXyOlbwdopMrjZkPIkPlND2K+6mRhE87b34JDY
 MBO4h96gB+SZOayH1PWYbUjvgP7dWPwQOqydAJO8bag1LbSJM8JQ56W698m1EC/cAI+FogznX
 ZjkqAxpNVI1e9iNQdCLlMyckf3GjEKSImhgQ4nPvv8c2Knyw9wefIGwzKT/dnB9IrEkU=
Subject: [Buildroot] [PATCH 1/2] packages/guile: bump to version 3.0.8
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

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/guile/guile.hash | 2 +-
 package/guile/guile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index c2719fa7f2..e9ae5b6e51 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  f57d86c70620271bfceb7a9be0c81744a033f08adc7ceba832c9917ab3e691b7  guile-3.0.7.tar.xz
+sha256  daa7060a56f2804e9b74c8d7e7fe8beed12b43aab2789a38585183fcc17b8a13  guile-3.0.8.tar.xz
 # Locally computed
 sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 859d7ec96f..9478e75b41 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 3.0.7
+GUILE_VERSION = 3.0.8
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
