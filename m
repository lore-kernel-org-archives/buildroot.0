Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3CFC77B75
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 12:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8F6661580;
	Tue,  9 May 2023 12:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8F6661580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omMbAVfjbQyp; Tue,  9 May 2023 12:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB5006159C;
	Tue,  9 May 2023 12:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB5006159C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 362131BF300
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 12:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A38640888
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 12:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A38640888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjYIoRe1BAas for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 12:23:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D5A940474
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D5A940474
 for <buildroot@buildroot.org>; Tue,  9 May 2023 12:23:57 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.225.6.203]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MGQjH-1pzsUX0F8H-00GqGT; Tue, 09 May 2023 14:23:52 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue,  9 May 2023 14:23:09 +0200
Message-Id: <20230509122309.192610-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:WCQLaZjvb68epAa7lXBewSn96AluviLwGPASa2aGcun/vl0ewgn
 W1e8thxFlmqXtj78Zso8Bvu1n7W7sZQIGpZ8kycviyMNyrtO63onupIs7L4FBf80NZGfxAm
 IxUEOJgDcBEV/yS16DXDH8meEDRI2gQkojAMu817sWLig0WjwjCBGD71zCYwSr9vSKJjDTu
 A4Ql0zD4UrJeF+hHyiNBA==
UI-OutboundReport: notjunk:1;M01:P0:ezhEmxmNGq0=;WTgY/SZO+JlLyI+ODlqtHk93YFm
 g7rXM3Ii4fr/Nn/ns/xjtlrl2S+dZ6fa3DumU0R7lL8SohILZy9+kfJ1pbotp9IkIfq/69EfL
 4ZNVTyDnSijM6e/Qij43ARjhn7Y+iLIEe5v6AorBQlKnybyEGgLCbkoGi0WbaMXFO2GbjcZy9
 hqU0zqGVwAik7KA5aNfSylSJaGKudDXWA0ZxgtML7nPKTwUC/Z6BbrN3gwWumNsDsNMxs8LEp
 tjxFCib7g3MFGkr+MroiKuHrt0foEDVzZrv8tiFqlLPzMEnGsEb/VRp+QkkKq1U9jDJ+cqQRB
 5DNL+clhphHu0Z9HzavcKh9Pzvmg43/h3XL5r7fWsT2mSrpSQ4A0iYhjjzph3cZgrqMixTOtF
 UaOZQP5wBO2TLikgCzxvoL5RyQlMbx8s7EaKkNFVumOrhPLtfgCpOKHbXVwAuX2S5oj9JUOR7
 c14Eb9zVWJe6Ko/jIyMxNqnyDr8+WcPGlXWyGhTjlxvTpQ+IvRlo6atizZ25JPLDErRxV1o4l
 z+Ca5BtOX3W8LUnqPiD0MwSmE32y5ySDyQKyJAf1isgPUygBvEL21E67hlT05eY4gLfSnUDLH
 SmhL75yMGLltp2SKqLw9SWlLjPC/gUhhIUBm6k7HbXpclOATodemTCHzJDlGYL2ETFM/XpwBU
 isiDbRHl7fWS4yFMKGBdqEzOgbjSUXGxJegvzftfdAs0SzPtGBK+ttLF2SvAeBkCKh8B8dnfw
 GH3xn9i6aBHsHYHowN0BIVEzmqLdApKVSE6/jHWxo+Av1mHjzNPV+N6oD3491X2u2oweGK9W/
 27fOU5K5z7m0zn1aaqeNIafNDc4QPmD1H2zFYq31af5PBJ519bWujApkqkIKJ86IqWG0rDKil
 4PseEOPGXOpar1AgSyAZK5bUimI5vRklN27zKCQ4RYT3plfNEmLMnAuIMXF8QXW8QR5G3r0at
 zJxrkAoptha3bwVoRv3KjpEkVNM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1683635032; i=dalang@gmx.at;
 bh=8n/tYao1/J705o/gCAIsBI3G41XvgBZCNKq7HujIQHc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=LR07EoFB1GYYwBE4AslXlAY2CPojBsT6BJVp+wOgpPK+IEa101Xlr5RVtzAHUEkyH
 32mAB6a+0rtnvooQWP7JQ9tuQ1DKcVVlrsv1e32zj1h1DhUGEcKQpCGs2bKFyaRrDN
 WGjMSBniFlN7uekYq/A8ItqDZ0FA5Kw1oc5TEOvdqCCp/7DGxcZh7dJNcAFAYDwEsd
 O7Y2i7vovGFGBTx+UZK0zD/OYD68MYNqMlJADdz0ZyM448ApAPKt/uBaAzCUas0OgL
 w7Not+ul4vDtqusUrl8S7Ulp5UJLee/VhazpO/uFIno4IWFnY4sIixgSvHvqlUffUU
 3/J9e4wf71rVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=LR07EoFB
Subject: [Buildroot] [PATCH] package/glibmm: bump to version 2.76.0
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
Cc: Daniel Lang <d.lang@abatec.at>, James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.76.0/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/glibmm/glibmm.hash | 4 ++--
 package/glibmm/glibmm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
index ea256c3add..ee50ccdb01 100644
--- a/package/glibmm/glibmm.hash
+++ b/package/glibmm/glibmm.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/glibmm/2.68/glibmm-2.68.2.sha256sum
-sha256  91e0a8618f7b82db4aaf2648932ea2bcfe626ad030068c18fa2d106fd838d8ad  glibmm-2.68.2.tar.xz
+# From https://download.gnome.org/sources/glibmm/2.76/glibmm-2.76.0.sha256sum
+sha256  8637d80ceabd94fddd6e48970a082a264558d4ab82684e15ffc87e7ef3462ab2  glibmm-2.76.0.tar.xz
 # License files, locally calculated
 sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 7f37da8449..da95329a3d 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIBMM_VERSION_MAJOR = 2.68
-GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).2
+GLIBMM_VERSION_MAJOR = 2.76
+GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
 GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GLIBMM_LICENSE_FILES = COPYING COPYING.tools
 GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
