Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797FACC6B1D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 10:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2625A406A3;
	Wed, 14 Oct 2026 10:07:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfF33ApGI-Wp; Wed, 14 Oct 2026 10:07:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 57579406B0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791972448;
	b=TLePQPYRdmEpXFIxGGUtG6cqJWGKBQk1YluY5INvwHPHFupPn9CaeRj2qHbx7/K03wrV
	 tS5SAjqNr/zJigXMN1HLD0K25+4p3CkWt7Hds/J8fs76IthQpyNHiUhmMXWnneWtHeCI8
	 0Fr4bDUsFeDRGM9CibSt1lE7+oQKHIcRv8woVTwhyn2rZmkL/m1qx+NqDRWWq19hBFqsi
	 HBQU1Bs6V8jYME7psl9iKnrGUfiedZ2am/bltsRoiyOI7oCbet9l/8gwZAWbEk0HyuUjf
	 uIRMT0v+YhPcM95eRvQWRsW8124vFR4aL/+Ee+FnltYrneMnYfv22bSEzyhrsBgFIGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791972448;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:Date:To:Cc:Message-ID:
	 MIME-Version:Content-Disposition:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jryhAS/fRG8sY3cSs91/wyPjPjXgPg/9t3AnMpkFMuI=;
	b=aYKdzUXMoqkdadhwPvXd2QD+m/aA1AKnCGnoE+4XtbcY9mA8kIHWOL4xuRlOeUPrzqKh
	 phRWAPRtUX/aRqPynzxyMp2rkOemsFQrv05w01IpOQtO+AuSdIIh1DAOTzQuXgYT9i5c7
	 3gcczU451E39oNpbRmbKbCfZCqXnRV0t0sVQqZu5MvZQdCpj6t4JsqRhnMGuZ6dzJGSJP
	 ZtoXAgpL6na1ZAJixOfTQueMLiInLzrs9laOcy+9Jerlaul9kCa/1EtQeNZQTuudFpodx
	 bp8v6TBBmGXq9SyNtgl9vQpuXqTpzIGWGTubmfdNQfr7xsZokYrMZgbREyQ0T1LaZSw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791972448;
	bh=jryhAS/fRG8sY3cSs91/wyPjPjXgPg/9t3AnMpkFMuI=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NTeNsF+eIwPwc91WEuikq8Ooa5STrEvHJMy33+cpX1RAsOB2C9UDLHEvLiGhVyWZZ
	 Dq0bdtx2UT0GsFa5cz2Il574vEVkRws77w0R6fV7eS0ixIVCPa4VmhciWwa0TEv137
	 sL/GrVgZsewOv7o+UFaiobqeZ5zV69deuJoKv7E0+M6lfM9DNu/w4JZrj4BlCy5KNi
	 1hKpLW7Bu4HPJcpx62efEre4wus0U9Uex94GNOz2oHSNdcNM2teBxHSeZAahfvSwug
	 dU1xKu34cVYK6dWKAcb5V4FEKA1QC8wWo3Eh9QrDCuqcZxyo3EVeLCS7Oiz0MeRPca
	 B/OLhkBnOP2eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57579406B0;
	Wed, 14 Oct 2026 10:07:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43CAA2AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 10:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4118F40308
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 10:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLoWRjxK0ASc for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 10:07:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5AEE9400E5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791972445;
 b=BHq7JFnYbzZ6JinwbpsGShEJNpBAti9EIZ1gTJ+at1Hj9onQxrnyq5KIBPVPrxKINGVq
 d3175J849D6+2GR+xG4RnVa6S0z1GiE5W+sKuR12KvZy89yW99tyn0GemfWYBYoL8F1do
 LfINjyI1FLWC1+vSpaVdAVEjnYqPu2OSpsAZw2Ow7YSfhxKMBOxFU/dVCREPLabSmQeqP
 tkGCWINBC2s3uLqRrHqfk/MLnKtSfyXf0gKYXoy3QZI+ZzdRUKpZID5KmVLet5HtBqHrM
 msdOmRIsFYcgNtLLo8EbvOLWcyVwr9mEN4x+PcgHaotFnBKvJ7di0IPBa6ro7tJtgSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791972445;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition:Content-Transfer-Encoding;
 bh=IidrEU/1jSBJNKKRIM9LOzlZ8UcEoO5+6PILME1TXi4=;
 b=bpdmCSblS2nmIt/2MMMrNoBUHfIwQklEGve8NQOXkoqkeSDFLhrd0iXpnbWGAewb6gP5
 cryIHfcdJBsbMuRby6O3kWIJ4ODRo9/0YY3qMz/lgWWJcY+ejqv9Nmqc35x/pi3COn6eB
 p3xJdDkCc/X4pKq3/XuJnN+KO7Cf1bn4n1ogNGp25Tdd4ifUJ9LVEotW6dvAxCAA/2NRT
 LaT0CRLDgIRLkTnSTtiWW1MNAtWuuoeYXSD+bzvD1F9or4sD+9ggI9VKg1gX8bGwwz/H+
 AmprdRBk0d6RzKMogfCeO9TQJuelPpQ0aKswEkMu7vwK1Ge/DlqKTcKNtAIxB9HxdbA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LZBC7299; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LZBC7299
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AEE9400E5
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 10:07:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso2818237f8f.2
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791972443; x=1792577243; darn=buildroot.org;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:date:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=IidrEU/1jSBJNKKRIM9LOzlZ8UcEoO5+6PILME1TXi4=;
 b=LZBC7299fYwXVS4/lbGChuFlCFuNWUfLgvFxLiIe82FiaF5ay5+LFld2BJOZuChft2
 K/v3+4G+7+XpmkZveGpIAjYi4Es+5+DqE7Vvj3C+5CdPfaqsc3pNRj+yLoVxPomSo3hU
 iRSiiU9ZbVESYCuIFr2nYvLNtODteC395vQPfv25ZiU3etv4AUzLKmVZaCwYPruRojsS
 i8tLFsh9Zaiq0zWmSsEcl2Gh+GlLyqkzUkZbpPTRJPRe2Qdj/YMsOYrk9yhVyoKGr92Q
 3nKRF3iRRs7OCTTDAVOY3JCx7KnfrdImfS9T6Y1gY6X0EXWcLxtsDnzSzcciMSBNvB+4
 t3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791972443; x=1792577243;
 h=content-transfer-encoding:content-disposition:content-type
 :mime-version:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IidrEU/1jSBJNKKRIM9LOzlZ8UcEoO5+6PILME1TXi4=;
 b=pNSUq4O2SfD8PVv35kLWFaneZb29fye20vSSfpDp27AfdL0IZRsjtDm3HsiNIhADTy
 ITHtfdsZXnE0v4c6VNeXaonxawUYttZLSXowM+InqFm3y0m0GRNXTDFh1bQOkSO5ArOe
 QbkObDigwdbpRlXQ522yNdLKiYC1TzumepD+n683IZu8zZm8FcrWGFV/6CntVy4bAviS
 8s0k8C9EJtRoeoKoylNREkXcwObqQ3yxSKsPD9lWOoCFy9L9kO11hMvLO3ufuWypzPJG
 Uo7eBBvf/sYltWESPI2qdC2mCYdK7Ocq+xznHV++Zpc7iOFpeRA4vspv6zzUtx2dMK4I
 Rp2w==
