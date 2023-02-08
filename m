Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA803C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34788400BE;
	Wed,  8 Feb 2023 16:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34788400BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hI1SXRp1ebpI; Wed,  8 Feb 2023 16:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B6374009B;
	Wed,  8 Feb 2023 16:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B6374009B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7AB11BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B242882018
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B242882018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UACWejclppf7 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:27:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6531881FED
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6531881FED
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:27:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.170]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M1Ycl-1pRA4C0f1f-0032rd; Wed, 08 Feb 2023 17:27:27 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 17:27:26 +0100
Message-Id: <20230208162726.28775-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:OaM1FOeRwf/79ZfaxmvJlLI0xT3+TIcQN/G00kcZsEm+jIAFHS4
 1HGdeXGzGpHk0fSJVMG+J27F1zoEx1Prxk8b8zJ3JT/2PopWxvijHQ3KEWxtfYP1k3ebe/C
 mo5MEZlBltRkg7W+vLnX1M1TUZpz6UBbvY0mvwdVz2sAlRyUhFTviENhloNYOYGeOeUvHFU
 5cLoXHMiAHESd6bkbTGlg==
UI-OutboundReport: notjunk:1;M01:P0:7KYC5i42bcQ=;OoDKeNq5OzkJoWUvIl3xBrUw1WR
 K8cJHFuUegNgxcdBWVhXx6YCIsQO12A6rofEcWydmGND9qcCwZLdfYqs4nbjxrrVPQaLa175n
 k+bgUApHOjNiQsy1BFi57lyGuyvhrLyqlqHsGV2ARh4rQcUwiMLJy5VESkTbg86AR6C5hlcXs
 ftINmUFtJQV3+d3TQsuAiSUQugrzfZltH2gGJXGrQWWBUg4LP95m/6OVrHhd5IcN7UJvOvpvi
 ed8QvUQnMMiwSU1SqmfHM/ScmFUcMF/aZFDPBCc5ivJ8A//YGbwUHAAfbU5SEuynHgYwTUyTN
 HJlB/ziSCqlddCyHDjdqGJqEUEn+MEKKMFKFpYOUp5UYDX4jKZcuaruCMS5XUBUzikzcycxrY
 RYUiqHWAnzp71t6btKU7AF6SM8AQT+VrAcEekzf0cCIuuzMUZGJiUfeOQ5Zh+QB5uJG1iGfip
 2gNoTYVW3g4jinwu+gafmid6iByLPR6OegtPUtjM8/tnrR71igzmXgo39Qu5BHr5ste5+aVtV
 EkyG5F1pgB9kKTkNB/w2L+4kWxUdkUwyjK2vKiqRBALtJaA70qB+O+I7tUY4t3vaClt6srJkq
 TTC8S9WWaOT8mXCdFdD6C2ZLlNyICXvDABqOy5bdhMwREHZeSFjqIMb/7Mzbuipt4UMmJf7av
 c/zrFMF64QjjyCcd7L+CPrcWcIHx3HLSYyOijyKrO1qrNxHFuNaMILYzn6jjHoa/s6ZNIwYUB
 b9frIKMhgSMaxPOVQLczkJjiBcX4NBt87d7m0oZSl9iV7szdPm4dYrOA1IHgPTDxT4ubYabNS
 a1chdKlzqo0Z0jwT4YpPkgOV7xMOEdJD5yWsh3w1in+x3Cpl06wsfwbuHWKFUXYYk5LhjUlj5
 vdBzeKuCwED7OAaiJha1yMorlv6lJpO94NFPCXrGj6eki8yuDy1vc0Hd28mMv7si4/tp7X2f7
 XpOXFbIVKmh0vCClzImMahe5+ww=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1675873647; bh=E3ITZ8z8Z3UCWmborGozJMvC3vxvf/bM+TMdczGt+Zs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=ppH7aIe3TakGhaCUtsqIZamLV5kh+qdYXLEv34fj4KAtD2S/tqCe2y/cCHIQKTjuv
 tw+FbnxM/01CaTuSJqw80P5NH4elNTr4BjLvnuG9O9CMjZhYyPLbZn/vI8JETTXTq5
 W14W8rTM5kpf+pDe6Bh+82doZit6izVdbziDxFRGlj1qMX88VmEjv3ygI/3oQ9gcW7
 VAuViYSQB6a+27og+zPLWvqL03xLh9TMCR00IpJBaCArI8V8TvoJBs2HsjO2JHV/zG
 FzIkPEdNVNtAv2Lzup41cGIy/soj37txDvm4zuPW2J9Qo8negRtVoS6h2oKnSOJlPL
 0SLruTAUYrBsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ppH7aIe3
Subject: [Buildroot] [PATCH v1] package/qt6base: additional disable
 FEATURE_avx512vbmi2 and FEATURE_vaes
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- additional disable new FEATURE_avx512vbmi2/FEATURE_vaes (added with
  upstream commit [1])

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=38e6b637b71fae274caedc1d326f641b904e00a4

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt6/qt6base/qt6base.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 212b2d689e..e6cf4f14bb 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -72,7 +72,9 @@ QT6BASE_CONF_OPTS += \
 	-DFEATURE_avx512ifma=OFF \
 	-DFEATURE_avx512pf=OFF \
 	-DFEATURE_avx512vbmi=OFF \
-	-DFEATURE_avx512vl=OFF
+	-DFEATURE_avx512vbmi2=OFF \
+	-DFEATURE_avx512vl=OFF \
+	-DFEATURE_vaes=OFF
 
 define QT6BASE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6BASE_BUILDDIR)
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
