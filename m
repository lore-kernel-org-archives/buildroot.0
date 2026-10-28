Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98E6606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Xws1R0J+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=U5DHIBHr
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6D6460709;
	Wed, 28 Oct 2026 22:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtiH0G9UuxT0; Wed, 28 Oct 2026 22:35:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4CEED6072A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226925;
	b=Bj59vvhbHkjsfd7/4ucrTgmWt8vWr8qkps4VUr3qsAxMEuzk4WTHkXi81zpM867YGtKl
	 498UDK6IfA1Y/3v9hF78xo4Lf6t0S1eydFwBNJ5Sz+iasPI121pXXcMaOSCeN2HZSv1UV
	 JBqXIWs0bfOtyaKK1bw+nMF92VVrKXZCciTiYpt6qwtkLAFeIy2q5zLDJVzQLFYayClWT
	 szilvJuS70dOQKMQxtrUzZlDjU1ZFplb7r7cYhmA9/mXNYvtdAatl0L3InsWtp13ri5AG
	 8/d5BE9CcDHFIdRhD/QVZRTp8V+QShY/5N74sqNuOJKsqZckgn44qf0aAAJnd6h1KyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zwQRU8xb1MG6XRN80wTE85MVerq/mPrMyAaKADrSNMY=;
	b=s5/64x0DBCDsSq69JiMB/ACRNnjrH1FSJ4VGGeHA1JLiUqgleOQqSsRrBQzk8+KKZ32Q
	 5Uidj0LXtYGCc2eY4NYfsGE1a1cueHDX/aRsVOrRYHPhU4wybOaJy/c+ogTnqNWlVJC2V
	 1yO0VzPmkoxQTQjtWDRlh2O6fp0EdvkkBDwf2mTiLzT4qYjp2sqE8TF6kqWc6L92AzebT
	 MtxQkBY1E3bsqLc84mAMW78XSl6lVDNNeF9A8ISW/Sgkob9i3OlbPAuB73G6b0ARh5d/W
	 MvlfdMjeWDl8qkEw83N+Lg8nggTlWx9sRbVEPx0JM4PAGBzaVN1gwP/P9lkx+Q7AZEQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226925;
	bh=zwQRU8xb1MG6XRN80wTE85MVerq/mPrMyAaKADrSNMY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xws1R0J+ZIbL6YL9BHvMQoN0cLd7WXvS7CbXb4ZrDkCeVAhNxrBKXNumA4n3q+XKg
	 XJt5BuuymiTCbkPDLhbylJTKU5berxyo4Q/kYURaKDpK9VwsL/g+iSjgLhnYrk6Ejr
	 6oZsmomqHa3SKz37jfcKGcD/2xOEPRHBUtlgNOQOawiZTTmIoZ6r4pRg+GYCIM4XlY
	 yorHEYRiPvIlOfW76aWIMk14YdogVmgh2XKUwinNZfa4oQqZI9GSMTTn6n/cEMu01f
	 O9PrdIfTEpMM6jIoELutsD0d1fRBWt0nbzrIqKh9ho4KsGPhqZ5ZM3b4oKz6mZp6dm
	 td7YoPwuBAPqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CEED6072A;
	Wed, 28 Oct 2026 22:35:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C2AF2E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E31381160
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MBeF00uCXny for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:35:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B536281149
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226922;
 b=j4xcUu2T8XMD2k5/OYJU8jioXihfeBzgLDX4DEczi4IpsOzh6eW5kQIi7MbZgdChcpZi
 6Xl1eH8JPaEBfcInjFRILonzNunPUpLROIQUHTYIMHv5hl4cfEoHICaF2JVaO9HcsBkuN
 RIS9cAyN4t3EoZoac2MdEmVCgYMG+RckKrn6ypHhDDDEUehubPBAZxDCimpZKPkTOsrHH
 9HRm5IKxowfKsz3nxbOqWCROQXXWyv5X6Lg8qb7VZhuxJDuQaxWbXgPyASX06zdtcprPI
 H24G97WNxZqr85uYEV3R54agLwCSMvlz2G9JBdXTUMbOT4G/T/FR5A6sA8XVzmwGGAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226922;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5+2ETS7ITeS4aOt0axM5v8SKeLc/8Mo+qMcToccSCPc=;
 b=sivMqBmxFyqoQvmZTu8zLOm/wHk2fyYKGCI52UyZgYCHI9Nbu9MErid59KuxjDMZE9We
 /li4FeGCvD4D7SK9IcxIbN1GqU/eSiRf7DQYvKp7rOTB9bgQvRWI8ZBiExSfARSW0r0pn
 BetLh+NYsFsGqSyNOCZVO4urUQDV7Ku4ntpC979pACFeOakheZXvzzdike35TaRNfuTwl
 9bQhJaCixGA8dewAfmBYzILFC5sNbKyxYeBMPuQFLVWyFeEj3F4c0S7isR2y0jBboKeur
 dMuF+UNZTNd6kKgWH1aHF/P1g51vIYTz/htkHerYHMewT2adHQbSDsxZ+4Tl1Ek6S/A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U5DHIBHr; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=U5DHIBHr
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B536281149
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226602;
 bh=5+2ETS7ITeS4aOt0axM5v8SKeLc/8Mo+qMcToccSCPc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=U5DHIBHriaKwpYHs0UG+3tgC0v3k3HRrSf4Wo62qwxLyLf/i4O9wgEnNctDnEUEmr
 nS24gn8MJK5uB5WoN6e6KBLrB0o7FY45h3HJ+Qm7racTE8dYE9K3XydzJbrGpU9AI2
 ZdfKXJ61ut3lWHzHsZDqNZ/bLokvfvC3tF9r/dZxNIlJvqfHuMuiXn/Wbs1aSIkGMq
 y4ljVL+lr7balj2PqI8LOHR1oONFQGCk6YXfoNrLsrA9Xg8bxlAAVokUGlfTWlgXY1
 ZNa86MbuvLIGNQPzRJ7NuYudbSQO2dLf+aKxql47i6fHQddUa8dkmFN/a+PbiISlX6
 2/ey9FP3EGgBQ==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 81T8xa9AjohXBwCk+kPnG3GMXIcWGBoZAI+HbmLRzmMbNSs1q6Yl1vPDM8x99JsL7bzztqKymP2
 Vr1Dnmwh0vLqXqAzPxVzLYrpWZVRO0NQURz70u2i1voHmRkYDRaINmLhmlVwKJxehi6Qoyj1gy9
 oOqvKIn/hufvlBRfgZM06zNEOkztYsPYxI9l3S0qhz7sNSGC67GTT1wz4hHEUGsAfsAoWlWkaI/
 Y+B/OvhqsEveP29JGJ7R8FrZ3lePBb9PvYJMfZt7PfOfg4OZAsfLZX7PURDpByycF8yxTcQvqJz
 inq/rn4Gxv0KF5rxSEzbzje9d3EYh7AJcdxy05mskvbWkwGJ/Wgyc73ZfG+QiP0oho3jdhoMRin
 8w+jWQvI++BQXIiaweVdudh0yciA4EHI3cbvY3okLX56B2LBvO9ZXcN5xMJJoaHpllcBrYNaXo9
 kiJzL/rYEV7qcAeQ22XC7BAdfA8PCYdyPVpQvlDV0DJRn0mGrO7xSAme7EOisIe+4ve6RmRum3V
 b0OfMDa3BgXqO4MSNE1fb3+b1mpsObe9Rh1qM0MvUykj/KbPSkEGXn7QV6+Z0Zph3VZVUCMxeny
 pPAgLQ==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B92EA4C6FE8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:30:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9K-000000001i7-2vym
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:31 +0100
Message-ID: <20261028222936.514451-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 14/18] package/kodi-screensaver-rsxs: bump
 version to 22.0.5-Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-CMake-4.x.patch       | 346 ------------------
 .../kodi-screensaver-rsxs.hash                |   2 +-
 .../kodi-screensaver-rsxs.mk                  |   2 +-
 3 files changed, 2 insertions(+), 348 deletions(-)
 delete mode 100644 package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch

diff --git a/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch b/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
deleted file mode 100644
index e9f80a98c4..0000000000
--- a/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
+++ /dev/null
@@ -1,346 +0,0 @@
-From f6ad95576920944e64a368ae4074812efbcedc4b Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Wed, 11 Mar 2026 21:58:40 +0100
-Subject: [PATCH] Fix build with CMake 4.x
-
-Fixes build errors with CMake 4.x:
-
-CMake Error at lib/Implicit/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-CMake Error at lib/Rgbhsl/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-CMake Error at lib/rsMath/CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-Raise minimum version for all addons.
-
-Upstream: https://github.com/xbmc/screensavers.rsxs/commit/0635422964b6797d693866483d16dff51bcf4b57
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt                    | 2 +-
- depends/common/bz2/CMakeLists.txt | 2 +-
- lib/Implicit/CMakeLists.txt       | 2 +-
- lib/Rgbhsl/CMakeLists.txt         | 2 +-
- lib/kodi/gui/gl/CMakeLists.txt    | 2 +-
- lib/rsMath/CMakeLists.txt         | 2 +-
- src/biof/CMakeLists.txt           | 2 +-
- src/busyspheres/CMakeLists.txt    | 2 +-
- src/colorfire/CMakeLists.txt      | 2 +-
- src/cyclone/CMakeLists.txt        | 2 +-
- src/drempels/CMakeLists.txt       | 2 +-
- src/euphoria/CMakeLists.txt       | 2 +-
- src/feedback/CMakeLists.txt       | 2 +-
- src/fieldlines/CMakeLists.txt     | 2 +-
- src/flocks/CMakeLists.txt         | 2 +-
- src/flux/CMakeLists.txt           | 2 +-
- src/helios/CMakeLists.txt         | 2 +-
- src/hufosmoke/CMakeLists.txt      | 2 +-
- src/hufotunnel/CMakeLists.txt     | 2 +-
- src/hyperspace/CMakeLists.txt     | 2 +-
- src/lattice/CMakeLists.txt        | 2 +-
- src/lorenz/CMakeLists.txt         | 2 +-
- src/matrixview/CMakeLists.txt     | 2 +-
- src/microcosm/CMakeLists.txt      | 2 +-
- src/plasma/CMakeLists.txt         | 2 +-
- src/skyrocket/CMakeLists.txt      | 2 +-
- src/solarwinds/CMakeLists.txt     | 2 +-
- src/spirographx/CMakeLists.txt    | 2 +-
- src/sundancer2/CMakeLists.txt     | 2 +-
- 29 files changed, 29 insertions(+), 29 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e93c31bc..1a9ca89c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensavers.rsxs)
- 
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
-diff --git a/depends/common/bz2/CMakeLists.txt b/depends/common/bz2/CMakeLists.txt
-index 6b1a0a56..b83f34dd 100644
---- a/depends/common/bz2/CMakeLists.txt
-+++ b/depends/common/bz2/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(bzip2)
- 
- if(NOT WIN32)
-diff --git a/lib/Implicit/CMakeLists.txt b/lib/Implicit/CMakeLists.txt
-index eef20e3b..14fb63d7 100644
---- a/lib/Implicit/CMakeLists.txt
-+++ b/lib/Implicit/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(Implicit)
- 
-diff --git a/lib/Rgbhsl/CMakeLists.txt b/lib/Rgbhsl/CMakeLists.txt
-index 984ce9ba..ca01c592 100644
---- a/lib/Rgbhsl/CMakeLists.txt
-+++ b/lib/Rgbhsl/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(Rgbhsl)
- 
-diff --git a/lib/kodi/gui/gl/CMakeLists.txt b/lib/kodi/gui/gl/CMakeLists.txt
-index 6fc4d87b..1b096d79 100644
---- a/lib/kodi/gui/gl/CMakeLists.txt
-+++ b/lib/kodi/gui/gl/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(kodiOpenGL)
- 
-diff --git a/lib/rsMath/CMakeLists.txt b/lib/rsMath/CMakeLists.txt
-index cc31d308..76100e89 100644
---- a/lib/rsMath/CMakeLists.txt
-+++ b/lib/rsMath/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5...4.0)
- 
- project(rsMath)
- 
-diff --git a/src/biof/CMakeLists.txt b/src/biof/CMakeLists.txt
-index 810bec46..ec344ba8 100644
---- a/src/biof/CMakeLists.txt
-+++ b/src/biof/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.biof)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/busyspheres/CMakeLists.txt b/src/busyspheres/CMakeLists.txt
-index 41650ca6..cc829bd9 100644
---- a/src/busyspheres/CMakeLists.txt
-+++ b/src/busyspheres/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.busyspheres)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/colorfire/CMakeLists.txt b/src/colorfire/CMakeLists.txt
-index 3667cbd4..f8da4884 100644
---- a/src/colorfire/CMakeLists.txt
-+++ b/src/colorfire/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.colorfire)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/cyclone/CMakeLists.txt b/src/cyclone/CMakeLists.txt
-index 8af4172f..084f928b 100644
---- a/src/cyclone/CMakeLists.txt
-+++ b/src/cyclone/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.cyclone)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/drempels/CMakeLists.txt b/src/drempels/CMakeLists.txt
-index 1ebd427f..d4c38a95 100644
---- a/src/drempels/CMakeLists.txt
-+++ b/src/drempels/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.drempels)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/euphoria/CMakeLists.txt b/src/euphoria/CMakeLists.txt
-index d3f55ee3..de2e2f67 100644
---- a/src/euphoria/CMakeLists.txt
-+++ b/src/euphoria/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.euphoria)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/feedback/CMakeLists.txt b/src/feedback/CMakeLists.txt
-index b37c430a..fd417d61 100644
---- a/src/feedback/CMakeLists.txt
-+++ b/src/feedback/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.feedback)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/fieldlines/CMakeLists.txt b/src/fieldlines/CMakeLists.txt
-index de60dda8..b0dc30b6 100644
---- a/src/fieldlines/CMakeLists.txt
-+++ b/src/fieldlines/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.fieldlines)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/flocks/CMakeLists.txt b/src/flocks/CMakeLists.txt
-index c2b4a793..a15db4d8 100644
---- a/src/flocks/CMakeLists.txt
-+++ b/src/flocks/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.flocks)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/flux/CMakeLists.txt b/src/flux/CMakeLists.txt
-index a2de0b2a..6aeda787 100644
---- a/src/flux/CMakeLists.txt
-+++ b/src/flux/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.flux)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/helios/CMakeLists.txt b/src/helios/CMakeLists.txt
-index d64a6194..6feb0ac2 100644
---- a/src/helios/CMakeLists.txt
-+++ b/src/helios/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.helios)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hufosmoke/CMakeLists.txt b/src/hufosmoke/CMakeLists.txt
-index 44d13231..b4fe79a5 100644
---- a/src/hufosmoke/CMakeLists.txt
-+++ b/src/hufosmoke/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hufosmoke)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hufotunnel/CMakeLists.txt b/src/hufotunnel/CMakeLists.txt
-index b18ce736..f8c67c85 100644
---- a/src/hufotunnel/CMakeLists.txt
-+++ b/src/hufotunnel/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hufotunnel)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/hyperspace/CMakeLists.txt b/src/hyperspace/CMakeLists.txt
-index 6bd303e2..5733be37 100644
---- a/src/hyperspace/CMakeLists.txt
-+++ b/src/hyperspace/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.hyperspace)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/lattice/CMakeLists.txt b/src/lattice/CMakeLists.txt
-index ef884e4c..9f9455f4 100644
---- a/src/lattice/CMakeLists.txt
-+++ b/src/lattice/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.lattice)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/lorenz/CMakeLists.txt b/src/lorenz/CMakeLists.txt
-index ab3026f6..35f749d9 100644
---- a/src/lorenz/CMakeLists.txt
-+++ b/src/lorenz/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.lorenz)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/matrixview/CMakeLists.txt b/src/matrixview/CMakeLists.txt
-index d98a8f14..d5f77ec7 100644
---- a/src/matrixview/CMakeLists.txt
-+++ b/src/matrixview/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.matrixview)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/microcosm/CMakeLists.txt b/src/microcosm/CMakeLists.txt
-index d05b639d..65437c28 100644
---- a/src/microcosm/CMakeLists.txt
-+++ b/src/microcosm/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.microcosm)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/plasma/CMakeLists.txt b/src/plasma/CMakeLists.txt
-index e7fc7956..fd25963f 100644
---- a/src/plasma/CMakeLists.txt
-+++ b/src/plasma/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.plasma)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/skyrocket/CMakeLists.txt b/src/skyrocket/CMakeLists.txt
-index 8a89f28f..8e9e0500 100644
---- a/src/skyrocket/CMakeLists.txt
-+++ b/src/skyrocket/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.skyrocket)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/solarwinds/CMakeLists.txt b/src/solarwinds/CMakeLists.txt
-index f1ef41c7..2417edf0 100644
---- a/src/solarwinds/CMakeLists.txt
-+++ b/src/solarwinds/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.solarwinds)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/spirographx/CMakeLists.txt b/src/spirographx/CMakeLists.txt
-index 2ccb751d..41a245d4 100644
---- a/src/spirographx/CMakeLists.txt
-+++ b/src/spirographx/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.spirographx)
- 
- message(STATUS "--------------------------------------------------------------------------------")
-diff --git a/src/sundancer2/CMakeLists.txt b/src/sundancer2/CMakeLists.txt
-index a0e47a6d..a3bfbbe9 100644
---- a/src/sundancer2/CMakeLists.txt
-+++ b/src/sundancer2/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.5)
-+cmake_minimum_required(VERSION 3.5...4.0)
- project(screensaver.rsxs.sundancer2)
- 
- message(STATUS "--------------------------------------------------------------------------------")
--- 
-2.47.3
-
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 86174991f0..b9378e1576 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  76c1df60f3b4bf4c61f827e07ac61173e3b72defe6ab54d1a1fa34f1cd6f38ab  kodi-screensaver-rsxs-21.1.2-Omega.tar.gz
+sha256  4e44e6b6e804b81208c6d47f156e63e24d5af0e61fa46d5959c61e00ba2b36a8  kodi-screensaver-rsxs-22.0.7-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index dcca031b51..f04daed71c 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = 21.1.2-Omega
+KODI_SCREENSAVER_RSXS_VERSION = 22.0.7-Piers
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