X-Gm-Message-State: AFq9FYIEFeXy0gvlrXFJAkTcS7A6LfSkNsQtMZ+dVXeB9UKvd8LWlkEs
 SJvJv/T/Ij0ar6RJoq+FhN4T0EEZnGmfD+8BIVnhDV5V1Fnk91btWDKNg7OJfQ==
X-Gm-Gg: AYBFou2vzas+CZK3y0JJLqKmV8oBf2XbFLhIoQB6Notynd6phb9hISgCUKUscdEHWIG
 kHML9U41HHNhsuWARauvU3JPnO9IUOAmtFzu7+ZQ7Llw02VRY3qi6pyUhfLWStU7BI1u9FebKE8
 ZXg+76h9Srov3LTn7iDwT+LHHiYQTdRGkdF3D7vN95BQLfqh3h/rQvGXIqh/pU/XobGqGOMFYRc
 b40s1c8wsZqR8c7tP5yzt1XqJylQl1+6R7BlJF81qjH4GtSv0lU/bJ1mxgyi/lZuznrPb343vSI
 hqTdwW3WIA6tVAWveZQyMwqjXDbeWY13GEq/dG140xWNaCbNEQGTAaGbx4Njzb2dKRontq6UFuL
 ooZn8w+aqSXjtaXM8ihdaFUz9qn/w2FwYxJnIoaa6OGiQKndADc0b5Zq+u3CDmX7S1jgBtGL/4C
 YBh8ccuWBLBhZsihTpCf2Fhf1HyQajFUhDWWpK9F0OxvMuPj8lHrDrYn5gntPESlZYh5fnbTGOj
 sstjoswq5+ncZKGJz+iILWTK7cLhk3c9MbY6Kw3mnXjqDJmI6JyGcLL02mD4fQkQREMpD4mZaAR
 j15I
