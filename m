Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96518C25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 08:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D96761045;
	Thu, 30 May 2024 08:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sK02Yq6w8_mS; Thu, 30 May 2024 08:05:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6391861047
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6391861047;
	Thu, 30 May 2024 08:05:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A13E1BF27A
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 08:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6574340515
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 08:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-vS10Kj8ZFD for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 08:05:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.134;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E1214027A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E1214027A
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E1214027A
 for <buildroot@buildroot.org>; Thu, 30 May 2024 08:05:17 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1Ml6Zo-1stbd93xzI-00lX6s; Thu, 30 May 2024 10:05:15 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 30 May 2024 09:52:16 +0200
Message-ID: <20240530080240.12909-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:dpFa47BDS3UEdrj16lmhT4YHpbJY6s2mrFme4g6/4l7kH95ZfIr
 N4vUlyJ+rAIpJGYwUsCxE9szoYv8XVdbvYX0TjiB9s13jy6eVeYw7RumQbRWprkOxg8aQ+6
 udIWTposY3c/QbqfskAjO6z7wsg+bHnC1RqHuN1758kYpgMieKDq7hvOMngVa5tzfSEjT43
 eBY0pmHnNB5dMLGR4k56g==
UI-OutboundReport: notjunk:1;M01:P0:74MMeZU0t3w=;8XjqQEuGRYOqZaSyP3dkTnnBAMP
 QgHNhewf5IIyIOYkwGzt9mPZJOPZ343O4HbV4upj2rwDR1tekjbP1/H3xAH3RA6s3ci3JxkMx
 4pUr4wBoy8ZQrAOcguuOxUryxzd6N+uSCXED7lYQJtZ9E3A4AwsKyOHrKg8djEIqWuvlcRepb
 9/SaOcvZLZ0z6aQGal/CnV08iYG7i4dLxKYD0NihyzjgPLtqgK0A6WbA692ZZwrkRVv9NuQFL
 DZY6zWE92SfCDyagb188frYgzLDBRvSPu+yK7NLpEH1N8E7Hpffi+XBdKgf1SwwyL4dJXakg/
 FHJ/Z2LNjb4pfJ3YDhGFDuMmkQ+osZ2FjqxTJSFwvmgbA2XJSK1WlAh+eYEDmU9WzQkeYLhui
 zN2JJhKf7sPrz4DPfHUYWvXVaXw6mWRii98vUP7NBj4xbIMZ3NxizVUXPAZDP/7PQdPD+w3MU
 SdRqoYsT7uYoYmMjNK01xSb3uN+9l+TmpMW2fSOGdI+OImvvu3sh1DZYLFoDw+penyO7g344Y
 CbGP33ftQRfWOALGEVBd9GygVB0PVJbggn8FDsbF+2y0lI5jVv8EsIRevTM//EbrRKnO5HKWe
 1wPGOtJ6dmeogZAK4qlim/PPzDPJsZwxN2NKejek9AsjkiSAIuu7gn+DSY+YaDyYmR/DrPSFI
 YD8YMMTfuJjI6rgcpmbSOjyKWaMjF4Fjj9JIXU5HgosEoFAiRZE15et9WYY+SFqBQwnPzAfNX
 VKGq2SUX7TTIWdgmSuOeWEvo5AFg58I565wItDlBtmvk3bzYgNATvg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.8.1
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

Upstream notes that libhttp-parser is unmaintained and suggest llhttp
as a replacement.  This version bundles llhttp (and includes its license
in COPYING) but still allows to use a system-provided libhttp-parser.

llhttp (https://github.com/nodejs/llhttp) is a C library that depends on
a nodejs interpreter and more than 10 npm dependencies to generate its
parser code.  The bundled version contains the generated sources and
could be built without nodejs.  But distributing this generated code
as part of libgit2 would probably be legally dubious because of the
GPL's original source code provision, even if llhttp is MIT-licensed.

Packaging llhttp would be a daunting task and its build will require
considerable time and space, so for now, keep using libhttp-parser.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 4 ++--
 package/libgit2/libgit2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

(So now nodejs is an indirect dependency of cargo...)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 20e6929265..c02a149a68 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9e1d6a880d59026b675456fbb1593c724c68d73c34c0d214d6eb848e9bbd8ae4  libgit2-1.8.0.tar.gz
-sha256  08041a7e9c4d0e5e84f9711c824a0bd0366ee782ec29c6d7275fdab73e2ca115  COPYING
+sha256  8c1eaf0cf07cba0e9021920bfba9502140220786ed5d8a8ec6c7ad9174522f8e  libgit2-1.8.1.tar.gz
+sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 3364841e8f..e817a5916a 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.8.0
+LIBGIT2_VERSION = 1.8.1
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
@@ -22,7 +22,7 @@ LIBGIT2_CONF_OPTS = \
 	-DUSE_GSSAPI=OFF \
 	-DUSE_ICONV=ON \
 	-DREGEX_BACKEND=regcomp \
-	-DUSE_HTTP_PARSER=system \
+	-DUSE_HTTP_PARSER=http-parser \
 	-DUSE_NTLMCLIENT=OFF \
 	-DUSE_XDIFF=builtin \
 	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
