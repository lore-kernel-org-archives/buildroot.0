Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC992C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 10:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AC960730;
	Tue, 15 Sep 2026 10:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QN9GyMEG3PmV; Tue, 15 Sep 2026 10:07:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 88EE960731
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789466862;
	b=Oy4H+WY+WMYQT4GbhZIfAv3XH3aV9eimksE+uvoyVlmBr+h3G2SrEFnhTllVuVM5QPYn
	 04hROqVhep2VnuCmyoEVW5DR+t2Mx4I76NDW0oNzavkBhSWTF0YQJavNI8jUdnFjXZ5tn
	 RgPEqw1SheP0VLl98vgHB822K3Glc0rCe6H10E9i8FGrZ/Q8QTsnb652dT30+tJ29cW0i
	 U8vnpjogDpDN7mc7+IRrY2Yhh0Tm+d+XuY+jK9TectHyLC6yWzbh9VuzbRbModBXEJ/u+
	 lYTYsHyYySM5CQrkhfuUZMylDeuPLk4PtfyEUijKCAmEkQOlzqiL3vx7AoMOVfiVQSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789466862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=kQ3Hx6/gx424Dgo5xBVfX4H0JDvdKzKnJIMF8bWCIpI=;
	b=AzXEqZJOPdYkyULwXcsgwzEuSKkdoSPejaUlClvgklegglo+A/v0K3c5SandLdNvW8f7
	 o+yDps/Aw8xhDn/YYkikOOXbhcC5mDDcc4P866AcZycs2+279e8O2sJSt/gjdjyOTFQW1
	 EUUuhHXKXWxThJhPy7me5S9eT1SqeXIAsvyRo/G7xkozgitfDjGVazNCmG3VSdYgmQoia
	 BJCBexgntsJYhCmaaRt5ui47Bg1eJJfiEZxdmLnlG8/TWMf3v4/qcNTbVMhBVxUk/18Jf
	 taQz23ET9NEcPkU97aBpmUZ04hwVlS5iwXcsvEDA2GMbT29WS41mWxMFIzmkq6ftc4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789466862;
	bh=kQ3Hx6/gx424Dgo5xBVfX4H0JDvdKzKnJIMF8bWCIpI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZpQRx0HOVgF0uCyVDAMuPkR4t4g7Ev+upexfPjpDqbZuFbjSbKA+tIfQWZV4EWIHB
	 9sIR8iy4AJqsu16yr72hNPoQtAimlx0TPAQnYGUugWT74Lbu6hmBk/n5rR9RHvPT8x
	 DSF6/JD/me+d5bJzegs1rJhyxEF6Rq6AhRf1CQFFoqpRj4diXxeg1QJqjdtDKb0ZVe
	 c8k4R91b6ELykZ61UcSYbHjvazvzf3j+Ia8gsHPKzhATjWVjH/neTVmjiGb7qq4cfp
	 cKc/fgXuAS5wLy/KaWw8Bp/lYwAFvGpgREl823M5H6yMF2rNC194EWRLNdVDM09q3p
	 bpry79raZ6iHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88EE960731;
	Tue, 15 Sep 2026 10:07:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 631542E3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 10:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5446F80CA7
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 10:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJPAERiZuT_k for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 10:07:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7E3E880C6F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789466860;
 b=fP0qRq5mn4ySyO9n/66qsJ6+GmPF93czXB5JiwKuCJjaXbfKqDzmuxokLZ4U+QzkSDI9
 ygzuIQKDKjjfRyFfkqXTitOEMbLjiu9SiS1SxevGLrluyVZ/feMB+8UCeSH20ovvXyrCZ
 j8eWZV6CqpDtP+Yq9BB4qAb5RWy+5Oeoq3aQQBoUoCNT+9tEyLOo6rCuk+Jb2RZuxSc6b
 bh4tdLIU87nsI2vxdyD8HPAMeeB3arYQhb9nOrQUxwr7k8W+nmmQgxNBAGjJqhcYSzRjN
 MDYnxJTsUFFGXY92ZczgrkqIGaz/3EBXJIAlbDjO2IX7sakARU0qkYyAPPqprfia2Sw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789466860;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Disposition;
 bh=GdXsLHWoozP1yHAeKNlJRfbaE9ste0TIM6yCf8W4Ycs=;
 b=o1gJV1u9E/+ivLr0Uc73WPpnQf2KulaclULpxdzvoTDzWWuKNIu2CCh6ahLD++EIrLjA
 m61jxVKpxbH0fjOj6OZ3AqPhBnzJgB3LfJd5N+Ru3y66eBwQ4McJ5BF85W8cMFirzy6eW
 cOavvxsarNyZ+6An8t/c5vvKSzTFzSJikF3+/bC5xsRuo0QOgv96MRjUigUTe5Jvlnyrw
 1eN54RAHKoN2dgvcZ7V19JepAXyON8wWqtL6fZjAfX1+CBG6o/nAmK2F3wpkL4B2n2wto
 Z4m6NrMuKRv7qjxQbHDn0G84GaXaRNZZ6yjNpiQRpgRFgUXau+DueEe1sSx3gTiwmuQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AdIGODMS; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=AdIGODMS
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E3E880C6F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 10:07:38 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cc9f581c4so10374455e9.0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789466857; x=1790071657; darn=buildroot.org;
 h=content-disposition:content-type:mime-version:message-id:subject:to
 :from:date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GdXsLHWoozP1yHAeKNlJRfbaE9ste0TIM6yCf8W4Ycs=;
 b=AdIGODMSBjup3Bw1wNKrst9XRLRz095eFWfhB9BiH+K7w4nPGLO7+1tATWm5kywyx0
 7JCMAVwEWKva23enVAHn42Bb/Wdv1Hv9/SXnBw6MGSxER4YA8L3pM7aCalrhK+bcTTi+
 8mW+OWBZBIhLlASjsZzFKSjBdmau0nq4Oabm53TKI84obP2Tk+YW9mWMpQ2Pc3ISAmAi
 DX9S06o5A3OCts/JU6CYw7ols4RG+2bBw2YAyvmvbGvhVyBpd3VBWHtftjlg7xt6mAnu
 3LjOMrireukKglQA8dH9HRUa5DdhljbXGELknR+pr1RCiaOp4TsSkjF3yWTHy55jV/6B
 KcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789466857; x=1790071657;
 h=content-disposition:content-type:mime-version:message-id:subject:to
 :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GdXsLHWoozP1yHAeKNlJRfbaE9ste0TIM6yCf8W4Ycs=;
 b=B5c57IXfKAnh2FQFcOdtF5ufK0Keg+DiUsWvPyecTQNvzyvt+RDIEp2dr6MqbJX/Ky
 e6Qh7rPqMI0KefywEbtRuVVn4+noaS41H8EOa8oj1I1QVnYCoi557iip9Abc25/4W5F4
 jt5CsMMYE9K4rDWqrlEaBPit+4hMvpx7Mbd67CWGCH6a5PToDRw5a4dKYjw1Kh2i1hw4
 DHo1HJPqOi8c/7NljM188pb5O6VvshGSwmzqcl7lSHQKxNsJXNRDlc6qzWrXctOXNt4g
 XUsz9gPX3o9lPd6M3XVrvq33vshwN6pvY8rl6HKFyNkXuwrIMRp7VFCtc33BaZaOak44
 kYbw==
