Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7479C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 19:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AA0060BD7;
	Thu, 10 Feb 2022 19:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsGrFio63Z_V; Thu, 10 Feb 2022 19:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8F4C60BCD;
	Thu, 10 Feb 2022 19:30:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E7ED1C1135
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E12F81B25
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 19:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UgDkr4QgO6CQ for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 19:29:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52681818C0
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644521346;
 bh=3uB2T78QfaPfFe//JaRu/FREy5CUjG8HrkDjh4d0mKQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Nn9zbL5duths3JALDULs/zIPWrs5lukqCXjh6FYp7CnjS7UaMpc1vpzj8ZKDzopzi
 EmSmh8v5E6z/EFDLB6CGxchajrduSFDNLeSoK+FBaI+MFwRXf5ok/7oHJYLjOPTgnd
 4rJeWeQyyDDT3ZQyKINGSBo3nd1XcSokQ0iRutFY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHEP-1nyTVJ2UoN-00gtXe; Thu, 10
 Feb 2022 20:29:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 20:28:55 +0100
Message-Id: <20220210192905.4500-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210192905.4500-1-ps.report@gmx.net>
References: <20220210192905.4500-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vswkOkn0BB45bH0u/z21qEBKtV1dht7Rm7/wIHYB4nVbmoZEAkG
 S4PcsTpO0uzMP8WIzBJOg2vUg/0/0onxU5DVceFQyKhj1LegT6aRHoAOCH5JYhLu9tF0NHI
 gxsjXcuikskzmBK0bKqgGRzyhiBtdam9he8qY7EjFQWJ/3tw9w8284nZTlPxBwrGO6w4TpF
 Ks0caD3oL1zCr9skE47fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6K+AnoXGVGo=:iWk/Nf3M0EA5U8oDFRB1sk
 Cdp++O4zhSkr3aqL4c0ncWYzU3M9m4Sh3Ht0SRvKIAe/W/j49KXDLeO57He8b6t/HSKLjk533
 i+O+oFTsrsDmfgEgTw53TJBpRQVRpaGV6BmOgP/yV5anA5cZcuJaSVDhOCR2512p1vlWettVd
 y4mbGuJi1jv+yX6prZ7h/Dt96RLb5NM25f66Wx5J1iWlD+LdUb4Zp53AwaAfQsDLAaf2CPseO
 Kez9pzTNhTXfd77BsNj/367N2CvUwxCB7Z21wUkUgABcvTFvJ/c8T/pF8ZcdbclvgYxTB6U8j
 DCoiKKYKLUT7A0cPR2uHQ601aXvOeE2lc/wj65ceWp73/rXn8cJieTR7dJhoxoafKPGQAWxfE
 KwLUxmQFyKOnGakJRIuXOlVGRmtxn1VUWgpKSg9WjwEvQMxmTiR2YFeuj0oY77t+v/GOf1xei
 X9zR/zDizNrIVLYjsJEnu6mhhp67LoGHuwKYbyXMIwcUbjHU3LB4/OjCvNTrJaylCtbdxl/bh
 lIdz3hIEFPBz8bvhHJA1qnzfMFnxH5sdJZLkxPvJ+yObPEFzkGP5rcEWj9PjZmy257Lk8AduN
 fo4mCx04h2h4840ZazuLOetNhtplYgrlsNKOJM2zNk9xd4xveT/d7slNUPv0lLieOrZlykKzY
 jaDJpuDGRHfKv3q8aQ1UONHCQLloLK8hHcsaI95lpHds+jBt7leeS0Q58DbqTQyhwOYQ7JQMI
 o5bPsJL4RUIStSebzI2UZvkoqzo8ObcX12x0NDRXuNkkOfEhSi/O7VjgLLyeah4in8uj2gDSl
 7QWcwmHZvIaFpaUv1Xdgz8BJnNIriDDahgyvUWm0KOpjCvbsj51/3KC8SuJAQXO7D0jaqYdwA
 mVkUXvO18FA6Gh/MjgCxNsxOdqVcU6PNo+zg1nQRhFS7hcsiIzCBEJQfHsQpFmrzfWF2fXUBb
 zTH6LioHyrf3z4AHeC/eI4Q4+BAGADecY1iVmSsRJ0yvI+yZxrqfWpetPU1GBQPrWPYsxpR4D
 b+QuWPPZq6McD3q1f/a2Jm1TNZW6ywUZ8CQbezn+f7sBebkmEy6OVBDRA7ic33rnaqoRwSxs/
 LktENntb7S/JBA=
Subject: [Buildroot] [PATCH v2 03/13] package/gst1-plugins-good: bump
 version to 1.20.0
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index e342bd133e..9ad1d7bf46 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.18.6.tar.xz.sha256sum
-sha256  26723ac01fcb360ade1f41d168c7c322d8af4ceb7e55c8c12ed2690d06a76eed  gst-plugins-good-1.18.6.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.20.0.tar.xz.sha256sum
+sha256  2d119c15ab8c9e79f8cd3c6bf582ff7a050b28ccae52ab4865e1a1464991659c  gst-plugins-good-1.20.0.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index e0ca29c5fd..6298d578ed 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.18.6
+GST1_PLUGINS_GOOD_VERSION = 1.20.0
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
