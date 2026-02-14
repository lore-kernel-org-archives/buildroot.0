Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13255EF5851
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 20:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D8DF60EA9;
	Sat, 14 Feb 2026 20:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sPSlPq8FOAm; Sat, 14 Feb 2026 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D65160D98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771099949;
	bh=BmRGXTHhqTMTv7htWSM5gJjH+JlD6gZK+AGWuxQMWG0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=koLJXRegZ1iYQi245eCvoa930tly/7sHzuvKPvabmWc0SQmgmFA/7ct13b//EIVJ/
	 GjQUYaJmkYkpNe6UdvZQJatHNx3//bPSqsaP5AxyvYlRAn+nJ+hFfrDmhI3DlyTTAF
	 MCh0iJeCsiJgUQY05nnw02poBiUPvMo1JP2eLsKZDksi4q12naZKgR5uReKzq83Fly
	 1UqgGEa5jI3/dAky4wLm7PNzVrP4hx4FnPIRpsmRP/j3ag85ahwym8RbZ2UiOMLa8z
	 V2L0qPz5f6IfUMn3uv1TYGlh+S7tSk3wMSPPCJjZCG3x6ddgQN6kkHrKC2+tGcvhGG
	 nSiGtLDhroGkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D65160D98;
	Sat, 14 Feb 2026 20:12:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3346669
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 181D382410
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5W1fbyPceP3 for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 20:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45440823CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45440823CF
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33E8A86D66; Sat, 14 Feb 2026 20:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 21:08:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f481e3110db0e7df14420e225a6b8f10855324a
X-Git-Newrev: a99a3d844a8ba0b53e04f5bde47f83c0072bda36
X-Patchwork-Hint: ignore
Message-Id: <20260214201227.33E8A86D66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlsec1: disable des support
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
Content-Type: multipart/mixed; boundary="===============4160614963128439272=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4160614963128439272==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a99a3d844a8ba0b53e04f5bde47f83c0072bda36
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libxmslec1 build fails on some configurations with the following build
logs:

    CC       libxmlsec1_openssl_la-kw_des.lo
  kw_des.c:75:8: error: unknown type name 'xmlSecKWDes3Klass'; did you mean 'xmlSecKWAesKlass'?
     75 | static xmlSecKWDes3Klass xmlSecOpenSSLKWDes3ImplKlass = {
        |        ^~~~~~~~~~~~~~~~~
        |        xmlSecKWAesKlass
  kw_des.c:77:5: error: initialization of 'int' from 'int (*)(struct _xmlSecTransform *, xmlSecByte *, size_t,  size_t *)' {aka 'int (*)(struct _xmlSecTransform *, unsigned char *, long unsigned int,  long unsigned int *)'} makes integer from pointer without a cast [-Wint-conversion]
     77 |     xmlSecOpenSSLKWDes3GenerateRandom,       /* xmlSecKWDes3GenerateRandomMethod     generateRandom; */
        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  kw_des.c:77:5: note: (near initialization for 'xmlSecOpenSSLKWDes3ImplKlass')
  kw_des.c:77:5: error: initializer element is not computable at load time
  kw_des.c:77:5: note: (near initialization for 'xmlSecOpenSSLKWDes3ImplKlass')
  kw_des.c:78:5: error: excess elements in scalar initializer
     78 |     xmlSecOpenSSLKWDes3Sha1,                 /* xmlSecKWDes3Sha1Method               sha1; */
        |     ^~~~~~~~~~~~~~~~~~~~~~~
  kw_des.c:78:5: note: (near initialization for 'xmlSecOpenSSLKWDes3ImplKlass')
  kw_des.c:79:5: error: excess elements in scalar initializer
     79 |     xmlSecOpenSSLKWDes3BlockEncrypt,         /* xmlSecKWDes3BlockEncryptMethod       encrypt; */
        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  kw_des.c:79:5: note: (near initialization for 'xmlSecOpenSSLKWDes3ImplKlass')
  kw_des.c:80:5: error: excess elements in scalar initializer
     80 |     xmlSecOpenSSLKWDes3BlockDecrypt,         /* xmlSecKWDes3BlockDecryptMethod       decrypt; */
        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  [...]

This build failure is due to those struct definitions being set
conditionally in src/kw_aes_des.h behind a XMLSEC_NO_DES define, and
this define ending up being 1 on some builds. We could assume that the
makefiles in libxmlsec should just not try to build any DES related file
when XMLSEC_NO_DES is set to 1 (and so, in this specific case, not try
to build src/openssl/kw_des.c), but the autotools tooling in the project
is not the one setting XMLSEC_NO_DES: there is a mismatch between
detected features at configure time and build time.
- at build time, the tooling just checks if user has passed
  `--enable-des=no`. If so, it sets XMLSEC_NO_DES, otherwise it assumes
  that DES support is available.
- at build time, libxmlsec tries to build openssl backend. This backend
  checks OpenSSL features, especially whether OPENSSL_NO_DES is set (and
  if so, it enforces XMLSEC_NO_DES to 1 as well)
- This OPENSSL_NO_DES comes from libopenssl configuration headers
  installed in sysroot. Its presence is driven by the `no-des` option
  passed at libopenssl configure time
- This `no-des` flag is driven by buildroot option
  BR2_PACKAGE_LIBOPENSSL_ENABLE_DES

There are multiple options to fix this package here:
1. fixing upstream package to make the features detection more robust (eg
   check openssl headers at configure time to ensure that DES is
   supported)
2. enforce XMLSEC_NO_DES if BR2_PACKAGE_LIBOPENSSL_ENABLE_DES is not set
3. systematically enforce XMLSEC_NO_DES=1

Now:
- 1 may take time, and would then need a temporary patch to live in
  buildroot while the fix is accepted upstream and released
- 2 works only for libopenssl, what if libressl is used ?
- DES usage is discouraged anyway, as stated by configure logs:
  [...]
  checking for DES support... yes (use discouraged)
  [...]
As the package has been introduced very recently, there's a very low
chance to break any user use case by completely disabling DES support.

Systematically disable DES support in libxmlsec1 to discourage usage and
fix build failure when the corresponding SSL library does not expose DES
support.

Fixes: https://autobuild.buildroot.org/results/3e15f03dc0211c622125ebb69ff7230ce900029a/
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libxmlsec1/libxmlsec1.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libxmlsec1/libxmlsec1.mk b/package/libxmlsec1/libxmlsec1.mk
index d0d553c48c..29222bc16f 100644
--- a/package/libxmlsec1/libxmlsec1.mk
+++ b/package/libxmlsec1/libxmlsec1.mk
@@ -19,7 +19,8 @@ LIBXMLSEC1_CONF_OPTS = \
 	--with-openssl \
 	--without-gnutls \
 	--without-gcrypt \
-	--without-nss
+	--without-nss \
+	--disable-des
 
 HOST_LIBXMLSEC1_CONF_OPTS = \
 	--enable-crypto-dl=no \
@@ -27,7 +28,8 @@ HOST_LIBXMLSEC1_CONF_OPTS = \
 	--without-gnutls \
 	--without-gcrypt \
 	--without-nss \
-	--without-libxslt
+	--without-libxslt \
+	--disable-des
 
 ifeq ($(BR2_PACKAGE_LIBXSLT),y)
 LIBXMLSEC1_DEPENDENCIES += libxslt

--===============4160614963128439272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4160614963128439272==--
