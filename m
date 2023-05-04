Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA02C77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D593342786;
	Thu,  4 May 2023 20:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D593342786
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyipyMxdQ2Gv; Thu,  4 May 2023 20:21:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C10CD4263E;
	Thu,  4 May 2023 20:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C10CD4263E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D8581BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB08F8417B
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB08F8417B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kuRMGupdsbkU for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:21:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAC948417A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAC948417A
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:21:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.47]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfpSb-1qS4GQ102b-00gEI8
 for <buildroot@buildroot.org>; Thu, 04 May 2023 22:21:39 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 22:21:37 +0200
Message-Id: <20230504202137.18145-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230504202137.18145-1-ps.report@gmx.net>
References: <20230504202137.18145-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:fDpYHe2iBTqx8MVJE413dBydYFo83O9HONxtc5B9SQkifh6AeTI
 Uu7a3f0Gj73w8Z6fC2wiaUEGfN+fmx9JfmEayW5gMY4Hj/HrgasgmitIpygMiOW/FF3H251
 nuzDjKr58RLEz02rDLzbCE8zg53bKxRCpFmaqdndcYu+7E0Zk2fFLEVGolm8Q+ACSjkJyCr
 /UW8uZ7+mwoDZHyHA2ugA==
UI-OutboundReport: notjunk:1;M01:P0:SEf/go+VEjs=;jZ0WwTlTeLiS1YRWCeog1K5QiZW
 6pCltDfOTFPHjrv5gqdk20GCOAkNc2L3z2lxf1nlh1Wv23rIyx/wreUeWBs5+DwNrHUN/nuyZ
 J6xe1UOi+vSDBIGbN5wfGXql4zLBXP/JMGXGslixIFBSyGaxjvrqorLTnmz0nMCTaBvK5y88K
 lGiWXUabtEVIflqsa/lBqqYM1TaheQ8LKJKgo3Xqlpqlbzj/RneKB9VTEt9K/ai30gL/vf6Kx
 G1ZL2xH/MNnm2HxxKSFxrlY/YbhaV9uqoi26YIsXVIMMtCwWwHp6zavCocv1a4EWYS07QdKSU
 OKS2XTsF+QVrpKMT4vLemoPhFEM76jK7Nq6e6OhCohegp8e8MZdL+unUxGC75TGmxKZG7FL4L
 6ggzTGjMeTO0vFXdA/j/w/wD3GWzHeWtklJfXfbaT9D1d9/kH+42HelWEzKN8c63ywscVUcKv
 o90ZcgOFpIchfHuiaMFkusT6AQawBlWYwvyXFS4qlXQffDWqdDnOk1WH5wTcaIuyCgp8gqYgT
 iXuw7mYPVbSBfRL77R3pKftgcTg63xsenw6LFZB47UVLZFL84zAP+2jPWPASW13xTWqMx7nD7
 8i2/Dsmh+Mu+KmJRuutnd+Yunbqv9Vdn1/pW2LwtB1CbsP0aUXBPmoBKgtzfSsvOLH2Ws4o4U
 /nUXf7eh0urKDuDdjPYxfrP97aJlx2QqQHQ0oC/mYtMe1i7pS+P4HJPgmfP3wBeclYUeZV7tr
 imPyBrE5rxeIOXG8e6O4U9m1kordOQZrmiAAzFgVE3oxbVuSgCC9BGlKzBUOVZC5qmR9Ymtnk
 c67IVm+S+F51b5rnKs94NVyA4sES/PnnH6hsE2Y1krq4Pgv0qBFTOug3x4ZKqAthXjMPfLFZa
 dlBAfVjjfWjL6VdHZQZGTtttTxqvAKqhlsZGEyVUP+hq4uRpcE6Nr375N5S2r8E9T73KRjtsK
 vFBwajL1zj9n1q72OvIvl06tr2E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683231699; i=ps.report@gmx.net;
 bh=gVe/OMhd7k5VeYBN+dYlV8mV15q2QPGna9jOk39HsrQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=oa32NphDmYAq/vXHGJbx8VUcB1JytYWi0UvhhDt7C8cBemicv5Imp7cJAPrWrj464
 eap6jE21FodwKEuKEytHqQwYJHMtpZCjlry6kn13ubTVYQACGsXd5e3ZCJK2eCSjI5
 NG0MTYBdqwE7crh1T9A27XHNNt8CHhmryY6qooGt8eeAkZ4AW4f7Z6VE+JgbX1knqF
 twt8zjnyBmNRsUEg4eWMOjXBsQdItIbxdfg34f9CMiuptIsPfFsa0LONxB7ed6juX8
 9NH3MEHODJMZMBQkwlhlohmtTvexgRGWGrUpmcIKFnf26gru5QXq0RnHvK4FgZsrEW
 l7tK2o214IVMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=oa32NphD
Subject: [Buildroot] [PATCH v1 2/2] package/edid-decode: bump version to
 2d44e1b
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
 package/edid-decode/edid-decode.hash | 2 +-
 package/edid-decode/edid-decode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 65d6c71079..8bece94911 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c1a6222083c59f0499b3e43c159aee7e4c6c07d33b790d490a13fd62942fa9b5  edid-decode-188950472c19492547e298b27f9da0d72cf826df-br1.tar.gz
+sha256  a8774f1d3eb031ffa4ecb85135b47ad28afeeaa7cf9e8410c5b51a29b83bbfdd  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-br1.tar.gz
 sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index 7e463c02b1..cd0bdfa0f0 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDID_DECODE_VERSION = 188950472c19492547e298b27f9da0d72cf826df
+EDID_DECODE_VERSION = 2d44e1b01c7ed7d65b20ecdce62d354841832201
 EDID_DECODE_SITE = git://linuxtv.org/edid-decode.git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = LICENSE
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