X-Received: by 2002:a05:6000:29d1:b0:48d:c178:f6e9 with SMTP id
 ffacd0b85a97d-48dc178f70emr17882656f8f.20.1791972442619; 
 Wed, 14 Oct 2026 03:07:22 -0700 (PDT)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48ded3874c6sm2220798f8f.18.2026.10.14.03.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 03:07:21 -0700 (PDT)
From: "=?iso-8859-1?B?TOlv?= Denieul" <leo.denieul.yoshino@gmail.com>
X-Google-Original-From: =?iso-8859-1?B?TOlv?= Denieul <ldenieul@iliad-free.fr>
Date: Wed, 14 Oct 2026 12:07:20 +0200
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Message-ID: <as9UWNi-ZHqXq6Sl@leo-ThinkPad-P16s-Gen-4-AMD>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v3] package/qoriq-cst: new package
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NXP Code Signing Tool (CST) for QorIQ and Layerscape secure boot.

Signed-off-by: L=E9o Denieul <leo.denieul.yoshino@gmail.com>
---
Changes v2 -> v3:
 - rename to qoriq-cst, to avoid confusion with the unrelated i.MX
   CST

Changes v1 -> v2:
 - bump to lf-6.18.37-2.1.0
 - replace the OpenSSL 3 patch by the commit merged upstream, as no
   release tag includes it yet
---
 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/Config.in.host                        |   1 +
 ...0001-common-port-to-openssl3-evp-api.patch | 438 ++++++++++++++++++
 package/qoriq-cst/Config.in                   |  12 +
 package/qoriq-cst/Config.in.host              |   8 +
 package/qoriq-cst/qoriq-cst.hash              |   2 +
 package/qoriq-cst/qoriq-cst.mk                |  45 ++
 8 files changed, 510 insertions(+)
 create mode 100644 package/qoriq-cst/0001-common-port-to-openssl3-evp-api.=
patch
 create mode 100644 package/qoriq-cst/Config.in
 create mode 100644 package/qoriq-cst/Config.in.host
 create mode 100644 package/qoriq-cst/qoriq-cst.hash
 create mode 100644 package/qoriq-cst/qoriq-cst.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 32ac338dc8..e1bf2a877b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2162,6 +2162,9 @@ F:	package/petitboot/
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 =

+N:	Leo DENIEUL <leo.denieul.yoshino@gmail.com>
+F:	package/qoriq-cst
+
 N:	Leon Anavi <leon.anavi@konsulko.com>
 F:	board/olimex/a10_olinuxino
 F:	configs/olimex_a10_olinuxino_lime_defconfig
diff --git a/package/Config.in b/package/Config.in
index a82e369aff..4c5e241a7c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2730,6 +2730,7 @@ menu "Security"
 	source "package/optee-test/Config.in"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