X-Gm-Message-State: AFuF++mf8oVwnOqNnwRgErQooA+vOdddDilloUiYZeZ4xSnBYS8N14Z9
 LWEFbk3f2DvyEB9Qj4py9hMnYixnPGWftubEQVn3YaZ5+n23eCX9sFyKAcVwNlyovwY=
X-Gm-Gg: AYBFou0HAxQyfkXedAi99pb7PfbucWi32ByVJXWcP8l3kFkTtVr+8I6ZNHp7Po+pIC0
 WsYzqnwMPz5vMfz5XJ0H99X7McMW/9l52cZu6hE+KJpZ9rgebtddroojyU43v6hg1gqdul0BY1n
 lx0/L0/7GOZrNqBnqyG8vK3O5BtldMr8CV6iR2P3dE7k639LjwTaESzilV45OewnrTu+AnSQ0VF
 HJbZczNsEKEdf/qdrAmP6L8QlbAxWV/1rQN3DBSp/XGl2jmmXIl02FVbIcN+bidsjfhqKYd5OhA
 cpxlGyXl6ScwiKajBy8zEUrGBxvvoQ6EhNV3KSxDPbXIZK5+afAkh1gpcY4SZ2sHhOifdV6aMIy
 XplXMdtXrlnN2H8T2LPyiYGI1E3hhx2LhP6GRP27H+W8JFmbX/Hl0X6DhOlKHVzrsbEx6FyTe33
 kKZ1kj/88X9s7fKy+PAvDcOAvdAU35xmp/qYqXlWNxtL136FNqpkuyNKKyRcxVvwdno6GrdMnO8
 cw29n3Mw2modwktjcB7/UkTWlPJOb2pi2BdhatC7Ikbkja2GHDUccGGxogID/3ez7kQC+NUWeN5
 S3UBcbFVTJtX
