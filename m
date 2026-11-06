Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F9606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z5EjoNRi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3051681DFC;
	Fri,  6 Nov 2026 16:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfyW1l3p8Vgw; Fri,  6 Nov 2026 16:10:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1515781E04
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981430;
	b=amlji603iXFRwIO1q3JH5DaV91mU4WwfniLZ2LF7A+oEbXivHLg+XseXqVj6oKnSwjSP
	 oNpO2xtiuXc05th6MHV67JeqAXxhfOVGH0c8DXlsRs4jU/t9Mki8yTafoTE8wj0b/603m
	 Hd03241RaUZ5OegbXwzV0YLMbTYgPd1K6zjdpjKRpenbMcdCUvEIaD/Tv3F6rPUjqBZdS
	 WqUs+nIZm75JlVAnkCKem2jk9zULItQ8iY6ua4yzfGSGSuLmTS5s55VNTJQHMVNXkTdDE
	 1RnlYz2pIqL4ZLqVilLqunwQXAG4C+WSwHe/0FBOJK+fj1aJhzxk9US3ccswmTkGf2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981430;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RhGO0kDm5NdjYhLS+NAF53z5XWoyThYMmpisDoVZdc8=;
	b=OOhgKsM4M5UAmePTAXEHKii3jJbP/eovX8YMBizZmCnQ3L3EW3FLka02W4eNnIfSUc1H
	 ul1KxZ5d/mZBGAFuskWRsQE5MYn1fw3UX6+dFPYHOSEC7EXWUMzIwZXh7jrjYxTJ68KLE
	 cuGqsOgxxGfOBf8jmupUsrBdc3My9RVaQ8RoXVsizeUuNzuMO7nqm9PH/Xq+sYyVSCcr4
	 2GvzusIt7BRebFeyB3dj/4RMcFRHfhMZeY9LzhvgWwviKFHtfkOiHdJJIsT6uFPMx/JcZ
	 I12um24hSUv6SKA5GCTr/LdMw13lW4qLsUzZ71Ajk+C93Q1Q0qqZ7NBBGmoYNUlwThA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981430;
	bh=RhGO0kDm5NdjYhLS+NAF53z5XWoyThYMmpisDoVZdc8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z5EjoNRiHWNcjR6wh4CAEv73qWCd0s5P71bobPYB2Kq375L1DY3BIpkTnzoMIz/B2
	 1MnjHvvyfHxA1/95/TSrq6qD2FLieREEngCNZ+7idutmQh84SgLcQO6xkvXki8wXC3
	 jwxWMYcpiEZrvJNnHyZxt+QuJZjxi79b5ZYI9jsRF4Cc1IrbRrhyu6zIheaOoH/hzT
	 ZDf2938NeLH0YfA9nMMzJ11tHr/tBuaz5HORxlw/zUFh6jZoejniitFLQmgMEkDi02
	 mir+Bq7qgLsqjhcvMqgTmDF2LkuqqzWhyz7xQ/5KZAP2pouSC+Pni5FAthze5uHRkD
	 biuOk5mxI6t2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1515781E04;
	Fri,  6 Nov 2026 16:10:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5692C4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 541D7403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUQfCaj3OhDb for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 149C9400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 149C9400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:26 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-490585eddfcso559932f8f.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981425; x=1794586225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ycgK/JqkipGE8UxurlKdIhQ8T3ItJ/xnoGuEA+ca1no=;
 b=ZA0eZjOYywpWq1SJFkOF+7H5GMhiFI+14Xe4D0Hy0UeVXQHQL0WSMOMTfDCvgSh4pW
 ttVsGKlOTJSyGsw6R4B67zBgbf7UEMwKl1Pq2bjcMrJE7lJ594qAVSwuslBSbzv4QyB7
 ds3AiS5UBXvGb2yvs2EsgGz/c1rvn2dhZggsfLd6ZilKfM+TTiYbsA09KXqEo3esoyae
 LrDqKydFkJyVOU7enCQLdaHq5NE5TZLGORFTx4vQlO4cXgy22greYACuGTI5FCQ/sRcg
 NfDQ6zBoN/QCRF6GEo6jPQ8eZ2MmG8ugeKYm+eWYZrjMrcP51TOCL1cXCcIiKF3Hk65n
 BVrg==