+	source "package/qoriq-cst/Config.in"
 	source "package/refpolicy/Config.in"
 	source "package/restorecond/Config.in"
 	source "package/selinux-python/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 595caf9e7f..6a27a6cd4d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -100,6 +100,7 @@ menu "Host utilities"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
+	source "package/qoriq-cst/Config.in.host"
 	source "package/qoriq-rcw/Config.in.host"
 	source "package/qt6/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
diff --git a/package/qoriq-cst/0001-common-port-to-openssl3-evp-api.patch b=
/package/qoriq-cst/0001-common-port-to-openssl3-evp-api.patch
new file mode 100644
index 0000000000..3477896a85
--- /dev/null
+++ b/package/qoriq-cst/0001-common-port-to-openssl3-evp-api.patch
@@ -0,0 +1,438 @@
+From ef3aa97df6d2378eeb2dc53f6097ba79b04884db Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: https://github.com/nxp-qoriq/cst/commit/ef3aa97df6d2378eeb2dc53f=
6097ba79b04884db
+Signed-off-by: L=E9o Denieul <ldenieul@iliad-free.fr>
+---
+ common/crypto_utils.c           | 127 ++++++++++++++++++++++++-------
+ tools/key_generation/gen_keys.c | 131 +++++++++++++++++++-------------
+ 2 files changed, 178 insertions(+), 80 deletions(-)
+
+diff --git a/common/crypto_utils.c b/common/crypto_utils.c
+index 9a83411..0882cd0 100644
+--- a/common/crypto_utils.c
++++ b/common/crypto_utils.c
+@@ -34,36 +34,65 @@
+  */
+ =

+ #include <crypto_utils.h>
+-#include <openssl/ssl.h>
++#include <openssl/evp.h>
++#include <openssl/pem.h>
++#include <openssl/bn.h>
++#include <openssl/rsa.h>
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
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
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_hash_init
+- * Description	:	Wrapper function for SHA256_Init
++ * Description	:	Wrapper function for EVP SHA256 init
+  ************************************************************************=
***/
+ void crypto_hash_init(void *ctx)
+ {
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+-	SHA256_Init(c);
++	EVP_MD_CTX *c =3D EVP_MD_CTX_new();
++
++	*hash_ctx(ctx) =3D c;
++	if (c =3D=3D NULL || EVP_DigestInit_ex(c, EVP_sha256(), NULL) !=3D 1) {
++		fprintf(stderr, "Error in initialising SHA256\n");
++		exit(EXIT_FAILURE);
++	}
+ }
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_hash_update
+- * Description	:	Wrapper function for SHA256_Update
++ * Description	:	Wrapper function for EVP SHA256 update
+  ************************************************************************=
***/
+ void crypto_hash_update(void *ctx, void *data, uint32_t len)
+ {
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+-	SHA256_Update(c, data, len);
++	if (EVP_DigestUpdate(*hash_ctx(ctx), data, len) !=3D 1) {
++		fprintf(stderr, "Error in updating SHA256\n");
++		exit(EXIT_FAILURE);
++	}
+ }
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_hash_final
+- * Description	:	Wrapper function for SHA256_Final
++ * Description	:	Wrapper function for EVP SHA256 final
+  ************************************************************************=
***/
+ void crypto_hash_final(void *hash, void *ctx)
+ {
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+-	SHA256_Final(hash, c);
++	EVP_MD_CTX *c =3D *hash_ctx(ctx);
++
++	if (EVP_DigestFinal_ex(c, hash, NULL) !=3D 1) {
++		fprintf(stderr, "Error in finalising SHA256\n");
++		exit(EXIT_FAILURE);
++	}
++	EVP_MD_CTX_free(c);
++	*hash_ctx(ctx) =3D NULL;
+ }
+ =

+ /************************************************************************=
***
+@@ -79,7 +108,6 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ 	FILE *fp;
+ 	unsigned char buf[IOBLOCK];
+ 	size_t bytes =3D 0;
+-	SHA256_CTX *c =3D (SHA256_CTX *)ctx;
+ =

+ 	/* open the file */
+ 	fp =3D fopen(fname, "rb");
+@@ -102,7 +130,7 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ 			break;
+ 		}
+ =

