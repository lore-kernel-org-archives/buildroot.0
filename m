Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA06BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B309405AA;
	Tue, 22 Feb 2022 10:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrSiD5zbLI00; Tue, 22 Feb 2022 10:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30511405A8;
	Tue, 22 Feb 2022 10:06:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75EC41BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DF0340137
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JULsf6JSkhPa for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:06:42 +0000 (UTC)
X-Greylist: delayed 00:07:37 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08BF7405AD
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:06:41 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1M2wCg-1nNYrZ3QFQ-003J7T; Tue, 22 Feb 2022 10:53:57 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 10:53:40 +0100
Message-Id: <20220222095340.29327-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:jZjBNQEEnVv1w2PCdslYLeAQ982favVARYdbaQNQjQgTSBCTRZG
 MrvZ8b7QmpXsBo+NQSN4OxyOYJesFCj+IT8Hw7Wk1NFyTW/4Cp+lrP7WYQ8vocPl0uPfyUF
 ADXvj6F7pK6dFnDbmSdVsSWIa5CnGhtlJdWmRN2+z+XEaoYwXA2o2eXbzQX3SqhIoj6wW6G
 /Dt0Xj91HaCMyDDtM44Mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+nQMu/LQh6c=:Bv5ZTQb0k0RCpeF5+loU9B
 263HpQ38SKA2KQFybsicF9JQcPoneL9XBj95CWHITdCdEfzYzg4t+xE3shcNlaKJUseNb52Ge
 uUS8sDecQjScooGUOTxKSrIvaVmoauZaQbZRvViHL6HthlZSO8JXh7fTKsG4mZf5IgCy7Q+CN
 aUWNGzH0L3rES/jiKQuvMKxGMBx3YzFeS8pN4TjmCDaByZJVIx0pEw/p3ezWjvf8g1h1u+er8
 OGnKqyO/N/Q8j76UmoYNR786w7NYaW0aLa6F4j0lk2LYcu9WrD+NGphjVSOTjPzc7GXtXC+6F
 K/KCgIooJwT2LORqkOhCPLlnmJcjZQ0oVQ4HNfeznznjjnJ64to7LecqyZ1DA3NXlrHPZgzUW
 gZbII5am+uJ9KXGKUZ/nMM5hXtkTAU00r2kwkzcpOfw8ICgNi6n/X1p3XfQRbVGKHZtp8kH5f
 VqXNLqDsxHK1y36oMu3g8yyRgNCyp1Dg5tqMncaF8JfCW1rjhm9mumm7KE1r0mywIs1N9+Uqr
 mb3WaZZHfxv/ic5c1yCvXBt7Q2Uf+42ryLW2sMvHGiMwHWxX4VFn/ZJsXK7JgvNvTPAcZPITI
 NpamY3DBlVA+TgmkGIr97bna+ynbuC+mdZE3mGmAadRc1e3hvKXUSw7wOBSJHQhWDihIzirJd
 btpQKJeYAY8uxPGckb0DS1CgWqj2jwReXueUAfIpAkFGWRgNmNDo1rEla7DuGsHb2t4hOSuHN
 wqqmX5JwKSRhpgAHE5xzOhRIdAqkBjMOxwarFw==
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.4.1
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

Licence changes mostly concern vendored dependencies (that buildroot does
not use) and a new bundled PRNG used to reimplement mkstemp()

Some buildsystem options also changed:
- THREADSAFE is now USE_THREADS
- BUILD_CLAR is now BUILD_TESTS, which the cmake infra already give.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 4 ++--
 package/libgit2/libgit2.mk   | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 07b1a260a4..a6b5ecff1a 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  192eeff84596ff09efb6b01835a066f2df7cd7985e0991c79595688e6b36444e  libgit2-1.3.0.tar.gz
-sha256  8b7e4f54f8bf210c8fe010a49571a1ee57463ef020cc43f051d4d3fbb74942af  COPYING
+sha256  fccd371a271133e29d002dd207490d22a0c9b06992b874b8edb8366532a94f54  libgit2-1.4.1.tar.gz
+sha256  0092f24acc306ee3287dc05b5e85cb9e0e48cd3f11c60c4625b1a673a5912616  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 6cc0f1ea74..47cb0cbcd8 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,21 +4,20 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.3.0
+LIBGIT2_VERSION = 1.4.1
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
-LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
+LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch), CC0-1.0 (xoroshiro256)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
 LIBGIT2_INSTALL_STAGING = YES
 
 LIBGIT2_CONF_OPTS = \
 	-DUSE_GSSAPI=OFF \
-	-DBUILD_CLAR=OFF \
 	-DUSE_ICONV=ON \
 	-DREGEX_BACKEND=regcomp \
 	-DUSE_HTTP_PARSER=system \
 	-DUSE_NTLMCLIENT=OFF \
-	-DTHREADSAFE=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
+	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
 
 LIBGIT2_DEPENDENCIES = zlib libhttpparser
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
