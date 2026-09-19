Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD04C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D02E40CA9;
	Sat, 19 Sep 2026 16:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4krb8QmbE4l; Sat, 19 Sep 2026 16:10:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 418A640CA1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834211;
	b=tCIJ1z7M5vOAt29istiH2Cnqfk+FpE8RKTL5/KY8dL4bC7/2sv4Gq8udafsv7st7GrqZ
	 U4U1GQAYzCgqCFZuAtrkFax8wGw4HKxv4CfJNHi5pbBHSHGfd+GotvmBTbK9p8ZjVN5vm
	 qTTLNyRtL0Nh5DZTo1G6TCP4thdEHmAGd2JT+PvSUyAnXLs+l+PBu7y0GZHRtqUK97X9n
	 kjdbO/ZL+YWiPYePQ5lrAMOXWVyoh1nCRcn4OOS8750rQjjId5ki8dOSFlcyFeSlahg5V
	 Ct+eSZa2vWqn6KNVaIdgXu7g6CJmhjTxJ/YdSVkZ2Zcc/lXb/7uH7n2NZNfXhvmaNxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	b=bbcAIktvIJAO4bqxw+VDxDvd/iRZ1CgLFhTRSwnKNV2j/UF8cH55bVmVaBV0aS+WjP6u
	 xHVGtoPpq+IfsujCP3meDCUE7mT+pN5x7MjmRmrRzFr6oP09qUexRaxJ74LLPj3Vvgtpe
	 QQB0P4o3RsRAD0PwG4kMxHy+CRzbMayAn6SVLUC++yFdGAzPBBQIUbLiApMHPK0vTsaDr
	 8Fym5gQAG5R6E375h5MBZamcxrcJTH2SHkZ00VA/CIyXaG+fG2xXOuBWTQLZhn60tk4fl
	 DS33BrC62OlO4UVK3FyuO85RJS4ceG4KSSEg87Yjp1HwkeGm+MX7l5TOC1Y2/Jqa5zQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834211;
	bh=kfrIUnFJddXligp5o1bf4GMQAoIiFDq/3I1rAeVxUGM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fGbMSnILeEvl2HjePK3n2+ykkmleWuwqbQUOlffiW8IXY9NVu46f8QpJXxdU3/1/w
	 FB+7gG5EU1jSlc+pV5s6H+yIMeBO1Wo1OL6BjMapldcUgmidquia2GC9XWPuGdGrWb
	 dDBGcGZlqMLMeaSGMXsTj1ChkkYKmtOaBblll00B2gzatdFEohnJj/I9PmwvVdzOmw
	 OBle12SqercTGaJ1pKHu81ec4HN1NRbdszWQkRzoildHLjbtCVSqfLTCrCan9aiK2W
	 K8vfdJlu07JOPE9EHOSsNcQua4AGfdIfVnS6c0IdXVipCZpAkxq2JbOPgH9hdwMjWp
	 +nU28XgOoPBhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 418A640CA1;
	Sat, 19 Sep 2026 16:10:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CBF037A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E2B5606D0
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZRsIay17XDS for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:10:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DFBB5606A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834209;
 b=P1Pc9eDm0Wkgh1YnxMcugP7n/NyFDZ2wP5g+IaHZSqciqZUN1hjFGR9mmO7fzkKzC4g5
 Qv+YpnSLSZzqGduBlXBvw7mj3rEiXmHWWCjhiyL9ezIqCnFn6QPJ+DnfczxZvljPgWzBm
 mvzAYxl+0mZxu3gWvIuZbz9DswqP5pAeHgkFGGfBcVnXh97e4YI7hGZkbJ/3PizytJgI4
 FpZxyCyrQa1miXMtNP2aI+XDgpghHUq+9JyBjebj0ocVypVMNGFM4FIH3cQoA08ulS0N8
 TEYLEwzZCPuRQlVu5UBgXE3hL4hwqEjv0zgqPWf8f95/ggt8XCwFOOhu2C0Rou3xSCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834209;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 b=hdjXeHAvG8yNTmak8Vnjubh7LOi4BYp8GkoFrDTboeN5nMZ2018AkYekrf9b35nbhVUf
 gT6l4VfCldo0VDDI5BVSZpVNUEzPHHFVjLqxTDq0W1Uu9HFavyC3VwpokRSCvPx4TriQU
 G05qC8K+y9G5Lcl/5Zf0r5aqCfHOGdpVdybhKS62WEnV0gNaLF+QbrmHS2bQkHamNmr3C
 Ehf2gNSi//pevnM1rvn9FkDBsMGaAlrNTDz5FIlxrr66mF5EI97TypmgRjgHwO7KewUKB
 toH81T0axFoHXiU5t4+uKpQeUTMmSQWSCKBGFyhMu4i81E2cZNbo8pQxs+lywMiXBTA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gI6ZGeEx; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gI6ZGeEx
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFBB5606A5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833552;
 bh=c6blAAJ4GzKToeaMUd3+zDieEcpFcztMaavOiHvLLKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gI6ZGeExRvEv/W4PAFFKOLy0yHvqW19j651t+U1XjLExEveZKBXmDHEL5LA2wBP/r
 x+o/x6aGv480A8grG6mhcdeaLoqTDP9hR9skkSVjwPiovamlwfqUNpZBIOyK+88yop
 9P23RN1aByCOJ1LvVMEMK88RztKpYBNeQjGWTuOnzIyp+BJpax+28EuoswoBiykrEl
 eccxkO9agHyU8BK2C7pdDYaEZx+mUhDTbsiz+rvIQr60xSueAZs6Qt2xS6G9bwRvrs
 c+FYbM5Z3BbtRMCVpNU0OlZi6f2inEZfRyoB9KBopBvvjZsh9vRQUCnkD6Mt58cf5n
 UwWMAK/EVoy1w==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:D7jopibK+LZrY7V0cf5IdxWZAmLEgedZTc4Z3R5b+/L8usj+sP1fVCimvLnON1mTrGO/2/9hXgjk3xaWFnJb828olQtog2wtbG64snLU12wRsl15nDMF0lARLKMH7Ne/Oz/MH5Dhr9df1ul3KohXPBywmbfyGth4Q1K6E136Zk8aWdgFzS8TgbWgtqWMg8FlvUrUS5kBF2Zy5Suh9J5HgsrzITL6LxyOwN9aCT8IkYsgB7s59LPunc8uP/pYrpuJT6c7WaPyeJyL3KQ5ZgMKXkFPuTbThjNEADcOyDeqjgIbknsI8jeDCYfDB9SrpTkbNa9oUoube0Pu7gtB3PqN2DDO83Jp8+AMUfZ5WnA84XIKNultsMF4sfr8kFPXp0V/5KYd4qWRreXomdkz4up2gw9VQVsoNMpnf+wTyE7QxQM8eDRYw1SIiZuwqL1+3uKAp/dRII4PvYNwHFzUzQsnuOQb4yH8yRPcrTu5I3wmoXKfvzIBOeUi66i3m1t8xBXxmb4J2Gn5Q8uibiLSXcooV9OkQ1znoOIkV59YFgq9QZdzUgek+8hzyvIW0/iTmAOvZOGzsHjOM5CUecxN9j+g49FlAmecShuvCICYI5Zz/pzu8x
 GDduFiUV4pYKB3CUL3yuLYAI2olglA/VG488H1b518twQTBrC7bs8MMuCli6Ub0A/UFK6j
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6DB13A4C47D3;
 Sat, 19 Sep 2026 17:59:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSr-000000005Jx-3KY2;
 Sat, 19 Sep 2026 15:58:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:13 +0200