X-Gm-Message-State: APuU4Z8TZbwb4s80CMf940HVK+3a+fPfHGWLvjUgo+v0Mpx3NqX8TZxD
 KkBEyKaJ57m9ld2JbUfnXEsjTlsPPflcioUHQ06xj5R5+tk9Bd+6IojPGy7ZQfixvAWc3LxBlgI
 wFppv0Lg=
X-Gm-Gg: AYBFou2m6/dSksL9OPGa/nuYpEgud6Uq1mbf7vNfri/rJrX99uomtiyiWJkZPsp6ysg
 DSSkqD4hLLWSvYHC+9CIT7kw/a4ZjVzNpkSG/KpebZF8FY1ny7Ojfx2sIbyCwQyCZsI7ELSWaeH
 KcDBL6170fhxzyvx03TGnWzVYLA6M+L8gGHOKrsyG8VB2Ps0QI7l/WsQtgDxvogN0+ifDcM0rIj
 aoNMrGG/zetvFhccVH+NO0nIw2sccOzi45CzWj7e0fGFaSpsSbx3iLLRZp0Bpspec3SdJPqfRFf
 qeY5aIcrztB0AA7z+grVv0KVTz1+ETgDJ62hpi+4whFJeR5p2WNJw02GvSQrKmvIiIpAP9Fu9no
 HXt64f4smSbp6QMmc+5U41cw7wbOUOlstSoLEODKCqF1CCHQRQtp7Dm6UGhTtdpGRuHo2RgEy0D
 ZHFvAxB+Fo+8ndGjppuSncu2/Fari2+ASmpQ+w8FTPzbZ2In0YaOD0zB+d3SqPzSWB3+qYxEbk3
 bnNxvGaq2m7ajMVSRpPBxTyGcf/gzLPyYUXiL7rCWH9byQmUVdw5CuzyV/zODOaID0YVldfNVBM
 2ujUk7T9j1qmIoOc75VjypqZCo2U+yPekaQnwmtCjgq2F8Fahc/v
X-Received: by 2002:a05:6000:3113:b0:492:4156:b8f2 with SMTP id
 ffacd0b85a97d-49278174809mr6960221f8f.54.1793981424768; 
 Fri, 06 Nov 2026 08:10:24 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d6d63ad7sm4962686f8f.15.2026.11.06.08.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:24 -0800 (PST)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:21 +0100
Message-ID: <20261106161022.607611-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028155122.3226008-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 1/3] package/systemd: bump version to
 258.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> This is a stable patch release, no changes to options/services. The
> default for the dns-servers option in meson_options.txt has changed to
> use different domain names for the Cloudflare DNS servers, but the
> same IP addresses.
> 
> Remove patch included upstream [1].
> 
> [1] https://github.com/systemd/systemd/commit/3ed9869c4780846b4a5380bf921073fa2fac0730
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to 2026.08.x. Thanks

