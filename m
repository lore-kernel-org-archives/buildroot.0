Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC88FC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F2140B94;
	Fri, 18 Sep 2026 18:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mx64ghHZCGR0; Fri, 18 Sep 2026 18:44:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6043040B95
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757086;
	b=r7XsNXdlJQs2A0Uy2xooQ1QVbDsrxdWpJ8OG5FMwoeZf3bN7Is6rp6VDD7uwALX62qz5
	 SxB45EyDK65mhplBO1WwcdTbTgceyuZnwUByAxyzakukHwovVnRVGPYFgOFYYLFpsKVyl
	 IJuF2+sjCF5bjHhmPYkJqk/vLG1DxPp5TYk4EAPjxsJSxpMBTspjRExje2cLBwCrLsIml
	 tn/jSzRg62vII3Yg0SWT54nM2aLy/KN8PBPtADX6gRhWX/KCEQMDPpJtFfPXlyauQHt1l
	 9fxEe769434Rb3h02wMuRzoj33oVZatN1s/T4nQXZn68i29fmr2VRHeEXxNI1aO5K4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757086;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3xyxS4KVKC2dfn+U11gKXOa/roedThs/bBVHqM71UBU=;
	b=rOBN8aDv4zkp1qKvottypDe8zHdv+3C7fo9ZWRH9/TwPtXEI+T3mcXa+19yicrTZHD0F
	 qLxe7IoafQyngD0vxFtiQmK4RywD3CWO8HEYNbBPQYZybJvc+GK4fzcg7GMmTydxAqaRa
	 j1BHJgSi4VvQANxSwdDYTqbcRn5+KAkf/5jWpZbtv9CUVs+CLovEilihke4tk1cAxG04a
	 jXDE4zUp1cIbmwUFr8txuejTk1oJMH+yc3otNB2R7lAdgfTWa94opSlgvzrE9ujTOX57q
	 Gk04WWThhG71tfmk418rlZepKKO+wmpdAofj0+fdglficHppEcV0TiD31G02q2wFIUQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757086;
	bh=3xyxS4KVKC2dfn+U11gKXOa/roedThs/bBVHqM71UBU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r4baOvSghQ+CPWG1KRH8QIAh/p4I1obdn4wBZIVR05VoeK3fSmY8dzyXdxKdVjN2V
	 WVZDwXXJq+PjuB1Tw8+BLROdRbDSjAsFMCcvcT6226X7qBv1NWQ3eXuv5ypf9JckmI
	 8RwBQktX3ew53hJdBpxxo7dXIXwMC3GCTdzR6FKh/DGM1cl+W0QqnOMpYkjWE/N4r4
	 DXBCv0ei/OiDQeN+qhsjNPsMleLjyaEcMFqATVDaxAvQuEIpr9VLm9eMWAZyBnTCDD
	 MvZbMtHBDEOLrGNIK0LeszcCCoCM1O/e7Tf+TqtKOX3iepYjlUWvDvOkcTxtdpKRAn
	 haPEqpfeHWFwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6043040B95;
	Fri, 18 Sep 2026 18:44:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 451B713D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36E676064F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUrI0Dth97tU for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:44:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EEF5F60617
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757083;
 b=NDQJ4g1hUrnOwCO82/vT+kE0pdXn2bPyALr/U962TwkL4hQwIl/FINNg8bFcIkF9+3yQ
 GrDyf/WjgHQcd8Wi6IGXcdvFi1ExkiSy8R3p0n4/OMT6vvTB0jy+6Lsm0Ya3rMkZ9yMYk
 fjRcjZBb6XNrK8D6F5vbGZulmCp9E74kWPkIiJZO7Hf9jFner3YZg7wRTrEnF12YiBR+8
 Zt760i5kjt/+aBspginpGNbheqdAQUt+xG2WdM2pjanAhySi8LI/9NDcPhCHGrqNX0te/
 jfDMv7UwdTOu4z/Jlof7JuiwyQI8EbtsJN+utGefLD8PeAQnZj9fkaAplAjHl4tpLnQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757083;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=CNy5zAhLaDCklTE51x8aKkyjsnEZxLRHE81bxb6+JjY=;
 b=bziQbuPhoXgxvdfEVfggjt5C3h4X2DgJcEO8Yaov0+paewHiHcM1WTO93V83DVqBCK/e
 8XJ8v2vjQXlK11h1noPfHW23jh3keuX4ONVG3w7f4XhKZCns5zXJa+rlOkikivwBVeIwP
 s/3zUmTH/otbcjqHzooQqR8Op5F5jY/bZc8VoIfVIaXkCCCU7qYmx9qzgBLBVLQVwBsjb
 9BwSkNdm7tIMJTIwleIXxsBk2abxNB4yyhrZ5e5I+AOYkoeXRrUReZHHQ9mF+rwVZrwCa
 zi3F4Ws5eXMmIQmpFckUAhZvHSBCamhKfI86Ca4fub6GzZqje6BELElAbC4xC8PVj6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iFIPhUgT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=iFIPhUgT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEF5F60617
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756906;
 bh=CNy5zAhLaDCklTE51x8aKkyjsnEZxLRHE81bxb6+JjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iFIPhUgT4VWBk3cao/BycGJG1uKuS6O0xfejpR1m+fcXks3oxyhwskXxwCa8rqqlM
 gCuZiTKN+XAh3GlVqsRbsf4opbhP30qy15FaoLHk8mqIEtbXGyGwOacYNSxarH0XnF
 0XAsO5Y8XIj+FxNf+ySih7ADhDAFMNsydz8VZQ06cCWxLGUQdNj96Vg5JNC6VKSKAD
 bL+LBlP7OuDu11V6f8aUEfyBFJiZh66gDnO+hDo1lvVznTi9vM0VNplPlEtjgITMpD
 c21yIJdZr4osoITndm4e6+sXSOi5RBARBC9gyaNX6X4sYJZBX+vLeAzQhQXX2pPZad
 kcmVazPU0YdbQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:fOYzLSpWdAhY56tiYiWXh3vDUP3qgCY1CLG9U3Ip3uU1sDMT85UdDjy7fdrKvqyJ/6I5i67RxYAjbzoeES57ZuqFU1TkHXeRlHyOLDSiptHNs/nUUJ40bTAc1oRb3FfP7yclyWFGQvgOvfLCKbsDE7JBYk/wSqjFcsOHNFu7QbBrRU4mCKj2JwY1GZ5NBkZcZ4fmnSnF8WyufB9Xw+xVnYjj8EfAv6pJB7pp0d9VYG2vzQlpROa+Twvjj+ydd5QDRNygztRjcKqp8L9MUj6RFaVZDr6I9G/vKkqZlK6UNQl99ZXpa34OIYsoo9avxhjw4QZYG1Ja3/X81cDJ3wew2A+W81+j4/VfxH1JLozgwpTStcFP856SSF5S0F4LJ1L5B6xQmugrvPTb3f2Cpzv0nxF8sra1affD49kWnzaI1n0Swkpca1BoQKZbxx9R72zerzX7FlcmXR/qVQe0wsUa7i2BW5zccRphaqwnaaUU5IyGCFFIhYWF5RjRMyxg+F5RGG10vnX2p72CqX6KKiNCJD4+Chv9guk9MMzwU3+vK16xMAbtOpOKrgeKiWZeUMA63UKt2G0+OcEv6ogkVp+TvcWYjifhDg0EzFCz163HJt+t78
 /8Tnx4yik/q1YlKc5UK719w2MFxm1Dw2D805PBFe6kSYopk/LShjB4rNaUrgimg17+pwtAIgF+
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5347DA4C4707;
 Fri, 18 Sep 2026 20:41:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWr-000000007cB-2o3v;
 Fri, 18 Sep 2026 18:41:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:36 +0200
