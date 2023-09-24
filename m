Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AE5CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 077AF60F62;
	Sun, 24 Sep 2023 19:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 077AF60F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u7gPBEqhhw5B; Sun, 24 Sep 2023 19:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAA0E60F17;
	Sun, 24 Sep 2023 19:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAA0E60F17
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4795A1BF2A9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D291F607DE
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D291F607DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSTlLAfHcOal for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:22:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3D5660E4E
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D5660E4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1F7D875E1; Sun, 24 Sep 2023 19:22:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 21:19:52 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 5b0caa8efbfb75b2e47666201e17bf5e9c7600f1
X-Git-Newrev: 1ff517bd9a844cedaa2bafc0068bc50691b0de2f
X-Patchwork-Hint: ignore
Message-Id: <20230924192241.B1F7D875E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/freerdp: security
 bump to version 2.11.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ff517bd9a844cedaa2bafc0068bc50691b0de2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

- Fix CVE-2023-39350 to CVE-2023-39354, CVE-2023-39356, CVE-2023-40181,
  CVE-2023-40186, CVE-2023-40188, CVE-2023-40567, CVE-2023-40569 and
  CVE-2023-40589
- Drop fourth patch (already in version)

https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.0
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-rrrv-3w42-pffh
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-q9x9-cqjc-rgwq
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-whwr-qcf2-2mvj
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hg53-9j9h-3c8f
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-c3r2-pxxp-f8r6
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-q5v5-qhj5-mh6m
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-mxp4-rx7x-h2g8
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hcj4-3c3r-5j3v
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-9w28-wwj5-p4xq
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-2w9f-8wg4-8jfp
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hm8c-rcjg-c8qp
https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-gc34-mw6m-g42x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4ccfb2561f2a1e3ec874301e786f30d85307051d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...isable-sha3-and-shake-hashes-for-libressl.patch | 38 ----------------------
 package/freerdp/freerdp.hash                       |  4 +--
 package/freerdp/freerdp.mk                         |  2 +-
 4 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4a61d39f79..796c3c7573 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -454,7 +454,6 @@ package/freeradius-client/0001-fix-for-nettle.patch Upstream
 package/freerdp/0001-Fix-variable-declaration-in-loop.patch Upstream
 package/freerdp/0002-Fixed-variable-declaration-in-loop.patch Upstream
 package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch Upstream
-package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch Upstream
 package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch Upstream
 package/freescale-imx/imx-kobs/0002-Fix-build-for-recent-toolchains.patch Upstream
 package/freescale-imx/imx-uuc/S80imx-uuc Indent Shellcheck Variables
diff --git a/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch b/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch
deleted file mode 100644
index 14f615e2e7..0000000000
--- a/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bd093454fe126163634c00b7484ab7fee6ffe670 Mon Sep 17 00:00:00 2001
-From: akallabeth <akallabeth@posteo.net>
-Date: Mon, 20 Feb 2023 16:23:39 +0100
-Subject: [PATCH] Fix #8702: Disable sha3 and shake hashes for libressl
-
-[Retrieved (and backported) from:
-https://github.com/FreeRDP/FreeRDP/pull/8708/commits/bd093454fe126163634c00b7484ab7fee6ffe670]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libfreerdp/crypto/x509_utils.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libfreerdp/crypto/crypto.c b/libfreerdp/crypto/crypto.c
-index 6e87a88b8d8..62cf2939be7 100644
---- a/libfreerdp/crypto/crypto.c
-+++ b/libfreerdp/crypto/crypto.c
-@@ -748,7 +748,7 @@ WINPR_MD_TYPE x509_utils_get_signature_alg(const X509* xcert)
- 			return WINPR_MD_SHA512;
- 		case NID_ripemd160:
- 			return WINPR_MD_RIPEMD160;
--#if (OPENSSL_VERSION_NUMBER >= 0x1010101fL) || defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER >= 0x1010101fL) && !defined(LIBRESSL_VERSION_NUMBER)
- 		case NID_sha3_224:
- 			return WINPR_MD_SHA3_224;
- 		case NID_sha3_256:
-@@ -757,11 +757,11 @@ WINPR_MD_TYPE x509_utils_get_signature_alg(const X509* xcert)
- 			return WINPR_MD_SHA3_384;
- 		case NID_sha3_512:
- 			return WINPR_MD_SHA3_512;
--#endif
- 		case NID_shake128:
- 			return WINPR_MD_SHAKE128;
- 		case NID_shake256:
- 			return WINPR_MD_SHAKE256;
-+#endif
- 		case NID_undef:
- 		default:
- 			return WINPR_MD_NONE;
diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 55314cfdd3..02268f55ea 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.10.0.tar.gz.sha256
-sha256  a673d3fc21911dd9f196834f2f3a23c3ebc7e5e4deab2f7686fcec879279e2c1  freerdp-2.10.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.11.0.tar.gz.sha256
+sha256  8d08e638df21e67c3761462b4efb9e596576f58bd6886f902e6021cdd17d396e  freerdp-2.11.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 01c511819d..6f71ef796f 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.10.0
+FREERDP_VERSION = 2.11.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
