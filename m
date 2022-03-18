Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AE0C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 20:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B31CD60B36;
	Fri, 18 Mar 2022 20:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6LzIE0YiDIY; Fri, 18 Mar 2022 20:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D63A760758;
	Fri, 18 Mar 2022 20:21:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 200E91C1148
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1853841715
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xEgixYIB-L-9 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 20:20:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 807FE417A6
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 20:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647634846;
 bh=VkcF/ex0TD7tjCyZgGbY4D8WcHe5GGQyEy6UwZwlR7g=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=T3lSJ3vrynUX5v4jwlLMKc2tlRfRZhDNsfpOheBCNCjyFDQY/d0c9nBaEUZBfi78b
 EcYII+wRh9PDgKsRy1933JoDdo7/wxtHhI/0YbuGoCA5LAEBkZJt2lHylbWOIjEHLw
 Ixx0ekmFcYBxyvqXzIMPvsE7oLsMr4507gckjnzs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.106]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N0Fxf-1oHFEn2XMF-00xL7W for <buildroot@buildroot.org>; Fri, 18 Mar 2022
 21:20:46 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 21:20:44 +0100
Message-Id: <20220318202044.10413-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318202044.10413-1-ps.report@gmx.net>
References: <20220318202044.10413-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:EM45Jd3AMZkv8y3xZ5nlFscOmS0NRYs/nBps51Wg/J0My0l1J1e
 EXeQgkoJG4JwQAe/o+19BvcPP4LXg7a9MSYP4nw6S/E6xL0DybDMCZarwQPqns43T7hiho1
 y/+XL6WpcJpPqRkjGss4lVBC7ngvc3bNjGVulSclP1qVe/EysRnM8izTZKM/NHuh/s0bIq6
 3nKg+lxiGWfLVjALrX+qA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:voaOhYWANZA=:hglc5UTviRsMpCt/0FJLX2
 4ezM4zMtzQcFm9mnLWsLVx55wIYW326SIA6b5qP2faIz8XAkib5r6jxGky4iTtHe4tF7uF2DM
 OFGzH+bSFNL4VL0MFi+kEPIII5wNhKjsJC+suzBiTrmxMAqxqq11CevqAARkxumeCAZnOfkPi
 wtcR7/0LvUM4obiuItIn9+PzcwQ3VNNfIWMfTDKYCw/Ah2h70I3LOBkwfgpTD1TKTNJ3UGYZZ
 MAK9VAiBYECuHhW5lJgXcfExoBIBoqnmj74Q8KdFKIhvB/Y1hm1zNq+KVMRfN7Ke3hfJeXVwu
 /MnFS2vhInmsnO6LwFYiDxR681wKoytok/WHeLsHpQofn0OT1XdkQuoagjMYgmcUUOS5pa+eu
 K27gVtKsDQZXNV1274OZogkJtwdM7TUvWwC7mokVsKdD8/YlaMmxEJt+93UCrcvg115cBiifn
 KpJubFyysfgCkl25JU4G1hg1fuLWiufTQaduKyqCAFhuVk0WFd9z/xJvyBTZpTIuEyyVNbRaA
 KtCjXRdZbeRhbGLCAKfcrMD7I/QIgHKhG59af86BnLSTQig/xKMOdSCTEu5XxjUl3y7GIj9+6
 +JoPczfscUW1ChVuU04eT/z3FjekC1YWjkK/FAFY9wVDeCDURPqm3vn5VFbfRDDX4S/frvDUH
 G6CEUbHbd3PILNk0M1573DkEA+XeqXibydgj0FG0AgNanqTJpBkwQfheXGNykXSxz73oXonV1
 MO8GaCU161VrkjYyDciPqUJcTg5PniqOgEifIgsjOI86x4mcjT1d3c1IKOUsS93jzhtgfyKWN
 3x3a5wDNmuhRe9feLE3g660lqVaUOFWAGgak1N8IoE4pqnzWxX+7rFcp3SQISc21W6HZsVDfA
 dQMe9S++VDTuMv9/h5PuY4FEGBiG5LQAOVCMZaH7B9QKz0hd0/Jx1pv6wXAPnjOmjAeNlaRHy
 dj5YEVAtPJstKcJMsR/Tq6jcvjA/3Pk3cbF8MJlw66CIPTQgE4Et+Cp1AggvXG84Q92p9FN8w
 HANYwqhfrWJQNsjqrD9VDfWs5pmIkviVuMvJIbEO0rvLxKBiWoxvrJHggXS1iIUdRbh+VIuch
 Hxu0WpMefFvxe0=
Subject: [Buildroot] [PATCH v2 5/5] package/wget: bump version to 1.21.3
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

- bump version to 1.21.3 (for details see [1])

- remove legacy --with-libidn option (see [2]), replace with
  --enable-iri option in case locale support and libidn2 are available

[1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00017.html
[2] https://git.savannah.gnu.org/cgit/wget.git/commit/configure.ac?id=a24e67e239ef949cc77a4c4e5a0beb703026a296

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split out from original patch
  - fix iri option enable dependency
---
 package/wget/wget.hash |  4 ++--
 package/wget/wget.mk   | 14 ++++++--------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 7f89bedb88..22674650a2 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3  wget-1.21.2.tar.lz
+sha256  dbd2fb5e47149d4752d0eaa0dac68cc49cf20d46df4f8e326ffc8f18b2af4ea5  wget-1.21.3.tar.lz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 69ca8f261c..079afbee48 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.2
+WGET_VERSION = 1.21.3
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
@@ -38,15 +38,13 @@ else
 WGET_CONF_OPTS += --without-ssl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-WGET_DEPENDENCIES += libiconv
-endif
-
-ifeq ($(BR2_PACKAGE_LIBIDN2),y)
-WGET_CONF_OPTS += --with-libidn
+# BR2_ENABLE_LOCALE and BR2_PACKAGE_LIBICONV are mutually exclusive
+ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV)$(BR2_PACKAGE_LIBIDN2),yy)
+WGET_CONF_OPTS += --enable-iri
 WGET_DEPENDENCIES += libidn2
+WGET_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 else
-WGET_CONF_OPTS += --without-libidn
+WGET_CONF_OPTS += --disable-iri
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