X-Received: by 2002:a05:600c:34c2:b0:49e:8222:3451 with SMTP id
 5b1f17b1804b1-49e822234ffmr6207475e9.14.1789466856288; 
 Tue, 15 Sep 2026 03:07:36 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e7ef80010sm50982815e9.11.2026.09.15.03.07.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 03:07:35 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:07:34 +0200
From: Leo Denieul <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Message-ID: <aqkY5pbz_0fpLF7A@leo-ThinkPad-P16s-Gen-4-AMD>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH] package/cst: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CST (Code Signing Tool) is a tool from NXP used to sign firmware
images for secure boot on NXP QorIQ/i.MX platforms. It generates
RSA/ECC keys, computes hashes, and produces signed headers required
by the platform's secure boot mechanism.

Project mainpage: https://github.com/nxp-qoriq/cst

Signed-off-by: Leo Denieul <leo.denieul.yoshino@gmail.com>
---
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/Config.in.host                        |   1 +
 ...0001-common-port-to-openssl3-evp-api.patch | 428 ++++++++++++++++++
 package/cst/Config.in                         |  12 +
 package/cst/Config.in.host                    |   8 +
 package/cst/cst.hash                          |   2 +
 package/cst/cst.mk                            |  45 ++
 8 files changed, 500 insertions(+)
 create mode 100644 package/cst/0001-common-port-to-openssl3-evp-api.patch
 create mode 100644 package/cst/Config.in
 create mode 100644 package/cst/Config.in.host
 create mode 100644 package/cst/cst.hash
 create mode 100644 package/cst/cst.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 97eb2d9cac..8998a55941 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2154,6 +2154,9 @@ F:	package/petitboot/
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 
+N:	Leo DENIEUL <leo.denieul.yoshino@gmail.com>
+F:	package/cst
+
 N:	Leon Anavi <leon.anavi@konsulko.com>
 F:	board/olimex/a10_olinuxino
 F:	configs/olimex_a10_olinuxino_lime_defconfig
diff --git a/package/Config.in b/package/Config.in
index 243b390d1c..b4a2e8d7b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2722,6 +2722,7 @@ endmenu
 menu "Security"
 	source "package/apparmor/Config.in"
 	source "package/checkpolicy/Config.in"
+	source "package/cst/Config.in"
 	source "package/ima-evm-utils/Config.in"
 	source "package/lynis/Config.in"
 	source "package/optee-client/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..39910a53ba 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -24,6 +24,7 @@ menu "Host utilities"
 	source "package/cramfs/Config.in.host"
 	source "package/crudini/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
