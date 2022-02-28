Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DC4C433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 09:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EADD540943;
	Mon, 28 Feb 2022 09:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnnuvLjNfwAE; Mon, 28 Feb 2022 09:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EC7B4032E;
	Mon, 28 Feb 2022 09:05:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB3291BF2B6
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 09:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7AC040286
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 09:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zy85X5qlm_us for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 09:05:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 936454027F
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 09:05:51 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1Mv2tE-1oFL7U0iXI-00r1Vn; Mon, 28 Feb 2022 10:05:48 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 09:57:00 +0100
Message-Id: <20220228085659.17489-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222095340.29327-1-nicolas.cavallari@green-communications.fr>
References: <20220222095340.29327-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0cae9/1PeAAYZIA0EJgrsRJr8rXT8Z05fFkza1xqGdgZDcfC6oM
 uzdTSF3uNHSyd1RghxMb/GQcjtQnRJ2L46M0dA3lxKiL6SdGJUYYprXP3viuk4Z+//rQ5Ly
 IUO8aT/RKcjY5giiDjnzqnRrFCBcJOIGxaCI2X3VpHCUwtqiCQzNmkKC9h8yGZtSm0Otock
 DG9mc2t/au0Ag/8m6pIrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M2YEjTbpGsA=:m4FoVfhAkj9Zx6HKj9oBFR
 KQ/si1Kz/0nWokJ6cEsD50TvzrgsbunocUoEchGPynpeajAeJeA6rOocQtYpw7qPGVuPEZiFc
 0HElyn+4ncVYWAR35y8FyqUrLw0XM4YiLu4u9G5zH3vHY/Ct3mhYd5GjkECgUinFrTfTphCr1
 e6Rcnx/v2LWez45YAYjHuNauFmyr/iZSqg5EBh346K0oTQaBlsY6f8iElbKbKBzmzkoBxVSDl
 AvKbiOK8Vp4dFhX1nWCw/1zvzcRIwuVi/PWtohx45oStuMx1aGp8VU73XIydIPDf8WrJmZDAB
 QCIKFdNFSR+yeHPh4dr2bn24BWtaibFbj1cvd293Gu6/2Rrc7aerDSWRGpQe8y+GFqZUGVgAd
 vaB/RA9aNTW5Z1NWoJiftoDfjl80Eg6qZGHpaqWPTndOn99pB3SD3Bc60/kOT+3MrNnGkhUzS
 OsyQ9GouSQ/8Mg8cFis3RpAgRaO15Uaaf+rNz0edYLam6ROUhJeOAiMQPW1q3X56wudaYTMZ/
 89G4o/MMWRBefXYwiTRpgHUQ7Lm0P46W3bRXkGogRO8ynJS0MPnr/DJ5PmWF+Nig5XARoGwDH
 tG8yIyk5Rz/Dl2fbjT/pEMQvUljyEJivtdS+sgi/Y8Xp0y8l69MnoeFlc8+MFUXI6TIVcIQms
 Op81OlSVzAA1bxv6DtCmA6ZuZumFES7h7FRpI+wDLG2kwVnuzquz3ZeaJA6fRzK3WiibdkWTv
 Jfz66r9qQOpRLFndEPv996UV4ioWQuLykPCgrQ==
Subject: [Buildroot] [PATCH next v2 1/1] package/libgit2: bump version to
 1.4.2
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

v2: bump to 1.4.2 instead of 1.4.1

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 07b1a260a4..ada411ea22 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  192eeff84596ff09efb6b01835a066f2df7cd7985e0991c79595688e6b36444e  libgit2-1.3.0.tar.gz
-sha256  8b7e4f54f8bf210c8fe010a49571a1ee57463ef020cc43f051d4d3fbb74942af  COPYING
+sha256  901c2b4492976b86477569502a41c31b274b69adc177149c02099ea88404ef19  libgit2-1.4.2.tar.gz
+sha256  0092f24acc306ee3287dc05b5e85cb9e0e48cd3f11c60c4625b1a673a5912616  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 6cc0f1ea74..e94dd9c370 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,21 +4,20 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.3.0
+LIBGIT2_VERSION = 1.4.2
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
