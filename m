Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4450BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 20:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC9460B2B;
	Mon, 24 Jan 2022 20:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_vAWUwfcP2R; Mon, 24 Jan 2022 20:58:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DE3060AE7;
	Mon, 24 Jan 2022 20:58:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4061BF3FB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 20:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7696984C06
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 20:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AvCZAOSK9HPQ for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 20:58:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBDC984BFC
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643057892;
 bh=XWoUgeOdL5Ey7zxX2zr3X98Ec05ClWG8Dc3qhcWNnpA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Ff8TgzqpglpAz9RvGcngYDFCojzV6Km0qZ9JSb5/GXG55JLsSdcz2+DZKtY/fSMzk
 qekAup7TXrNx1M6HHrJvm3EUCFi+kn5WcMBtF407eNez3VGkUwop2Re/L2S7fF2VyV
 dTs8CiywzoQfMDZ+VAxMm9z9jnI0RzNUo2Du2vpc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.192]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MulqD-1mKgXw3rKl-00rswV for <buildroot@buildroot.org>; Mon, 24 Jan 2022
 21:58:12 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 21:58:11 +0100
Message-Id: <20220124205811.15913-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:wzL/tksBrsDQggNvuT/6r5uh9SUGajTQp/+0dyhCOJaavfMmOn+
 mk/ESZ1MaWF0wlOOZEUv97kfaagw16LGOIdgC/IXJrpVzjdV7BtDRCVLoUa9zlPGz1U2uyo
 OoE/hkLaouwgLqh2i8G4w4aXM2/nkHJpXag6tdjGaUu5kyXqhUuqSoo8uNV6HACHmJHgkCG
 rcIK45bNZ+QGmuB+bultw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PUEqriilRsU=:A+IN1X+Un4n3u56DUJAQCC
 IVNi0AETZmLzECYMMToU1L/WhKyAmfPvWFgVec/V3bSp2ICBliLz3wh+1GPHPyCZ/kqOVp/1O
 FQXLl18RfjWe96xqkcKL/NlgoNDgGL5568iWVF4xPBznI2YOUVjncAUXbJ9SPggeEJyO/GqnN
 9sxt4Kl5KQ0buUSUD76C2hKi0anzccBIkbkP6D+Go7HHKd1GwYSjm+bmTMQ6P/Y53W45g0bqZ
 hvwCeyMwqxrW47ifr8PKcbd9tSRo8gFA4rsIZ38tCfzrpC7rvCv+DjAuMNjW6g0SdxUcp5H5x
 MtdDyIHLQfsHbFqCvmD88Ut7iO22PyaEQTGHac48OSVCwASGBSaPK8cT+LriZtmkNpzEwR8C7
 FBMU8seHpYgsH4qYvWxVFNFM/xVK8eB7icQf844zGyNuso7OtHshTyRkBBQpZ7WZdnfg6AZ0z
 BsQqxzJ0tfl3S1a6xFeIrxN/lVYXfFdKGcF6NSJPOc8qe8HVVK8mnFJ/u2pJUjf/CB+nWdRQ+
 oI3gD+D0bfwUapyxstm0nDqdz26JCwHg6C0KoLyrfV9P9xOJUZZiJNThDgAi6MJ3k4oN+Uvhl
 18clC/LlcbQusclgwL7czTT7iqht7xirJ7Fa1zCbGxOBXRJZCHuHOpkIuVu8CYHhN8hwsfZeo
 YYz5hwF3W/mkHagahWobEylqDL1mx6x8MFUjE5wB255H848IlYBesR5da5cF7Kgm36SSoqizk
 d+78YkDofgtWYTrMxix9SmqcI6LL2jOwiw6ZpWyu/BWV3KJpyCbzPcyWnc0SnQSQjXMwAiaXW
 N/oAk3oR2DU6ikuTpegLUL2HdQwO5gOuM+QqXLBp6mrDHUTVY5uUlHgbUQ8eIJUcB8dx5IYRe
 GHWYndVwtQPoapjY9RFgf8Sl367b+j3hYhK1AdsDBHB8ovhGMdxlmq+ECpQuBMuaViCv1M4rQ
 QmNeu+1Kr1isXftvLEKk2CVDPfv0/+Fmp3Cg943mZl4RH8nupHm+XbcaLSDXUVPRrhhbXwVaW
 OlCe0LW6XG2ANn5G7PClXby6Labelz2recVEvrmMWghQkfpnYAPWqTsHzl7NU73Auk4uTQRtk
 iLFH2FYMPqaQ4Y=
Subject: [Buildroot] [PATCH v1] package/gst1-interpipe: bump version to 1.1.8
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

Changelog (since 1.1.7):

  8b70f08 Add definition of new event GstAppSinkCallbacks for interpipesink element
  ddaa9b5 Add conditional build according to GST_VERSION_MINOR
  730dea6 Bump project version
  8718b12 Add initialization for the GstAppSinkCallbacks struct
  f015ff7 Remove redundant initialization of new_event callback
  530da92 Update copyright year in README file
  e8ce826 Add explanatory comment on the memset of GstAppSinkCallbacks struct
  f0f3b8e Fix README copyright date to 2016-2022
  814982e Merge branch 'hotfix/add-new-event-callback'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-interpipe/gst1-interpipe.hash | 2 +-
 package/gstreamer1/gst1-interpipe/gst1-interpipe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
index 348abdb003..d9f09d2985 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.hash
@@ -1,5 +1,5 @@
 # locally computed hash
-sha256  0fd29d3cba623163dd5852989d7ca21eee9033da9d14a467ccd5e527e3b4297b  gst1-interpipe-1.1.7-br1.tar.gz
+sha256  b97af0dfa108c5f736a961c388267c7a9c8f915e753985d7e85939091032deed  gst1-interpipe-v1.1.8-br1.tar.gz
 
 # Hashes for license files:
 sha256  16d7caa6cabbfd0ca47e064a7b48cb446d013e84ca88c854d6470851752136d5  COPYING
diff --git a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
index fa4485e6f8..cec23e7fa7 100644
--- a/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
+++ b/package/gstreamer1/gst1-interpipe/gst1-interpipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_INTERPIPE_VERSION = 1.1.7
+GST1_INTERPIPE_VERSION = v1.1.8
 GST1_INTERPIPE_SITE = https://github.com/RidgeRun/gst-interpipe
 GST1_INTERPIPE_SITE_METHOD = git
 # fetch gst-interpipe/common sub module
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