Message-ID: <20260919155845.5776-49-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 48/77] package/luvi: fix build without c++
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
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 00317f0aff243986983650671fd220ab040af50f bumped the
package to 2.15.0 which first included upstream commit
https://github.com/luvit/luvi/commit/262d5f7dff3484285cd8b3bf2ed32ff0f13c8741
that added the miniz submodule.

The version of miniz used by luvi contains commit
https://github.com/richgel999/miniz/commit/05ab4dc05c9d1e1f951f5849b659e2c7e291a620
which removed "C" from the project variable causing a dependency to c++
which causes build errors when the toolchain does not support c++:

-- Check for working CXX compiler: /bin/false - broken

This dependency was not intended so we add an upstream commit to fix the
problem.

Fixes:
https://autobuild.buildroot.net/results/2a5/2a5cf09dc9303b11e2a2769c5b0b319284ec1bbb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...eLists.txt-only-require-a-C-compiler.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch

diff --git a/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..c68e05bdc7
--- /dev/null
+++ b/package/luvi/0003-CMakeLists.txt-only-require-a-C-compiler.patch
@@ -0,0 +1,47 @@
+From 383e551cccf41fc2ce1177712d6a37a85d936642 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 22:56:00 +0200
+Subject: [PATCH] CMakeLists.txt: only require a C compiler
+
+Commit 05ab4dc05c9d1e1f951f5849b659e2c7e291a620
+"Add some catch2 tests" dropped that C flag,
+but should instead only have added a simple
+enable_language call for tests only.
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+
+Upstream: https://github.com/richgel999/miniz/commit/383e551cccf41fc2ce1177712d6a37a85d936642
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ deps/miniz/CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/deps/miniz/CMakeLists.txt b/deps/miniz/CMakeLists.txt
+index 156df83..e0933f8 100644
+--- a/deps/miniz/CMakeLists.txt
++++ b/deps/miniz/CMakeLists.txt
+@@ -7,10 +7,10 @@ if(DEFINED PROJECT_NAME)
+ endif()
+ 
+ if(CMAKE_MINOR_VERSION LESS 12)
+-  project(miniz)
++  project(miniz C)
+   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
+ else()
+-  project(miniz)
++  project(miniz C)
+   set(CMAKE_C_STANDARD 90)
+   set(CMAKE_VERBOSE_MAKEFILE ON)
+   # set(CMAKE_C_VISIBILITY_PRESET hidden)
+@@ -309,6 +309,7 @@ if(BUILD_FUZZERS)
+ endif()
+ 
+ if(BUILD_TESTS)
++  enable_language(CXX)
+   set(CMAKE_CXX_STANDARD 20)
+   set(CMAKE_CXX_STANDARD_REQUIRED YES)
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
