Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED406EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 09:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D82C60EA1;
	Wed,  9 Aug 2023 09:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D82C60EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MVZjsAYlYDed; Wed,  9 Aug 2023 09:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A166560B77;
	Wed,  9 Aug 2023 09:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A166560B77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2778F1BF34B
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 09:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E2C44026F
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 09:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E2C44026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPMKRZmp3ddd for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 09:23:45 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AE3C400BB
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 09:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AE3C400BB
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MXp1O-1qJiD41V8O-00Y6mx; Wed, 09 Aug 2023 11:23:42 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 11:23:16 +0200
Message-Id: <20230809092316.25721-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230809083328.1348-1-nicolas.cavallari@green-communications.fr>
References: <20230809083328.1348-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:s6O8SUcZQp+MggltZsY7/rYNQ6cuabu2nPGM7JmxvgSFCzjMBSw
 U2R0sMWcWsXUBdvI9s7q6f/eueAq63T15TRMWwisHlPr4dAqw0yFZ7U5LHdc6vG+QbVtA0i
 GpSiFgsZmP2KUKQ8adzwQs5s4i5OabjjG4xCjOtE/ud1jzGGGbT3U2+iP3L7Uq8Qsdbgrfv
 JV4X1zSr+slbKm9An7bow==
UI-OutboundReport: notjunk:1;M01:P0:drTDJr2f3RA=;PlbZ92u3OnLxLoeQBav1Q/rSKJJ
 2gWXb2iq9kv4CwzqQ5s76vs4TQxTp5PbTjmXWjOCQMTdgAHAPb1sv+0V+XNKyd5fTQlLNZ8P/
 /shGwqHGPZWI4BS2aGPXOSHnSA2+TTSvAvnUMsFykEL7nB3e4KtjTmuuh9RfnWt02cWMp5pyo
 NfAXv49LyiuUeoaNsrqFZ8Yq0jTn8w0hHduBvNACSBmc1AObliKgy1p7+z0rc7Ac17c4AGqec
 /9JHmqxw21r1gqFWx3dlkUoNKHhaYIncPqtegtp1ZmfiS+/H4hGH9+ftcpiCQOTXdFLXpYmaL
 OgNWbEnVuJsv/n8xA4XoRlKBfMemi/QzJW3Ctdcv1TOQeNpbQsj7AImJivKpgq0tlJyog7Y/r
 SIbvcxmetl8MqR4s4RYAeYYNffmID3423+p7Go/HSxw/C8GjdsCb7MdHuC5Smxz2L6h0w+xtJ
 icOVy5lsBPir1P3yAsa3UiwWXsHWlE9zjgme6iJP5QR5SIXJwl2odE2DNKHv4vLNW7y6VT1C6
 5YCKa83YFSq2wmJ+kK6wfphGAB2JakNQZgRx2YNX0Bv1yKay8loQrz8yD1dD4qA5IrV6C+Ztw
 SsjobKTFpnE1ED7Hkd2LSOgcnMANwygKPGguqfA+Qii97bcSPrnFmObriHi/NP94+MbcU4K3q
 9tpoq9ikdwkp3KeVDo0NqQC7lcfR6Q4HmnANVhh76v83fL5TEbCJb6uPYWjUKBshe8CStRcz1
 EM7C6+ehupVnRlV/KRnfc2DT7UIq7CkRwCd9q3M79xqdbVPNJNSzW2/hfcuc0duKCthK3YPER
 DV3iovf9UQ5sPI7kO2Bbu3ittEvtu4K/AZB9Eb1KE5IN3rSaFOPm9cj+UUBPgv3lItrenFGUE
 WZTYD2bSX4eUD9JW3zdKVPJpo65ee3xPqbUQ=
Subject: [Buildroot] [PATCH next v2 1/1] package/libgit2: bump to 1.7.0
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

This version makes it explicit that it uses libxdiff, a library which is
not maintained upstream since 2008.  It now have numerous forks, none of
them sticking out.  For now, use the one which is bundled in the libgit2
sources.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
v2: add sob and next prefix
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

Tested with test-pkg -a with 12 configurations
540 builds, 142 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 4dd6519ca3..1997c3ba8e 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d25866a4ee275a64f65be2d9a663680a5cf1ed87b7ee4c534997562c828e500d  libgit2-1.6.4.tar.gz
+sha256  d9d0f84a86bf98b73e68997f5c1543cc5067d0ca9c7a5acaba3e8d117ecefef3  libgit2-1.7.0.tar.gz
 sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 9ddf2374bb..93505f7d85 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.6.4
+LIBGIT2_VERSION = 1.7.0
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
@@ -12,7 +12,8 @@ LIBGIT2_LICENSE = \
 	BSD-3-Clause (sha256), \
 	wildmatch license (wildmatch), \
 	CC0-1.0 (xoroshiro256), \
-	BSD-2-Clause (basename_r)
+	BSD-2-Clause (basename_r), \
+	LGPL-2.1+ (libxdiff)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
 LIBGIT2_INSTALL_STAGING = YES
@@ -23,6 +24,7 @@ LIBGIT2_CONF_OPTS = \
 	-DREGEX_BACKEND=regcomp \
 	-DUSE_HTTP_PARSER=system \
 	-DUSE_NTLMCLIENT=OFF \
+	-DUSE_XDIFF=builtin \
 	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
 
 LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