+-		SHA256_Update(c, buf, bytes);
++		crypto_hash_update(ctx, buf, bytes);
+ 	}
+ =

+ 	fclose(fp);
+@@ -112,14 +140,16 @@ int crypto_hash_update_file(void *ctx, char *fname)
+ =

+ /************************************************************************=
***
+  * Function	:	crypto_rsa_sign
+- * Description	:	Wrapper function for RSA_sign
++ * Description	:	Wrapper function for EVP_PKEY_sign
+  ************************************************************************=
***/
+ int crypto_rsa_sign(void *img_hash, uint32_t len, void *rsa_sign,
+ 			uint32_t *rsa_len, char *key_name)
+ {
+-	int ret;
++	int ret =3D FAILURE;
+ 	FILE *fpriv;
+-	RSA *priv_key;
++	EVP_PKEY *priv_key;
++	EVP_PKEY_CTX *pctx =3D NULL;
++	size_t sign_len;
+ =

+ 	/* Open the private Key */
+ 	fpriv =3D fopen(key_name, "r");
+@@ -128,7 +158,7 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, void=
 *rsa_sign,
+ 		return FAILURE;
+ 	}
+ =

+-	priv_key =3D PEM_read_RSAPrivateKey(fpriv, NULL, NULL, NULL);
++	priv_key =3D PEM_read_PrivateKey(fpriv, NULL, NULL, NULL);
+ 	fclose(fpriv);
+ 	if (priv_key =3D=3D NULL) {
+ 		printf("Error in key reading %s:\n", key_name);
+@@ -136,14 +166,23 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, vo=
id *rsa_sign,
+ 	}
+ =

+ 	/* Sign the Image Hash with Private Key */
+-	ret =3D RSA_sign(NID_sha256, img_hash, len,
+-			rsa_sign, rsa_len,
+-			priv_key);
+-	if (ret !=3D 1) {
++	sign_len =3D EVP_PKEY_size(priv_key);
++	pctx =3D EVP_PKEY_CTX_new(priv_key, NULL);
++	if (pctx =3D=3D NULL ||
++	    EVP_PKEY_sign_init(pctx) !=3D 1 ||
++	    EVP_PKEY_CTX_set_rsa_padding(pctx, RSA_PKCS1_PADDING) !=3D 1 ||
++	    EVP_PKEY_CTX_set_signature_md(pctx, EVP_sha256()) !=3D 1 ||
++	    EVP_PKEY_sign(pctx, rsa_sign, &sign_len, img_hash, len) !=3D 1) {
+ 		printf("Error in Signing\n");
+-		return FAILURE;
++		goto out;
+ 	}
+-	return SUCCESS;
++
++	*rsa_len =3D sign_len;
++	ret =3D SUCCESS;
++out:
++	EVP_PKEY_CTX_free(pctx);
++	EVP_PKEY_free(priv_key);
++	return ret;
+ }
+ =

