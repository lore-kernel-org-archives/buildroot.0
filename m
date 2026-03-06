Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54B5FCC05D
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90411613C5;
	Fri,  6 Mar 2026 18:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vz_3Druao3lg; Fri,  6 Mar 2026 18:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD56D613B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822435;
	bh=IcF3Q//ckE4YtHIy6yiGi3vZr7ieZqkyGVITTW0XP3U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tH46KWdWVZlZcC5NZYCeLkZK7uTuooD/ftR94Elj4UKqe1uwatE0rgSK/bUbvvB6u
	 jyXFqLGObyZK8bPeidazyVBKWrxAxQsRoSq8yjpgfL+wyEskT49xzbzaww155YzR75
	 UFCHXUu4NJTay2ZpmYG1uvrSUWeoKqeht9/T1tbBGjuh0bPMXdHnuwzdZYNnMBC/0A
	 zJ1i82jfAv/f3onjJtRGhTg9UVEXkIZajC1QlzZV7VxBBhdsTpU0yi60hWmV+iplim
	 JhlD1LXWFXN2Bu7wtIeqb34yVBLGMsMujJeC9umGTkRjS1s476GkHLKmaSLb0bFSSY
	 NY+KvFhsANT0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD56D613B3;
	Fri,  6 Mar 2026 18:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BAD5725B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACA6D83CF2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R14G3dUBC6RM for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4158383CEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4158383CEF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 479BE83C32; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8313d8a2faf8423cacef7acc88bc385201beb05d
X-Git-Newrev: d3b8010197f4a7909e5c34bc4641d9da4adc833f
X-Patchwork-Hint: ignore
Message-Id: <20260306184030.479BE83C32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/socat: bump version to 1.8.1.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3b8010197f4a7909e5c34bc4641d9da4adc833f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

http://www.dest-unreach.org/socat/

2026-02-12: Socat version 1.8.1.1 has been released.
 It fixes compilation with glibc 2.43, xio-netlink.c for Musl, and a few
 minor bugs, see file CHANGES

2025-12-08: Socat version 1.8.1.0 has been released. It fixes a couple
 of minor issues and provides new address types TEXT and STALL and a few
 new address options.

Rebased patch 0001 due to upstream commit
https://repo.or.cz/socat.git/commitdiff/2cc1f11d02928e7eca9560506dfc6e97a0ac92e3

Updated hash of README, used as license file, due to version bumps:
https://repo.or.cz/socat.git/history/HEAD:/README

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/socat/0001-no-documentation.patch | 4 +++-
 package/socat/socat.hash                  | 6 +++---
 package/socat/socat.mk                    | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/socat/0001-no-documentation.patch b/package/socat/0001-no-documentation.patch
index 5dbce0576e..13e9e503f2 100644
--- a/package/socat/0001-no-documentation.patch
+++ b/package/socat/0001-no-documentation.patch
@@ -12,6 +12,8 @@ Upstream: N/A
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [baruch: update for 1.8.0.0 and 1.8.0.3; git patch format]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Bernd: rebase on 1.8.1.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.in | 7 ++-----
  1 file changed, 2 insertions(+), 5 deletions(-)
@@ -22,7 +24,7 @@ index c01b1a4a2306..fd89acb06f3c 100644
 +++ b/Makefile.in
 @@ -82,7 +82,7 @@ SHFILES = socat-chain.sh socat-mux.sh socat-broker.sh \
  TESTFILES = test.sh socks4echo.sh proxyecho.sh readline-test.sh \
- 	proxy.sh socks4a-echo.sh socks5server-echo.sh
+ 	proxy.sh socks4a-echo.sh socks5server-echo.sh socks5server-auth.sh
  
 -all: progs doc
 +all: progs
diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index b1c3d3cd11..3a4eec60c1 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  8ef0bc4f602636797917f8574c3b249e  socat-1.8.0.3.tar.bz2
+md5  5456f0f0c5d4505b68edcb10e23ef128  socat-1.8.1.1.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095  socat-1.8.0.3.tar.bz2
+sha256  5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b  socat-1.8.1.1.tar.bz2
 # Locally calculated
-sha256  f51653b61cf2516c39e8f2edefc11604d0f9d14f0c6ae988bef228a1f0283ad2  README
+sha256  86e46422f9381b386bd2eb6606f9d6c3ff479f905660d0f318c571292ab304b8  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 69f8f40452..3d40540599 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.8.0.3
+SOCAT_VERSION = 1.8.1.1
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