Message-ID: <20260918184140.3631274-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 14/77] package/ibrcommon: update patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replaced patch 0001 with an upstream commit.

Added Upstream: tags to patches 0002 & 0003.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  3 -
 ...mplyfied-POSIX-method-to-get-the-bas.patch | 46 ++++++++++++++++
 ...File.cpp-support-POSIX-basename-call.patch | 55 -------------------
 ...-added-openssl-1.1-compatibility-264.patch |  3 +-
 ...sl-gcm-fix-static-build-with-openssl.patch |  3 +-
 5 files changed, 49 insertions(+), 61 deletions(-)
 create mode 100644 package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
 delete mode 100644 package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 04717ed2af..6e445434c6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -401,9 +401,6 @@ package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch lib_patch.Upstr
 package/hplip/0002-configure.in-fix-AM_INIT_AUTOMAKE-call.patch lib_patch.Upstream
 package/i2pd/S99i2pd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch lib_patch.Upstream
-package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch lib_patch.Upstream
-package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch lib_patch.Upstream
 package/icu/0001-dont-build-static-dynamic-twice.patch lib_patch.Upstream
 package/icu/0002-link-icudata-as-data-only.patch lib_patch.Upstream
 package/icu/0003-fix-static-linking-with-icu-uc.patch lib_patch.Upstream
