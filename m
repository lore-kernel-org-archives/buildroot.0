Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1FAC369B1
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 06:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E48B80C22;
	Wed, 16 Apr 2025 06:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DpIe71-k9ui; Wed, 16 Apr 2025 06:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AF2B80EB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF2B80EB0;
	Wed, 16 Apr 2025 06:27:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B2A4435
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 06:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C66260D70
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 06:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 99G_uqsvcoeH for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 06:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 215A660BF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 215A660BF0
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 215A660BF0
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 06:27:39 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 639D8440F82;
 Wed, 16 Apr 2025 09:26:47 +0300 (IDT)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 09:26:55 +0300
Message-ID: <4789a09c12708cbd48172f0c6964e6a7f18f36a4.1744784815.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1744784807;
 bh=74ec3iAG6mAZk5OXGv2r1Jjsl4MLicg2Tj3u3STkaO8=;
 h=From:To:Cc:Subject:Date:From;
 b=bOHe45EzuuoMG6oGJxppSR3CqJ1LuHAcsulOl9ladkrOjwmbu76pCG3DVGfusbsTi
 /alf0bcyqrGcig4sR9+Hr2EPuG6kRdYQZD8tSgr/ZCJDBlwrcn/n+XjIzzH9RpZwCW
 tjlQmBdLcPyS0BWHsNuewiWMSwR/jX5T68GoTBkC11KA8L5Jf+Q4XeCEZGMakagoxy
 fqx3C1IRfG6MaQmMNw0GgD9PHCno89UosOcgRDV1JxXubFhJQqHmaBpByBuqeJf1HL
 uUy6Xom4JLv8nd5LP4rgPW7VnahVH38qE9Y8J1HfKhm7+htRn8SWzEI38Tm8C8q1gL
 +/WdMl+1jfjZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=bOHe45Ez
Subject: [Buildroot] [PATCH] package/socat: bump to version 1.8.0.3
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

List of changes in this release:
http://www.dest-unreach.org/socat/CHANGES

Refresh patch.

Update README hash for changes that are unrelated to license.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/socat/0001-no-documentation.patch | 4 ++--
 package/socat/socat.hash                  | 6 +++---
 package/socat/socat.mk                    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/socat/0001-no-documentation.patch b/package/socat/0001-no-documentation.patch
index b4c3e1ffde41..5dbce0576e40 100644
--- a/package/socat/0001-no-documentation.patch
+++ b/package/socat/0001-no-documentation.patch
@@ -10,7 +10,7 @@ the package Makefile.in to not build/install its documentation.
 
 Upstream: N/A
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[baruch: update for 1.8.0.0; git patch format]
+[baruch: update for 1.8.0.0 and 1.8.0.3; git patch format]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
  Makefile.in | 7 ++-----
@@ -22,7 +22,7 @@ index c01b1a4a2306..fd89acb06f3c 100644
 +++ b/Makefile.in
 @@ -82,7 +82,7 @@ SHFILES = socat-chain.sh socat-mux.sh socat-broker.sh \
  TESTFILES = test.sh socks4echo.sh proxyecho.sh readline-test.sh \
- 	proxy.sh socks4a-echo.sh
+ 	proxy.sh socks4a-echo.sh socks5server-echo.sh
  
 -all: progs doc
 +all: progs
diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 136dce4a712c..b1c3d3cd11e1 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  7272fe53d51c63ca0e08e0339681803a  socat-1.8.0.2.tar.bz2
+md5  8ef0bc4f602636797917f8574c3b249e  socat-1.8.0.3.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  adc07a9c2723527cf6568d2fb96559794cf9c254a4bc2edd36f7f3789e9f7625  socat-1.8.0.2.tar.bz2
+sha256  01eb017361d95bb3a6941e840b59e4463a3fabf92df4154ed02b16a2ed6a0095  socat-1.8.0.3.tar.bz2
 # Locally calculated
-sha256  a18cf021c6380e8ef212c7a95460aff2d96fe9e2146bb09058651bc3b86f4d43  README
+sha256  f51653b61cf2516c39e8f2edefc11604d0f9d14f0c6ae988bef228a1f0283ad2  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index aa9a94aec44b..69f8f4045281 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.8.0.2
+SOCAT_VERSION = 1.8.0.3
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
