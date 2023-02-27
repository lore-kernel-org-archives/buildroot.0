Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A546EC64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 21:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE25417D6;
	Mon, 27 Feb 2023 21:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE25417D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8fo6VaW92eQ; Mon, 27 Feb 2023 21:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 441824175F;
	Mon, 27 Feb 2023 21:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 441824175F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6A811BF28C
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 911C281F51
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911C281F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e001H9z4AVkm for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 21:42:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D73681469
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D73681469
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 21:42:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.73]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1pB7XS24YN-00Muew
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 22:42:21 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 22:42:20 +0100
Message-Id: <20230227214220.12101-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227214220.12101-1-ps.report@gmx.net>
References: <20230227214220.12101-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ed32FNNLpsrRWW9jvvcRAssU7LJwczkOzv0EpQrHZ0pduFjyrnK
 ruhtoM1gfigRCJpxF+gKvgrQ+WGKPIdXMuN6y/WU9SjiVOhLQzpQoWARLccKUOH82gSugb4
 cprA6TMD8Z5Rh/XHe0C7R6aaiEBJOE0x252kxlplUZ/Z8+/RHLOjREPmbujKvgENNqTaSiz
 DQv6Oz6zS4at0NRK06GdA==
UI-OutboundReport: notjunk:1;M01:P0:09YbAGSwZvU=;KUv1olqDY49L89U0P/ZD/pVzc9h
 z0oGa1ofLsKNgKyy1D8+bs5YvykhIUJZekO3gxLUD18NIwBIhPkaAJw3zi0030j3dxv55BCIE
 j8qw6cbBhhbxHhKJRi8muJBZf6pO49Jsaehv/nDAsSgItQGHBBIdjHetB89496VfUQYTbHkXG
 NyPsq982AqKYZECra6nsK2+Gh+Z+DGyzUk+AYzE/dTLX4FfYshJDeqcwSW6jliZmKjl/Uvhgx
 ObafZBx9p0UJRVbQhyNbQbWZ7WLdJgRQ9x5g1uj/mp9we2axkNNtcDxfv+imRu1+MmwfUMgSE
 oOccKs6d9b0LddooIPDH10sW8ouiCCVXSEg//jyF4c9tuHUk4H4GDnWfIVaIObwEWvVLr1Mku
 Qw8SOgQOhuEpFqW6qCPm/Pvo1GVr8MmvI2+Paa97HFntRGgjsKrGwqnux5NE3aOCEpLgtf/se
 zTQwzgXXdECscy+RpW3v++kqTIbC30d51j8ZQDr6J+E3xjwlZI7wOaVSPzQT1Dav3Q5b1SLyr
 fVyxd3Nin46/r9nLpL6f2GNSlYKOtKUp5waT9D2cmNyrglQwRP3gDh+nVShJdfQlsVcXmTY1K
 opBc/qSZFbGjlmrwlgnxbyAegxXGU+6KYpjO8ljMNYHpValKchYPN/bxm9THHkj1EcaqFyb1E
 2PNtIOY4LowqOnUs7aG5cr89BCjGSXgOlXez/RYc9M+yURggiL4DJ59hhqEt9YR0g6dNy6WDM
 TGEb2bdXVtNTNKvqdumRVZby6n2EHVtDUh0Rk/Rxw2pn6RWYvIZsNlBhqZDY0hJGe9rOxrC+t
 nw1rIx1OZlGgje9hBsOTiEqGXQW2QSTqcRu/mXIIlV3LxYttnOSW3iCK/eimI/CXztE7/7qmK
 mZMISULqdipYOwo7qPZlr7Bu5H8M4sZ+jopZPFChNlQ1oac6RChScInfXOz4Z9jFUB+0posLr
 iDKp6SCcDSmHdBJbM9TDQMOUHQU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1677534141; i=ps.report@gmx.net;
 bh=tH0hOL85cthZYAWZOW0S+h0b1Wd8soAOwaOOMHIyJj0=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=UWQB0+BnBOBv3uhOIrl9HEyoKVTvEt5iEQOuAj95HdIl44fERPyT9mREhUGquHb2C
 k3OcKIJKfw+AknP/s6skWVL6IC0AgEf02ehXara00TVZsw/A/5oa+rzYy5ghV4gHD2
 CU1uBtoo415fUodmtksyJ2J8D0eSY/44CqCJtZDuCiUDDOJ9tVES9crV9kLLiVEv/u
 xdli22NgvKt8CLuxGpu2AHrdFn4tUpzuMMScqf7xJI4Oe9SSRvMuUEyKrsJ9CIT71n
 bbSepL7nQkHrSJvM42WxE6w4+Ln9s5tIhtVqubd9szFS7PPOe4f0y/jFUyWz1IRyZJ
 pdAIZy2RNW8RQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=UWQB0+Bn
Subject: [Buildroot] [PATCH v1 2/2] package/speechd: add default configure
 options
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

- add default configure options for all optional speechd features/
  output modules (disable all with additional library dependencies, enable
  oss)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/speechd/speechd.mk | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index b545863035..5944ea3a28 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -14,7 +14,22 @@ SPEECHD_AUTORECONF = YES
 SPEECHD_GETTEXTIZE = YES
 SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
 SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
-SPEECHD_CONF_OPTS = --without-kali
+SPEECHD_CONF_OPTS = \
+	--disable-python \
+	--without-espeak \
+	--without-espeak-ng \
+	--without-flite \
+	--without-ibmtts \
+	--without-voxin \
+	--without-ivona \
+	--without-pico \
+	--without-baratinoo \
+	--without-kali \
+	--without-pulse \
+	--without-libao \
+	--without-alsa \
+	--with-oss \
+	--without-nas
 
 # fix missing config.rpath (needed for autoreconf) in the codebase
 define SPEECHD_TOUCH_CONFIG_RPATH
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
