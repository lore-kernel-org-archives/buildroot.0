Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA8DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0816C40241;
	Wed, 16 Mar 2022 21:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gTXpOFy0JsQ6; Wed, 16 Mar 2022 21:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7CA0401FF;
	Wed, 16 Mar 2022 21:38:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4401F1BF9C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C48F60AD6
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGFPxrdiq562 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B9DF60BFF
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466577;
 bh=lmSAUS4I0Tecza+HHYthvp4iwRGJu1DX60rTA+nyRbw=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=ZBy/ibXkLUGSEhgD2w+WgZ1Cpfz1rmiLSj2JHRbwnC1iyyvYk1IrwG1gVGBIGLB5f
 0ecRjXnnl4YE9oq92fAeiNUpUPOwRPC+A4tcPtVfknfT0BgDdAiRJXWFjDWhgErP+g
 QGlPCWypmt+Z0eJuBDXkmxnfVr38zoTviHtB4efE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MAwXr-1nOIrg0oQL-00BH1X for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:17 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:14 +0100
Message-Id: <20220316213614.16878-13-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0GOCGoMpsXLktYs1Wwo1Dl88vTC4vxLOdoOj7fxSYnCzZseui93
 p8//i6cr7/iFHIRWG4nOr1uG+2OROGRPVw9doPMWCrGOr63sOpEllgN2eFX2JtcIpbO1NoL
 IqikdyWL7JQrp3rLLY4pnYvkdghm3JS+vFsRBBE1BmV6taMGqt1rkIvDw9B+4BbUuIdLGL+
 M/j20YofBhXEy15AqTLag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:35dw2U2/NTc=:BwK03NdFCG57EqOppGmTlK
 ahQtdxq6goHeH1VEiUU5s5qqHbF4ms52JWtzcvhMx+UnxbYJahFZoAQ3T0GQ9hlLOo7w2q34E
 ZhrDx0Si7muTvzwP6Dauhm16aoLqhU5QK+xw8+ruHjQBcUi9i3P4TVU6VOwOt2xI0s4OkMtol
 FusmzK3vW/q5FsgDZbAyJJwz16nXkIVTk8w83JPcMnCp/dvDGSBK6/LuZ/1+TNJ2lzGXV0udQ
 o7NJLM0KzlnBL8JWbBlpu3NR4QnC+r1t7qaDSgbSzJDQkMIfGIwfEUGBIKPIxPjkr7z073TGy
 UK50ibkTEkAoY9AAgOuWzP8HS90btE4BuEH0wVopi3XVVzWzSBoiulJYPAeU7MlOEJ1xARSXr
 BnTpvwlz7JyeiqDAjqKlCunht+TCEhfu6/nHkdg7T9NmoKukf9YrAjCPKev2ywm0B8BGimsBn
 SPBnlIXCA5u7zxPQCJQtg3RhOsd5FV2ZjSeBNFZFS97HFV61/c6i9Gh7xjQ/iBVFEiwDkOuf+
 eT8C3myLwER7bQVUnhb3SwBsMY9FQlAv2Nf/4G1JAr5M/o8866YP7lW+onR+RrRMzYaExFZBZ
 LA6njdr4K6UaaOXPHA1kAnyU1ukKzl+us9Q/MZRavcOkX+FE+jPbEKWiMBen5rRpCLXZ33RST
 VIOltp5A2OJiKn+tqQE2+fQDq6ysTZ1K/4n2xdCX7AOYZlk97oS/ty4WL64lZXQf1P4Ma0WlM
 jlnQmNAunyeemzYOF0p8to4KKVlUpLDoP6HFDEtCRVNR4J3JXcaEVgZV2aJLVDo27VwrjSmmY
 a/q788FBrJOuvXIYYMNHFdWGm/34Uk6bJbVe1eTov5/nRs06zMQWo7UKW0P9ogGv60S7PuJaE
 3KjmjORWepyKVCKc4se66bv0LWMGs5DDZTUakeEFVPFQP5/rWUszgFXe5zRX7QN3hgc2DXSOg
 UWsr0PFPQVPevHiEm8JlUy6RLhdtoAAwtsUoG5reddqIjWC76xSxJjz1WwVnGNJ2a4TwFB/5c
 W0zROR6xOzPnBd/aay6DEfFKd2rFk8ZZewZcHBEwOdP4lcAXCN1eFPgKGKozseOGjSxg9k38+
 IoXlBUgeUKT3XM=
Subject: [Buildroot] [PATCH v1 12/12] package/gst1-python: bump version to
 1.20.1
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
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index a2f17583fd..fe1e2068b1 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.0.tar.xz.sha256sum
-sha256  8f67bdc5606ba33606c6bc896e89de7dcd8cf4fca459f71389b1b6fe075b5e54  gst-python-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.20.1.tar.xz.sha256sum
+sha256  ba6cd59faa3db3981d8c6982351c239d823c0b8e80b1acf58d2997b050289422  gst-python-1.20.1.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index a9cc32d1d7..3fd8059bee 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.20.0
+GST1_PYTHON_VERSION = 1.20.1
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