+ /************************************************************************=
***
+@@ -158,9 +197,15 @@ int crypto_rsa_sign(void *img_hash, uint32_t len, voi=
d *rsa_sign,
+ int crypto_extract_pub_key(char *fname_pub, uint32_t *len, uint8_t *key_p=
tr)
+ {
+ 	FILE *fp;
+-	RSA *pub_key;
+ 	uint32_t key_len;
++	int ret =3D FAILURE;
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++	EVP_PKEY *pub_key;
++	BIGNUM *modulus =3D NULL, *exponent =3D NULL;
++#else
++	RSA *pub_key;
+ 	const BIGNUM *modulus, *exponent;
++#endif
+ =

+ 	fp =3D fopen(fname_pub, "r");
+ 	if (fp =3D=3D NULL) {
+@@ -169,7 +214,11 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t =
*len, uint8_t *key_ptr)
+ 		return FAILURE;
+ 	}
+ =

++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++	pub_key =3D PEM_read_PUBKEY(fp, NULL, NULL, NULL);
++#else
+ 	pub_key =3D PEM_read_RSAPublicKey(fp, NULL, NULL, NULL);
++#endif
+ 	fclose(fp);
+ 	if (pub_key =3D=3D NULL) {
+ 		fprintf(stderr, "Error in key reading %s:\n",
+@@ -177,17 +226,32 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t=
 *len, uint8_t *key_ptr)
+ 		return FAILURE;
+ 	}
+ =

++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++	key_len =3D EVP_PKEY_size(pub_key);
++
++	/* get N and E */
++	if (EVP_PKEY_get_bn_param(pub_key, OSSL_PKEY_PARAM_RSA_N,
++				  &modulus) !=3D 1 ||
++	    EVP_PKEY_get_bn_param(pub_key, OSSL_PKEY_PARAM_RSA_E,
++				  &exponent) !=3D 1) {
++		fprintf(stderr, "Error: %s is not an RSA public key\n",
++			fname_pub);
++		goto out;
++	}
++#else
+ 	key_len =3D RSA_size(pub_key);
+-	*len =3D 2 * key_len;
+ =

+ #if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	/* copy N and E */
+-        modulus =3D (BIGNUM *)pub_key->n;
+-        exponent =3D (BIGNUM *)pub_key->e;
++	modulus =3D (BIGNUM *)pub_key->n;
++	exponent =3D (BIGNUM *)pub_key->e;
+ #else
+ 	/* get N and E */
+ 	RSA_get0_key(pub_key, &modulus, &exponent, NULL);
+ #endif
++#endif
++	*len =3D 2 * key_len;
++
+ 	/* Copy N component */
+ 	BN_bn2bin(modulus, key_ptr);
+ =

+@@ -202,7 +266,16 @@ int crypto_extract_pub_key(char *fname_pub, uint32_t =
*len, uint8_t *key_ptr)
+ 	 */
+ 	BN_bn2bin(exponent, key_ptr + key_len - BN_num_bytes(exponent));
+ =

+-	return SUCCESS;
++	ret =3D SUCCESS;
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++out:
++	BN_free(modulus);
++	BN_free(exponent);
++	EVP_PKEY_free(pub_key);
++#else
++	RSA_free(pub_key);
++#endif
++	return ret;
+ }
+ =

+ /************************************************************************=
***
+diff --git a/tools/key_generation/gen_keys.c b/tools/key_generation/gen_ke=
ys.c
+index da74cc7..c4f7495 100644
+--- a/tools/key_generation/gen_keys.c
++++ b/tools/key_generation/gen_keys.c
+@@ -37,13 +37,18 @@
+  *     Eric Young (eay@cryptsoft.com)"
+  */
+ =

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
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++#include <openssl/encoder.h>
++#endif
+ =

+ #define RSA_LEN1	1024
+ #define RSA_LEN2	2048	=

+@@ -52,79 +57,99 @@
+ #define PRI_KEY_FILE "srk.pri"
+ #define PUB_KEY_FILE "srk.pub"
+ =

+-static int generate_rsa_keys(const unsigned int n, FILE *fpri, FILE *fpub)
++#if OPENSSL_VERSION_NUMBER >=3D 0x30000000L
++static int write_key_pem(EVP_PKEY *pkey, int selection, FILE *fp)
+ {
+-	RSA *srk =3D NULL;
+-	BIGNUM *public_exponent =3D NULL;
+-	int ret =3D 0;
+-
+-	/* Allocate space for RSA structure */
+-	srk =3D RSA_new();
++	OSSL_ENCODER_CTX *ectx;
++	int ok;
+ =

+-	if (srk =3D=3D NULL) {
++	ectx =3D OSSL_ENCODER_CTX_new_for_pkey(pkey, selection, "PEM",
++					     "type-specific", NULL);
++	if (ectx =3D=3D NULL)
+ 		return -1;
+-	}
+ =

+-	public_exponent =3D BN_new();
+-	if (public_exponent =3D=3D NULL || !BN_set_word(public_exponent, RSA_F4)=
) {
+-		BN_free(public_exponent);
+-		return -1;
+-	}
++	ok =3D OSSL_ENCODER_to_fp(ectx, fp);
++	OSSL_ENCODER_CTX_free(ectx);
+ =

+-	ret =3D RSA_generate_key_ex(srk, n, public_exponent, NULL);
+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
+-		return -1;
+-	}
++	return (ok =3D=3D 1) ? 0 : -1;
++}
++
++static int write_private_key(EVP_PKEY *pkey, FILE *fp)
++{
++	return write_key_pem(pkey, EVP_PKEY_KEYPAIR, fp);
++}
+ =

