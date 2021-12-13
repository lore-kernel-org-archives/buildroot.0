Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDFCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 20:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8B39403C4;
	Mon, 13 Dec 2021 20:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DKGxYn0dz6o; Mon, 13 Dec 2021 20:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE06F40361;
	Mon, 13 Dec 2021 20:25:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C113C1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 20:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC18860B3F
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 20:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhK6osnDi4BG for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 20:25:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF52960B3B
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 20:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639427146;
 bh=x1WEbsutaO0u7XGnmrlKkfJyZ2sD6y7HNMGlpXfcFWM=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=kZiZhZuDnVCKh5ujRTiw8k2pOkj9NkziKRB8Jcj78QVEgpGjAk7OEdi0Q+PeoAcZG
 9EClm8O3GtMRHojvMNbRvXxIxVvxUzfmcc0jAHd4kRmexFVvQzQ12ne1v6Nk/PzNUr
 JMGK3gdIl8NOwnPSH91k8c5kmPapHDTvbqOMGXp8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.61]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQj7-1mkSu72gdp-00GuVK
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:25:46 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 21:25:45 +0100
Message-Id: <20211213202545.23647-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:wZEo5pMYC9X69z9JJhUH2GT3a+hMB5svAC2xFzx8a7jXRCOepOm
 ZURNezsw5GvtgkaWJ9sxAxddHlqwEeLm+qpBU55alcboV974xQcSkJhZIplSndqzZXDam3X
 7Q7To1MYh/bCVWM14hsSVC2mOOUzfVATD3RQyH2T9/QwqUPwbpuWwzsmOXTm6k3mMDWNCbW
 IGwNdk0tyJH3TIRoDM0gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WWqOxXwKnC4=:ZVrSxRjtgOUzHMAgw5gmeh
 FgnYJO2WitJ3oi47IL/ygNZfbruOrfQCD8pSndCCw0fYDIrUgfxhP7peWj0jwuAJetKbq1e8l
 xjcF07Xm5JUlDDABipu24XVC7O4IZbC/59K9RMICxVY88ubEpAnkSmJWEZ5sk0lwJ9DP2jRYy
 stmmOo9QH9EFx3hYuNxpX59Cp+NyD7LzrJfqdSzYqxMKGcEyF69nL16y6mlrN5yZaVAo3PPi/
 aTo9c0v3pXht/iExsqCZn0BkfvB5Pn4FKA0oWCj/+OdGYoC2wKBnDNcHOrRZqOcBhoXAVyJ2k
 bgMeZWKJs0VfCaXADVzRYDlo6tXaA3TH4y7auppf0tDQuckxO7cSvKmEjWg1udyULJGJEdD5y
 Ue+qYb4xKSmbIXHxV5W1MgRdzsyZyF74iHjPzNobg5kVUxhX+jZXu4XmRuHT8cu5iEqGr+oCl
 BR/5DtUaLzH6Tc+j4vECGHdq3MrADMAeDWJ2kx6KSU/qOAazoVpT2XO++hATpWniEdXrtvYgb
 pBaSE1zfi4He8iu+UIAHVlYovEPEhOkRWiXR8qgguo0pboAz39xAVZYeTaIe5Gx0OAoyBslK7
 0FEC0IGLsG/tgMdOLA08GgkoNc/fPHdbm7qIRyH7BRb42OfE8LbAKln4tkXrBWQIHy+cXrK9X
 9Os6TKH2v/Xr5ZUwkxFGAExx9To//YODp68vGDwaeKZOZhcEO1YqonR3ObjLL1rqgAtWurToP
 dFWr6zl/qWYJVEuTfQGcxKE+aIU24xQ2Sx2Fi6h8J/4JfcPMwzJQgOJHjXC+TyLkIRHOo2qFa
 YsgfptGrBN4gVlVQxg3GUB3vQymGo2OxwOqZd0dQs8SgUifmlJicgq94BBsHxMSmPnPgphF6S
 7EGNG8D42e1QuQrpMJ+D+oE251BWTMgcMDw2SIP2+598A+uM0Q1oxGvFpUHCmta/FVtTTQ9lk
 IfJZu+SSynNMP79MnZBArMG6H1q0aX3Ot9rAU25GPOVsHu1N39/d8MXrh4YnB99X7nOK9yHGH
 bU9Zg9/xcQJQIaSyVu/BobTgQKv9KStuWFgmGWraz1ssa4Nh+Cof+t2shds+OUhwwGTBuqJFe
 vA752nUt//W5ZM=
Subject: [Buildroot] [PATCH v1] package/hwdata: bump version to 0.354
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

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 8479e94339..43cca03b06 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  14d120ae58f71da18d7731f44e65a818e4209d621b41fba6f0cd03278a002c1d  hwdata-0.353.tar.gz
+sha256  ed9a2c8b90371ccf4f0ff88972d87770c1c644e63ca44d2ac72c33200642cdde  hwdata-0.354.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 8341757a11..71b59b95ed 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.353
+HWDATA_VERSION = 0.354
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