+	source "package/cst/Config.in.host"
 	source "package/dbus-python/Config.in.host"
 	source "package/delve/Config.in.host"
 	source "package/depot-tools/Config.in.host"
diff --git a/package/cst/0001-common-port-to-openssl3-evp-api.patch b/package/cst/0001-common-port-to-openssl3-evp-api.patch
new file mode 100644
index 0000000000..1a9d593f17
--- /dev/null
+++ b/package/cst/0001-common-port-to-openssl3-evp-api.patch
@@ -0,0 +1,428 @@
+From 12f9c17f3cf773112e691bf45ee1551c66b57868 Mon Sep 17 00:00:00 2001
+From: Vincent <vjardin@free.fr>
+Date: Sat, 5 Sep 2026 01:41:20 +0200
+Subject: [PATCH] common: port to the OpenSSL 3 EVP API
+
+Fix compilation: upgrade to OpenSSL 3.0.
+
+Side benefits: it gains the support of "RSA PUBLIC KEY" (PKCS#1)
+and "PUBLIC KEY" (SubjectPublicKeyInfo) PEM files.
+
+Older toolchain and openssl kept "build"able.
+
+Upstream: https://github.com/nxp-qoriq/cst/pull/7/changes/12f9c17f3cf773112e691bf45ee1551c66b57868
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+---
+ common/crypto_utils.c           | 121 ++++++++++++++++++++++-------
+ tools/key_generation/gen_keys.c | 131 +++++++++++++++++++-------------
+ 2 files changed, 172 insertions(+), 80 deletions(-)
+
+diff --git a/common/crypto_utils.c b/common/crypto_utils.c
+index 9a83411..5d0fac4 100644
+--- a/common/crypto_utils.c
++++ b/common/crypto_utils.c
+@@ -34,36 +34,59 @@
+  */
+ 
+ #include <crypto_utils.h>
+-#include <openssl/ssl.h>
++#include <openssl/evp.h>
++#include <openssl/pem.h>
++#include <openssl/bn.h>
++#include <openssl/rsa.h>
++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
++#include <openssl/core_names.h>
++#endif
++
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#define EVP_MD_CTX_new		EVP_MD_CTX_create
++#define EVP_MD_CTX_free		EVP_MD_CTX_destroy
++#endif
++
++static EVP_MD_CTX **hash_ctx(void *ctx)
++{
++	return (EVP_MD_CTX **)ctx;
++}
+ 
+ /***************************************************************************
+  * Function	:	crypto_hash_init
+- * Description	:	Wrapper function for SHA256_Init
++ * Description	:	Wrapper function for EVP SHA256 init
+  ***************************************************************************/
+ void crypto_hash_init(void *ctx)
+ {
+-	SHA256_CTX *c = (SHA256_CTX *)ctx;
+-	SHA256_Init(c);
++	EVP_MD_CTX *c = EVP_MD_CTX_new();
++
++	*hash_ctx(ctx) = c;
++	if (c == NULL || EVP_DigestInit_ex(c, EVP_sha256(), NULL) != 1) {
++		fprintf(stderr, "Error in initialising SHA256\n");
++		exit(EXIT_FAILURE);
++	}
+ }
+ 
+ /***************************************************************************
+  * Function	:	crypto_hash_update
+- * Description	:	Wrapper function for SHA256_Update
++ * Description	:	Wrapper function for EVP SHA256 update
+  ***************************************************************************/
+ void crypto_hash_update(void *ctx, void *data, uint32_t len)
+ {
+-	SHA256_CTX *c = (SHA256_CTX *)ctx;
+-	SHA256_Update(c, data, len);
++	EVP_DigestUpdate(*hash_ctx(ctx), data, len);
+ }
+ 
+ /***************************************************************************
+  * Function	:	crypto_hash_final
+- * Description	:	Wrapper function for SHA256_Final
++ * Description	:	Wrapper function for EVP SHA256 final
+  ***************************************************************************/
+ void crypto_hash_final(void *hash, void *ctx)
+ {
+-	SHA256_CTX *c = (SHA256_CTX *)ctx;
+-	SHA256_Final(hash, c);
++	EVP_MD_CTX *c = *hash_ctx(ctx);
++
++	EVP_DigestFinal_ex(c, hash, NULL);
++	EVP_MD_CTX_free(c);
++	*hash_ctx(ctx) = NULL;
+ }
+ 
+ /***************************************************************************
+@@ -79,7 +102,6 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ 	FILE *fp;
+ 	unsigned char buf[IOBLOCK];
+ 	size_t bytes = 0;
+-	SHA256_CTX *c = (SHA256_CTX *)ctx;
+ 
+ 	/* open the file */
+ 	fp = fopen(fname, "rb");
+@@ -102,7 +124,7 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ 			break;
+ 		}
+ 
+-		SHA256_Update(c, buf, bytes);
++		crypto_hash_update(ctx, buf, bytes);
+ 	}
+ 
+ 	fclose(fp);
+@@ -112,14 +134,16 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ 
+ /***************************************************************************
+  * Function	:	crypto_rsa_sign
+- * Description	:	Wrapper function for RSA_sign
++ * Description	:	Wrapper function for EVP_PKEY_sign
+  ***************************************************************************/
+ int crypto_rsa_sign(void *img_hash, uint32_t len, void *rsa_sign,
+ 			uint32_t *rsa_len, char *key_name)
+ {
+-	int ret;
++	int ret = FAILURE;
+ 	FILE *fpriv;
+-	RSA *priv_key;
++	EVP_PKEY *priv_key;
++	EVP_PKEY_CTX *pctx = NULL;
++	size_t sign_len;
+ 
+ 	/* Open the private Key */
+ 	fpriv = fopen(key_name, "r");
+@@ -128,7 +152,7 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, void *rsa_sign,
+ 		return FAILURE;
+ 	}
+ 
+-	priv_key = PEM_read_RSAPrivateKey(fpriv, NULL, NULL, NULL);
++	priv_key = PEM_read_PrivateKey(fpriv, NULL, NULL, NULL);
+ 	fclose(fpriv);
+ 	if (priv_key == NULL) {
+ 		printf("Error in key reading %s:\n", key_name);
+@@ -136,14 +160,23 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, void *rsa_sign,
+ 	}
+ 
+ 	/* Sign the Image Hash with Private Key */
+-	ret = RSA_sign(NID_sha256, img_hash, len,
+-			rsa_sign, rsa_len,
+-			priv_key);
+-	if (ret != 1) {
++	sign_len = EVP_PKEY_size(priv_key);
++	pctx = EVP_PKEY_CTX_new(priv_key, NULL);
++	if (pctx == NULL ||
++	    EVP_PKEY_sign_init(pctx) != 1 ||
++	    EVP_PKEY_CTX_set_rsa_padding(pctx, RSA_PKCS1_PADDING) != 1 ||
++	    EVP_PKEY_CTX_set_signature_md(pctx, EVP_sha256()) != 1 ||
++	    EVP_PKEY_sign(pctx, rsa_sign, &sign_len, img_hash, len) != 1) {
+ 		printf("Error in Signing\n");
+-		return FAILURE;
++		goto out;
+ 	}
+-	return SUCCESS;
++
++	*rsa_len = sign_len;
++	ret = SUCCESS;
++out:
++	EVP_PKEY_CTX_free(pctx);
++	EVP_PKEY_free(priv_key);
++	return ret;
+ }
+ 
+ /***************************************************************************
+@@ -158,9 +191,15 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, void *rsa_sign,
+ int crypto_extract_pub_key(char *fname_pub, uint32_t *len, uint8_t *key_ptr)
+ {
+ 	FILE *fp;
+-	RSA *pub_key;
+ 	uint32_t key_len;
++	int ret = FAILURE;
++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
++	EVP_PKEY *pub_key;
++	BIGNUM *modulus = NULL, *exponent = NULL;
++#else
++	RSA *pub_key;
+ 	const BIGNUM *modulus, *exponent;
++#endif
+ 
+ 	fp = fopen(fname_pub, "r");
+ 	if (fp == NULL) {
+@@ -169,7 +208,11 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t *len, uint8_t *key_ptr)
+ 		return FAILURE;
+ 	}
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
++	pub_key = PEM_read_PUBKEY(fp, NULL, NULL, NULL);
++#else
+ 	pub_key = PEM_read_RSAPublicKey(fp, NULL, NULL, NULL);
++#endif
+ 	fclose(fp);
+ 	if (pub_key == NULL) {
+ 		fprintf(stderr, "Error in key reading %s:\n",
+@@ -177,17 +220,32 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t *len, uint8_t *key_ptr)
+ 		return FAILURE;
+ 	}
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
++	key_len = EVP_PKEY_get_size(pub_key);
++
++	/* get N and E */
++	if (EVP_PKEY_get_bn_param(pub_key, OSSL_PKEY_PARAM_RSA_N,
++				  &modulus) != 1 ||
++	    EVP_PKEY_get_bn_param(pub_key, OSSL_PKEY_PARAM_RSA_E,
++				  &exponent) != 1) {
++		fprintf(stderr, "Error: %s is not an RSA public key\n",
++			fname_pub);
++		goto out;
++	}
++#else
+ 	key_len = RSA_size(pub_key);
+-	*len = 2 * key_len;
+ 
+ #if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	/* copy N and E */
+-        modulus = (BIGNUM *)pub_key->n;
+-        exponent = (BIGNUM *)pub_key->e;
++	modulus = (BIGNUM *)pub_key->n;
++	exponent = (BIGNUM *)pub_key->e;
+ #else
+ 	/* get N and E */
+ 	RSA_get0_key(pub_key, &modulus, &exponent, NULL);
+ #endif
++#endif
++	*len = 2 * key_len;
++
+ 	/* Copy N component */
+ 	BN_bn2bin(modulus, key_ptr);
+ 
+@@ -202,7 +260,16 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t *len, uint8_t *key_ptr)
+ 	 */
+ 	BN_bn2bin(exponent, key_ptr + key_len - BN_num_bytes(exponent));
+ 
+-	return SUCCESS;
++	ret = SUCCESS;
++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
++out:
++	BN_free(modulus);
++	BN_free(exponent);
++	EVP_PKEY_free(pub_key);
++#else
++	RSA_free(pub_key);
++#endif
++	return ret;
+ }
+ 
+ /***************************************************************************
+diff --git a/tools/key_generation/gen_keys.c b/tools/key_generation/gen_keys.c
+index da74cc7..c4f7495 100644
+--- a/tools/key_generation/gen_keys.c
++++ b/tools/key_generation/gen_keys.c
+@@ -37,13 +37,18 @@
+  *     Eric Young (eay@cryptsoft.com)"
+  */
+ 
+-#define OPENSSL_NO_KRB5
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <openssl/ssl.h>
+ #include <unistd.h>
+ #include <getopt.h>
++#include <openssl/evp.h>
++#include <openssl/pem.h>
++#include <openssl/rsa.h>
++#include <openssl/bio.h>
++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
++#include <openssl/encoder.h>
++#endif
+ 
+ #define RSA_LEN1	1024
+ #define RSA_LEN2	2048	
+@@ -52,79 +57,99 @@
+ #define PRI_KEY_FILE "srk.pri"
+ #define PUB_KEY_FILE "srk.pub"
+ 
+-static int generate_rsa_keys(const unsigned int n, FILE *fpri, FILE *fpub)
++#if OPENSSL_VERSION_NUMBER >= 0x30000000L
++static int write_key_pem(EVP_PKEY *pkey, int selection, FILE *fp)
+ {
+-	RSA *srk = NULL;
+-	BIGNUM *public_exponent = NULL;
+-	int ret = 0;
+-
+-	/* Allocate space for RSA structure */
+-	srk = RSA_new();
++	OSSL_ENCODER_CTX *ectx;
++	int ok;
+ 
+-	if (srk == NULL) {
++	ectx = OSSL_ENCODER_CTX_new_for_pkey(pkey, selection, "PEM",
++					     "type-specific", NULL);
++	if (ectx == NULL)
+ 		return -1;
+-	}
+ 
+-	public_exponent = BN_new();
+-	if (public_exponent == NULL || !BN_set_word(public_exponent, RSA_F4)) {
+-		BN_free(public_exponent);
+-		return -1;
+-	}
++	ok = OSSL_ENCODER_to_fp(ectx, fp);
++	OSSL_ENCODER_CTX_free(ectx);
+ 
+-	ret = RSA_generate_key_ex(srk, n, public_exponent, NULL);
+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
+-		return -1;
+-	}
++	return (ok == 1) ? 0 : -1;
++}
++
++static int write_private_key(EVP_PKEY *pkey, FILE *fp)
++{
++	return write_key_pem(pkey, EVP_PKEY_KEYPAIR, fp);
++}
+ 
+-	ret = PEM_write_RSAPrivateKey(fpri, srk, NULL, NULL, 0, 0, NULL);
++static int write_public_key(EVP_PKEY *pkey, FILE *fp)
++{
++	return write_key_pem(pkey, EVP_PKEY_PUBLIC_KEY, fp);
++}
++#else
++static int write_private_key(EVP_PKEY *pkey, FILE *fp)
++{
++	RSA *rsa = EVP_PKEY_get1_RSA(pkey);
++	int ok;
+ 
+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
++	if (rsa == NULL)
+ 		return -1;
+-	}
++	ok = PEM_write_RSAPrivateKey(fp, rsa, NULL, NULL, 0, 0, NULL);
++	RSA_free(rsa);
++
++	return (ok == 1) ? 0 : -1;
++}
+ 
+-	ret = PEM_write_RSAPublicKey(fpub, srk);
++static int write_public_key(EVP_PKEY *pkey, FILE *fp)
++{
++	RSA *rsa = EVP_PKEY_get1_RSA(pkey);
++	int ok;
+ 
+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
++	if (rsa == NULL)
+ 		return -1;
+-	}
++	ok = PEM_write_RSAPublicKey(fp, rsa);
++	RSA_free(rsa);
+ 
+-#ifdef DEBUG
+-	printf("public modulus (n):\n");
+-	printf("%s\n", BN_bn2hex(srk->n));
++	return (ok == 1) ? 0 : -1;
++}
++#endif
+ 
+-	printf("public exponent (e):\n");
+-	printf("%s\n", BN_bn2hex(srk->e));
++static int generate_rsa_keys(const unsigned int n, FILE *fpri, FILE *fpub)
++{
++	EVP_PKEY *srk = NULL;
++	EVP_PKEY_CTX *ctx;
++	int ret = -1;
+ 
+-	printf("private exponent (d):\n");
+-	printf("%s\n", BN_bn2hex(srk->d));
++	ctx = EVP_PKEY_CTX_new_id(EVP_PKEY_RSA, NULL);
++	if (ctx == NULL)
++		return -1;
+ 
+-	printf("secret prime factor (p):\n");
+-	printf("%s\n", BN_bn2hex(srk->p));
+-	printf("secret prime factor (q):\n");
+-	printf("%s\n", BN_bn2hex(srk->q));
++	if (EVP_PKEY_keygen_init(ctx) != 1 ||
++	    EVP_PKEY_CTX_set_rsa_keygen_bits(ctx, n) != 1 ||
++	    EVP_PKEY_keygen(ctx, &srk) != 1)
++		goto out;
+ 
+-	printf("dmp1 [ d mod (p-1) ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->dmp1));
+-	printf("dmq1 [ d mod (q-1) ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->dmq1));
++	if (write_private_key(srk, fpri) != 0)
++		goto out;
+ 
+-	printf("iqmp [ q^-1 mod p ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->iqmp));
++	if (write_public_key(srk, fpub) != 0)
++		goto out;
+ 
+-	printf("RSA SIZE: %d\n", RSA_size(srk));
++#ifdef DEBUG
++	{
++		BIO *out = BIO_new_fp(stdout, BIO_NOCLOSE);
+ 
++		if (out != NULL) {
++			EVP_PKEY_print_private(out, srk, 0, NULL);
++			BIO_free(out);
++		}
++		printf("RSA SIZE: %d\n", EVP_PKEY_size(srk));
++	}
+ #endif
+ 
+-	RSA_free(srk);
+-	BN_free(public_exponent);
++	ret = 0;
++out:
++	EVP_PKEY_free(srk);
++	EVP_PKEY_CTX_free(ctx);
+ 
+-	return 0;
++	return ret;
+ }
+ 
+ void usage(void)
diff --git a/package/cst/Config.in b/package/cst/Config.in
new file mode 100644
index 0000000000..eb6cb3168f
--- /dev/null
+++ b/package/cst/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CST
+	bool "cst"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  NXP Code Signing Tool for QorIQ and Layerscape secure boot.
+
+	  The purpose of this variant is to verify the signatures of
+	  the bootloader directly on the target before an update and
+	  not to generate keys. It prevents the target from bricking
+	  the board by verifying the signatures.
+
+	  https://github.com/nxp-qoriq/cst
diff --git a/package/cst/Config.in.host b/package/cst/Config.in.host
new file mode 100644
index 0000000000..efe01ec8b6
--- /dev/null
+++ b/package/cst/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_CST
+	bool "host cst"
+	help
+	  NXP Code Signing Tool for QorIQ and Layerscape secure boot.
+	  Provides tools to generate keys, create security headers and
+	  sign firmware images, especially the bootloader.
+
+	  https://github.com/nxp-qoriq/cst
diff --git a/package/cst/cst.hash b/package/cst/cst.hash
new file mode 100644
index 0000000000..1071e8dc30
--- /dev/null
+++ b/package/cst/cst.hash
@@ -0,0 +1,2 @@
+sha256  01cbe20db8ef1472ef83f720d9d83aa17f5c10b4f120b9ef8375996255c753fc  cst-lf-6.18.20-2.0.0.tar.gz
+sha256  7c8437ed27fc42fb35a90e3be5f1dfbe1b877058df1784eeb59057ceb5acc8cc  LICENSE
diff --git a/package/cst/cst.mk b/package/cst/cst.mk
new file mode 100644
index 0000000000..1b4b304891
--- /dev/null
+++ b/package/cst/cst.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# cst
+#
+################################################################################
+
+CST_VERSION = lf-6.18.20-2.0.0
+CST_SITE = $(call github,nxp-qoriq,cst,$(CST_VERSION))
+CST_LICENSE = BSD-3-Clause
+CST_LICENSE_FILES = LICENSE
+
+CST_DEPENDENCIES = openssl
+HOST_CST_DEPENDENCIES = host-openssl
+
+define CST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC)" \
+		LD="$(TARGET_CC)" \
+		CROSS_COMPILE="$(TARGET_CROSS)"
+endef
+
+define CST_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE="" DESTDIR=$(TARGET_DIR) \
+		prefix=/usr install
+endef
+
+define HOST_CST_BUILD_CMDS
+	$(HOST_MAKE_ENV) \
+	CFLAGS="$(HOST_CFLAGS)" \
+	LDFLAGS="$(HOST_LDFLAGS)" \
+	$(MAKE) -C $(@D) \
+		CC="$(HOSTCC)" \
+		LD="$(HOSTCC)" \
+		CROSS_COMPILE=""
+endef
+
+define HOST_CST_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE="" DESTDIR=$(HOST_DIR) \
+		prefix=/usr install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