diff --git a/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch b/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
new file mode 100644
index 0000000000..e52981b38b
--- /dev/null
+++ b/package/ibrcommon/0001-ibrcommon-Use-simplyfied-POSIX-method-to-get-the-bas.patch
@@ -0,0 +1,46 @@
+From fcea9d27f5153c8da77ebab956f75eaa1fd48836 Mon Sep 17 00:00:00 2001
+From: Johannes Morgenroth <jm@m-network.de>
+Date: Sun, 20 Dec 2015 12:51:53 +0100
+Subject: [PATCH] ibrcommon: Use simplyfied POSIX method to get the basename
+
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/fcea9d27f5153c8da77ebab956f75eaa1fd48836
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ibrcommon/data/File.cpp | 12 +-----------
+ 1 file changed, 1 insertion(+), 11 deletions(-)
+
+diff --git a/ibrcommon/data/File.cpp b/ibrcommon/data/File.cpp
+index 31af4ae7..5f8e24e3 100644
+--- a/ibrcommon/data/File.cpp
++++ b/ibrcommon/data/File.cpp
+@@ -34,10 +34,7 @@
+ #include <cstring>
+ #include <cerrno>
+ #include <fstream>
+-
+-#if !defined(HAVE_FEATURES_H) || defined(ANDROID)
+ #include <libgen.h>
+-#endif
+ 
+ #ifdef __WIN32__
+ #include <io.h>
+@@ -225,14 +222,7 @@ namespace ibrcommon
+ 
+ 	std::string File::getBasename() const
+ 	{
+-#if !defined(ANDROID) && defined(HAVE_FEATURES_H)
+-		return std::string(basename(_path.c_str()));
+-#else
+-		char path[_path.length()+1];
+-		::memcpy(&path, _path.c_str(), _path.length()+1);
+-
+-		return std::string(basename(path));
+-#endif
++		return std::string(basename((char*)_path.c_str()));
+ 	}
+ 
+ 	File File::get(const std::string &filename) const
+-- 
+2.47.3
+
diff --git a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch b/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
deleted file mode 100644
index 5cd302c979..0000000000
--- a/package/ibrcommon/0001-ibrcommon-data-File.cpp-support-POSIX-basename-call.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From d667b13a87cf3207599a19eb981a893a1d7a67ee Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Mon, 14 Sep 2015 23:25:52 +0100
-Subject: [PATCH] ibrcommon/data/File.cpp: support POSIX basename call
-
-Firstly, and somewhat strangely, musl chooses not to provide a basename(3)
-prototype within <string.h> whenever __cplusplus is defined. This can be
-solved by including the <libgen.h> header defined by POSIX 1003.1 whenever
-__GLIBC__ is not defined.
-
-However, this leads to a second problem. POSIX defines the function as
-char* basename(char*) and this is the only version supported by musl.
-However, the std::string.cstr() method returns a const char*.
-
-POSIX says that the string parameter can be modified. However the GNU
-implementation never modifies it. glibc therefore supports an extension
-when compiling under C++ by also supplying
-const char* basename(const char*). This extension is not present on musl
-which is the cause of the failure.
-
-The solution is reasonably straightforward; test if __GLIBC__ is defined
-before calling basename. If not, use the fallback already provided for
-other platforms whereby basename() is called on a temporary copy.
-
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-Upstream-status: pending
----
- ibrcommon/data/File.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ibrcommon/data/File.cpp b/ibrcommon/data/File.cpp
-index 31af4ae..68e9b4f 100644
---- a/ibrcommon/data/File.cpp
-+++ b/ibrcommon/data/File.cpp
-@@ -35,7 +35,7 @@
- #include <cerrno>
- #include <fstream>
- 
--#if !defined(HAVE_FEATURES_H) || defined(ANDROID)
-+#if !defined(HAVE_FEATURES_H) || !defined(__GLIBC__) || defined(ANDROID)
- #include <libgen.h>
- #endif
- 
-@@ -225,7 +225,7 @@ namespace ibrcommon
- 
- 	std::string File::getBasename() const
- 	{
--#if !defined(ANDROID) && defined(HAVE_FEATURES_H)
-+#if !defined(ANDROID) && defined(HAVE_FEATURES_H) && defined(__GLIBC__)
- 		return std::string(basename(_path.c_str()));
- #else
- 		char path[_path.length()+1];
--- 
-2.4.3
-
diff --git a/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch b/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
index 90e5147f54..8e890de965 100644
--- a/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
+++ b/package/ibrcommon/0002-ibrcommon-added-openssl-1.1-compatibility-264.patch
@@ -5,8 +5,7 @@ Subject: [PATCH] ibrcommon: added openssl 1.1 compatibility (#264)
 
 This patch adds compatibility to openssl 1.1.0.
 
-Backported from master branch:
-https://github.com/ibrdtn/ibrdtn/commit/a801d10a081e3130e24042256a43190c9eb6c112
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/a801d10a081e3130e24042256a43190c9eb6c112
 
 Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
diff --git a/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch b/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
index c55b227c0c..2045b8cbab 100644
--- a/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
+++ b/package/ibrcommon/0003-ibrcommon-ssl-gcm-fix-static-build-with-openssl.patch
@@ -15,8 +15,9 @@ Makefile:560: recipe for target 'dtnd' failed
 Fixes:
  - http://autobuild.buildroot.org/results/1d3b4b6cf043a3e185ce758b617a0a18c3d36cdb
 
+Upstream: https://github.com/ibrdtn/ibrdtn/commit/103bab3d4759e56b7e46cb9848e64037cd666911
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/ibrdtn/ibrdtn/pull/269]
 ---
  ibrcommon/ibrcommon/ssl/gcm/gcm.cpp      | 10 +++++-----
  ibrcommon/ibrcommon/ssl/gcm/gf128mul.cpp |  2 +-
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