> ---
> Changes v3 -> v4:
> * replace adding a ukify patch with update to a fixed version from the
>   same stable branch
> 
>  ...compilation-with-openssl-4.0.0-beta1.patch | 86 -------------------
>  package/systemd/systemd.hash                  |  2 +-
>  package/systemd/systemd.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 88 deletions(-)
>  delete mode 100644 package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
> 
> diff --git a/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch b/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
> deleted file mode 100644
> index d38be8d51b..0000000000
> --- a/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -From 693ecaac7e12c120d1323478b2433d77367aa0c9 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>
> -Date: Tue, 14 Apr 2026 18:59:07 +0200
> -Subject: [PATCH] various: fix compilation with openssl-4.0.0-beta1
> -
> -Various types have been made opaque, so we need to use some accessor
> -functions.
> -
> -Upstream: https://github.com/systemd/systemd/commit/693ecaac7e12c120d1323478b2433d77367aa0c9
> -
> -[Bernd: rebased for 258.7]
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - src/sbsign/sbsign.c      |  5 +++--
> - src/shared/pkcs11-util.c | 15 ++++++++-------
> - 2 files changed, 11 insertions(+), 9 deletions(-)
> -
> -diff --git a/src/sbsign/sbsign.c b/src/sbsign/sbsign.c
> -index ee1c0f77ab..f54dacf65a 100644
> ---- a/src/sbsign/sbsign.c
> -+++ b/src/sbsign/sbsign.c
> -@@ -262,8 +262,9 @@ static int spc_indirect_data_content_new(const void *digest, size_t digestsz, ui
> -                 return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to get SpcPeImageData object: %s",
> -                                        ERR_error_string(ERR_get_error(), NULL));
> - 
> --        idc->data->value->value.sequence->data = TAKE_PTR(peidraw);
> --        idc->data->value->value.sequence->length = peidrawsz;
> -+        if (!ASN1_STRING_set(idc->data->value->value.sequence, peidraw, peidrawsz))
> -+                return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to set ASN1_STRING data.");
> -+
> -         idc->messageDigest->digestAlgorithm->algorithm = OBJ_nid2obj(NID_sha256);
> -         if (!idc->messageDigest->digestAlgorithm->algorithm)
> -                 return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to get SHA256 object: %s",
> -diff --git a/src/shared/pkcs11-util.c b/src/shared/pkcs11-util.c
> -index 165fefbea1..96b25c4ac3 100644
> ---- a/src/shared/pkcs11-util.c
> -+++ b/src/shared/pkcs11-util.c
> -@@ -555,7 +555,11 @@ int pkcs11_token_read_public_key(
> -                         return log_debug_errno(SYNTHETIC_ERRNO(EIO), "Failed to init an EVP_PKEY_CTX for EC.");
> - 
> -                 OSSL_PARAM ec_params[8] = {
> --                        OSSL_PARAM_octet_string(OSSL_PKEY_PARAM_PUB_KEY, os->data, os->length)
> -+                        /* We need to drop the const from the data param, because ec_params is
> -+                         * modified below. But we'll not modify ec_params[0]. */
> -+                        OSSL_PARAM_octet_string(OSSL_PKEY_PARAM_PUB_KEY,
> -+                                                (unsigned char *) ASN1_STRING_get0_data(os),
> -+                                                ASN1_STRING_length(os)),
> -                 };
> - 
> -                 _cleanup_free_ void *order = NULL, *p = NULL, *a = NULL, *b = NULL, *generator = NULL;
> -@@ -683,13 +687,10 @@ int pkcs11_token_read_x509_certificate(
> -                 CK_OBJECT_HANDLE object,
> -                 X509 **ret_cert) {
> - 
> --        _cleanup_free_ char *t = NULL;
> -         CK_ATTRIBUTE attribute = {
> -                 .type = CKA_VALUE
> -         };
> -         CK_RV rv;
> --        _cleanup_(X509_freep) X509 *x509 = NULL;
> --        X509_NAME *name = NULL;
> -         int r;
> - 
> -         r = dlopen_p11kit();
> -@@ -713,15 +714,15 @@ int pkcs11_token_read_x509_certificate(
> -                                        "Failed to read X.509 certificate data off token: %s", sym_p11_kit_strerror(rv));
> - 
> -         const unsigned char *p = attribute.pValue;
> --        x509 = d2i_X509(NULL, &p, attribute.ulValueLen);
> -+        _cleanup_(X509_freep) X509 *x509 = d2i_X509(NULL, &p, attribute.ulValueLen);
> -         if (!x509)
> -                 return log_debug_errno(SYNTHETIC_ERRNO(EBADMSG), "Failed to parse X.509 certificate.");
> - 
> --        name = X509_get_subject_name(x509);
> -+        const X509_NAME *name = X509_get_subject_name(x509);
> -         if (!name)
> -                 return log_debug_errno(SYNTHETIC_ERRNO(EBADMSG), "Failed to acquire X.509 subject name.");
> - 
> --        t = X509_NAME_oneline(name, NULL, 0);
> -+        _cleanup_free_ char *t = X509_NAME_oneline(name, NULL, 0);
> -         if (!t)
> -                 return log_debug_errno(SYNTHETIC_ERRNO(EIO), "Failed to format X.509 subject name as string.");
> - 
> --- 
> -2.47.3
> -
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index e96d3ba7ad..cb652998cd 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  6bd311c25f00d634ae3b4544d582e27df0d4166e6ba3d403b18b3129d7f44cae  systemd-258.7.tar.gz
> +sha256  5062da9c9b0b6fd3ed0efaa2c6ec37be2e634c6e516abd6275ee42f85282c891  systemd-258.12.tar.gz
>  sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
>  sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
>  sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 52c434b28e..346d034822 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 258.7
> +SYSTEMD_VERSION = 258.12
>  SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>  	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
