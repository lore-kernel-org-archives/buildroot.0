Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E3DEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 09:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 035FE612B8;
	Wed, 14 Jun 2023 09:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 035FE612B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ZzuU33kIxOD; Wed, 14 Jun 2023 09:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB82A6125C;
	Wed, 14 Jun 2023 09:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB82A6125C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 145011BF860
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 520B441754
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 520B441754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z4ZQxDBFCREW for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A30441744
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A30441744
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38AC58349A; Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 11:15:49 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 017794abd6c9eec1a4f3d08d1d4fd03501828d79
X-Git-Newrev: b30617a79ba8722961d396fa551b5469e1761b8e
X-Patchwork-Hint: ignore
Message-Id: <20230614092354.38AC58349A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libopenssl:
 security bump to version 1.1.1u
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

commit: https://git.buildroot.net/buildroot/commit/?id=b30617a79ba8722961d396fa551b5469e1761b8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

fix CVE-2023-2650  Possible DoS translating ASN.1 object identifiers

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2bcfcec50285659c9921e8457fc893c8195e32a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch   | 2 +-
 .../0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch   | 2 +-
 .../0007-Fixup-support-for-io_pgetevents_time64-syscall.patch         | 2 +-
 package/libopenssl/libopenssl.hash                                    | 4 ++--
 package/libopenssl/libopenssl.mk                                      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch b/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
index c51a3cd684..ef40b0353a 100644
--- a/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
+++ b/package/libopenssl/0003-Introduce-the-OPENSSL_NO_MADVISE-to-disable-call-to-.patch
@@ -13,7 +13,7 @@ diff --git a/crypto/mem_sec.c b/crypto/mem_sec.c
 index 9e0f670..32c7282 100644
 --- a/crypto/mem_sec.c
 +++ b/crypto/mem_sec.c
-@@ -485,7 +485,7 @@ static int sh_init(size_t size, int minsize)
+@@ -491,7 +491,7 @@ static int sh_init(size_t size, int minsize)
      if (mlock(sh.arena, sh.arena_size) < 0)
          ret = 2;
  #endif
diff --git a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index b5070ad74c..9f34e1f5fb 100644
--- a/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -21,7 +21,7 @@ diff --git a/Configure b/Configure
 index 5a699836f3..f9152b1702 100755
 --- a/Configure
 +++ b/Configure
-@@ -1417,6 +1417,10 @@ my %predefined_CXX = $config{CXX}
+@@ -1424,6 +1424,10 @@ my %predefined_CXX = $config{CXX}
      ? compiler_predefined($config{CROSS_COMPILE}.$config{CXX})
      : ();
  
diff --git a/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch b/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch
index 4313eecd6d..7b003e4836 100644
--- a/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch
+++ b/package/libopenssl/0007-Fixup-support-for-io_pgetevents_time64-syscall.patch
@@ -23,7 +23,7 @@ diff --git a/engines/e_afalg.c b/engines/e_afalg.c
 index 9480d7c24b..4e9d67db2d 100644
 --- a/engines/e_afalg.c
 +++ b/engines/e_afalg.c
-@@ -124,27 +124,56 @@ static ossl_inline int io_read(aio_context_t ctx, long n, struct iocb **iocb)
+@@ -121,27 +121,56 @@ static ossl_inline int io_read(aio_context_t ctx, long n, struct iocb **iocb)
      return syscall(__NR_io_submit, ctx, n, iocb);
  }
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index ebc56b11dd..708926de80 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1t.tar.gz.sha256
-sha256  8dee9b24bdb1dcbf0c3d1e9b02fb8f6bf22165e807f45adeb7c9677536859d3b  openssl-1.1.1t.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1u.tar.gz.sha256
+sha256  e2f8d84b523eecd06c7be7626830370300fbcc15386bf5142d72758f6963ebc6  openssl-1.1.1u.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 6e84f06175..178979f43b 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1t
+LIBOPENSSL_VERSION = 1.1.1u
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