+-	ret =3D PEM_write_RSAPrivateKey(fpri, srk, NULL, NULL, 0, 0, NULL);
++static int write_public_key(EVP_PKEY *pkey, FILE *fp)
++{
++	return write_key_pem(pkey, EVP_PKEY_PUBLIC_KEY, fp);
++}
++#else
++static int write_private_key(EVP_PKEY *pkey, FILE *fp)
++{
++	RSA *rsa =3D EVP_PKEY_get1_RSA(pkey);
++	int ok;
+ =

+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
++	if (rsa =3D=3D NULL)
+ 		return -1;
+-	}
++	ok =3D PEM_write_RSAPrivateKey(fp, rsa, NULL, NULL, 0, 0, NULL);
++	RSA_free(rsa);
++
++	return (ok =3D=3D 1) ? 0 : -1;
++}
+ =

+-	ret =3D PEM_write_RSAPublicKey(fpub, srk);
++static int write_public_key(EVP_PKEY *pkey, FILE *fp)
++{
++	RSA *rsa =3D EVP_PKEY_get1_RSA(pkey);
++	int ok;
+ =

+-	if (!ret) {
+-		RSA_free(srk);
+-		BN_free(public_exponent);
++	if (rsa =3D=3D NULL)
+ 		return -1;
+-	}
++	ok =3D PEM_write_RSAPublicKey(fp, rsa);
++	RSA_free(rsa);
+ =

+-#ifdef DEBUG
+-	printf("public modulus (n):\n");
+-	printf("%s\n", BN_bn2hex(srk->n));
++	return (ok =3D=3D 1) ? 0 : -1;
++}
++#endif
+ =

