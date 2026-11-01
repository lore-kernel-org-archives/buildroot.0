Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D61F606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KMH/RKT3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E16B80D9E;
	Sun,  1 Nov 2026 17:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AVYFirQUBWr; Sun,  1 Nov 2026 17:36:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1A7D780D87
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554579;
	b=BAgrLIfI3CtN5t881qQoeOFSwgdp0MbyKLQghOmkN0rH8ClXuPYPsEMH0Cn3es3YPYzD
	 WxJ8d8xi6HNh+W/OXZlvPmUiZ36IDdP35HDK0qLC7QIsUlOLoIGXkXyVBE4VKXw8g+4jf
	 Snyjo3POlgHv7O3/WYleTEwmXDoL7F9yjSzRNdBUA+3Y5qGbuYmtPDWKvUIgPtpSLydNU
	 v2XEAPhCjr4Wj2dR/u7c+Qj/ue0KCWverkUrfpEwww9EsheHmPui0JqDK4JDYQMgZz4im
	 icD2dHW8Klk1NC9pKwFJgr/PheIWeCEqUxduhXaEef0cH9lkVpyhCVJX/FVkOgNpvtg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554579;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LI2guBC1PGrBmAF1YRSax794roU03dZ4S7hmalw7ygc=;
	b=YmKNSvV+LKVyLDTcVtZ05ZGUoFF11dPIG9p14geswtSyvBp1IOy4gMP2i/GN4CTYDs3J
	 Iwho1uF0KxfLbMimx/AFsoHxZ8i3V9NjFgdrs5eGcHpjA4Iu+RHs/36r2jYlgJ1jrVq+l
	 mb1i6I5GYVMtMhFoqOVRflmYBNVcge9SYyFm5W9PtrPdRPjif83Pz5zLCTmXL4IaXPshP
	 I3DS5YnvY2pQleoum8SAzxt8t1z4I6mz6WbmRu35pKX1sqQorB43BI45eNgDVFjOD48tB
	 LyZq9sdlh3P0pquMyC8uhx0MXf2Oj3hx/jftzDEcsMcHfb5uAVdgP4s+VFA5aLKcAyw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554579;
	bh=LI2guBC1PGrBmAF1YRSax794roU03dZ4S7hmalw7ygc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KMH/RKT30NilPWYl3U6xh69OuxbG0HZlzlEOTCxlYziLsJGSYOJaT713d3w/51BWg
	 A6yjxH34LyAci3jDVcwR9qHH0qL7FIeR/UE7bhyWBrsAhb+KdotN/j4FXtyyzuARgB
	 KmNwYtGq++3OhXzpBGMc44Yu9nvJd71sIdtkx2Pg/Gykevw+mfYAQwXHUxFPybJd9h
	 c/57dMM6s8f9c/Qt71jo5/hGuliq8OLj41k5EjrcRxPmAcB8NQAbNDHpIqkN+4mIw2
	 qwH0KXZalQpwLAEnyM/qzcovY7vLnUdy/HHM5ZEUMlf8GAYDyhlVZyrLqxj5Sxi/rN
	 75+LOpAdK9Rpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A7D780D87;
	Sun,  1 Nov 2026 17:36:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E798DEF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4BA260619
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sx1VK-CR3fwU for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 473B86060D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554577;
 b=BeafHaaWx1ViFLDrYwPzG3zRmamm+nQ/0XkPOQZCanWwKaDeWo0vo4qxL9hRJun51BMq
 i8C+ppIacmKzbz2TDxENTap6Xr0kdb1Jfcj1duMZAJudVTbDDIcKImmOuJDC0/9QB7yqK
 Fiovh0GJ0wu3S5w231L9LnOOSzRXRAo/1228c2BrlkN1tnl8O/F1LWZi6wtEvdgKD/Ybk
 OTh7Sy4XQmX49Y2a4M04RATdnfosO8KoZ/FxIYdTHQB5gunKrWNduHZgQxVAf6FGd04fx
 K6P2B8pMmSitBzPM195Fqzv4qJbwKoYUNyskkYR56j4a9EylQgSQG2nAuAKq6I++ouw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554577;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hS0XwWyXfVck61tApPSp6HvZKgMitg8G7vcM1bHu+14=;
 b=ov2NTf/aS+ZINoKChijB0b8oELJYVqNj/+a1Vd5wBmPIQ51PREtp6PT/gQLarfudK5hZ
 gdsGIqVf7iIB5e2OZQNs6XkuKvxRqYpdyDTnTCTKxDh1SQbOpkVI6cvvtqbqCqPnn40rR
 MQ9p8J1uDqxTwWijTMNqS9hCUk5Fg78wkf+B9gDXhbIMrzV8ehSy3ytSE1TNQKz5cXVux
 Ptu5QmtV/T7q8QbuivCnOlEw5Ic1MBBriLIChggDINv7hqVkW1+Gv5sxJSn1V9fefhtAa
 hEUwhvV1ykPUgXgu2psWXx3j9ny60IWfVFQnUNyZ4+66fiMWSU0cnJRnYRkv0GsXgQg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 473B86060D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECB5A9D4AD; Sun,  1 Nov 2026 17:34:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:16:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccdd1ca4aac11d913f10eb071d7c15d5fbede9a4
X-Git-Newrev: 567947a0c04a9ae03c04b32d74ec472c906de677
X-Patchwork-Hint: ignore
Message-Id: <20261101173447.ECB5A9D4AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bsdiff4: bump to version
 1.4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/567947a0c04a9ae03c04b32d74ec472c906de677
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the license hash for the copyright year update:
https://github.com/ilanschnell/bsdiff4/commit/7e388e358800ff26f99c78397ef551086de18e8c

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bsdiff4/python-bsdiff4.hash | 6 +++---
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index d9a7bf36cb..c3551e455f 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  43fc56a8c7a6125a01561273a3fdfe9e  bsdiff4-1.3.1.tar.gz
-sha256  75366494bb91cd0fd39be5c297525a60cf853ce6fe601dfa67d6de461aa18d39  bsdiff4-1.3.1.tar.gz
+md5  2b1bc9f016efdbb413db2954ddab7cde  bsdiff4-1.4.1.tar.gz
+sha256  d66fe7d6c50ea533aa860ac76689e05cfb0a3f8c7bd6730ddf5089a948f66ac5  bsdiff4-1.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  44a0326b645fc642428a3978568d3a5c1061b503ce7fb7ef18fbc20be5476e2b  LICENSE
+sha256  409b960b948de9fe1ed54308394b225572661fd9cb6378002488bb318a7f1c66  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index e7b258df68..d56d524f2e 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.3.1
+PYTHON_BSDIFF4_VERSION = 1.4.1
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/2b/3c/62c66de04e2ff09a3a3d56e4fc8a616177d481ae6c509363d178d2509690
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/9f/56/f7e929c66b74e0efb7239ab02254cbc693f079b7836f3cbc2760fbbb2781
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