+-	printf("public exponent (e):\n");
+-	printf("%s\n", BN_bn2hex(srk->e));
++static int generate_rsa_keys(const unsigned int n, FILE *fpri, FILE *fpub)
++{
++	EVP_PKEY *srk =3D NULL;
++	EVP_PKEY_CTX *ctx;
++	int ret =3D -1;
+ =

+-	printf("private exponent (d):\n");
+-	printf("%s\n", BN_bn2hex(srk->d));
++	ctx =3D EVP_PKEY_CTX_new_id(EVP_PKEY_RSA, NULL);
++	if (ctx =3D=3D NULL)
++		return -1;
+ =

+-	printf("secret prime factor (p):\n");
+-	printf("%s\n", BN_bn2hex(srk->p));
+-	printf("secret prime factor (q):\n");
+-	printf("%s\n", BN_bn2hex(srk->q));
++	if (EVP_PKEY_keygen_init(ctx) !=3D 1 ||
++	    EVP_PKEY_CTX_set_rsa_keygen_bits(ctx, n) !=3D 1 ||
++	    EVP_PKEY_keygen(ctx, &srk) !=3D 1)
++		goto out;
+ =

+-	printf("dmp1 [ d mod (p-1) ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->dmp1));
+-	printf("dmq1 [ d mod (q-1) ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->dmq1));
++	if (write_private_key(srk, fpri) !=3D 0)
++		goto out;
+ =

+-	printf("iqmp [ q^-1 mod p ]:\n");
+-	printf("%s\n", BN_bn2hex(srk->iqmp));
++	if (write_public_key(srk, fpub) !=3D 0)
++		goto out;
+ =

+-	printf("RSA SIZE: %d\n", RSA_size(srk));
++#ifdef DEBUG
++	{
++		BIO *out =3D BIO_new_fp(stdout, BIO_NOCLOSE);
+ =

++		if (out !=3D NULL) {
++			EVP_PKEY_print_private(out, srk, 0, NULL);
++			BIO_free(out);
++		}
++		printf("RSA SIZE: %d\n", EVP_PKEY_size(srk));
++	}
+ #endif
+ =

+-	RSA_free(srk);
+-	BN_free(public_exponent);
++	ret =3D 0;
++out:
++	EVP_PKEY_free(srk);
++	EVP_PKEY_CTX_free(ctx);
+ =

+-	return 0;
++	return ret;
+ }
+ =

+ void usage(void)
+-- =

+2.53.0
+
diff --git a/package/qoriq-cst/Config.in b/package/qoriq-cst/Config.in
new file mode 100644
index 0000000000..9a12564d07
--- /dev/null
+++ b/package/qoriq-cst/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QORIQ_CST
+	bool "qoriq-cst"
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
diff --git a/package/qoriq-cst/Config.in.host b/package/qoriq-cst/Config.in=
.host
new file mode 100644
index 0000000000..c1e5d36e1f
--- /dev/null
+++ b/package/qoriq-cst/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_QORIQ_CST
+	bool "host qoriq-cst"
+	help
+	  NXP Code Signing Tool for QorIQ and Layerscape secure boot.
+	  Provides tools to generate keys, create security headers and
+	  sign firmware images, especially the bootloader.
+
+	  https://github.com/nxp-qoriq/cst
diff --git a/package/qoriq-cst/qoriq-cst.hash b/package/qoriq-cst/qoriq-cst=
.hash
new file mode 100644
index 0000000000..70da431658
--- /dev/null
+++ b/package/qoriq-cst/qoriq-cst.hash
@@ -0,0 +1,2 @@
+sha256  6a4febf221c894cd0566d4c35722b8df753b386b8871deedfed5b5f4d52e09c3  =
qoriq-cst-lf-6.18.37-2.1.0.tar.gz
+sha256  7c8437ed27fc42fb35a90e3be5f1dfbe1b877058df1784eeb59057ceb5acc8cc  =
LICENSE
diff --git a/package/qoriq-cst/qoriq-cst.mk b/package/qoriq-cst/qoriq-cst.mk
new file mode 100644
index 0000000000..0ce3a68fde
--- /dev/null
+++ b/package/qoriq-cst/qoriq-cst.mk
@@ -0,0 +1,45 @@
+##########################################################################=
######
+#
+# qoriq-cst
+#
+##########################################################################=
######
+
+QORIQ_CST_VERSION =3D lf-6.18.37-2.1.0
+QORIQ_CST_SITE =3D $(call github,nxp-qoriq,cst,$(QORIQ_CST_VERSION))
+QORIQ_CST_LICENSE =3D BSD-3-Clause
+QORIQ_CST_LICENSE_FILES =3D LICENSE
+
+QORIQ_CST_DEPENDENCIES =3D openssl
+HOST_QORIQ_CST_DEPENDENCIES =3D host-openssl
+
+define QORIQ_CST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC=3D"$(TARGET_CC)" \
+		LD=3D"$(TARGET_CC)" \
+		CROSS_COMPILE=3D"$(TARGET_CROSS)"
+endef
+
+define QORIQ_CST_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE=3D"" DESTDIR=3D$(TARGET_DIR) \
+		prefix=3D/usr install
+endef
+
+define HOST_QORIQ_CST_BUILD_CMDS
+	$(HOST_MAKE_ENV) \
+	CFLAGS=3D"$(HOST_CFLAGS)" \
+	LDFLAGS=3D"$(HOST_LDFLAGS)" \
+	$(MAKE) -C $(@D) \
+		CC=3D"$(HOSTCC)" \
+		LD=3D"$(HOSTCC)" \
+		CROSS_COMPILE=3D""
+endef
+
+define HOST_QORIQ_CST_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		MANPAGE=3D"" DESTDIR=3D$(HOST_DIR) \
+		prefix=3D/usr install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- =

2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
