Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9363FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BBFB4034B;
	Sat, 30 Apr 2022 18:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhupjNsSK-62; Sat, 30 Apr 2022 18:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47731404C6;
	Sat, 30 Apr 2022 18:50:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86DD31BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72DDC404EE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxa7v0yDRh0b for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:50:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53AC4404C3
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:50:36 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b24so12472641edu.10
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ysMliYWH8LAj/o5ORGXCj0qpV/+oL5xXr6QEOz224U=;
 b=JIi0Q0Bxmkkulg8osERrwcehrpQUawildKz/OFmGDVgq6Qe0P5n0ugSnw3SwZuxt/u
 qSKlw2F3MPJM3K7USwEXCgzWLo3awBSJfgeSvaR4h1LUP2C8djT5ePMHy+sr58+4Skn3
 8fbPQhXxbMmxjecOow4LAkdSirkzhmowgoJ3eOgw2JWBq4YYVW+gUNG5qtJoVz3jEGIW
 5MbkPxuf+0ACfVZfi1oLg7phPVTTI1R3SELi/mJ6mO931hfXPR7l9daHP0gvhVZ/Ru2l
 xSRLCy0lqynSHJqSrg51xGiUmGfcXdRsDYOkyZIBdkIebOLOlhXTdOioFCSIALzCCKic
 ud7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ysMliYWH8LAj/o5ORGXCj0qpV/+oL5xXr6QEOz224U=;
 b=qyrNMCC2ruW5cx1fUiJwBzJ+EUx0SlGt5HzGW6UaRAtrsxTIK2qAJSlNdDVspb92RN
 cp+vP96c4Gkw3plKk7/ktr4ydOjh5nKDMm8y4ULDcr9bRRYXWZesh9WvblT9FGqT3RjO
 d5JeZxPgLDhKkBgbvFtTOVqRFXglKx3O/j/+7bgfuMwypoWFpKqo1urDEn4tV8tQVizh
 kuAQorF3QzJEq8I/jTXbH7z9fpgDKjciae3fpnM8ehJ/3d9OR+VGFf8ltItqul2DG1Ny
 DPOezwr1r9ktHOCBVVvj6vlwoP+/es1MX3dmuN7rm/hFCwGWjXJwas9aB9bPYEMywsQW
 74iQ==
X-Gm-Message-State: AOAM533zBUE/SRA4R0JTFR1GBI8uT1A8xxZUxvAIxIntZkyOpGT5feiP
 h4oDKBL1d7dwuGXZ+MDpQqtnIg==
X-Google-Smtp-Source: ABdhPJzKlKqX/MlziQHoUDyTwKcC21ViqQd+0n5dl8Yjj+q11ENTS8Omi7YFMlNy0bKGuB9rp4kiSA==
X-Received: by 2002:a50:eb87:0:b0:425:c3e2:17a9 with SMTP id
 y7-20020a50eb87000000b00425c3e217a9mr5561728edr.109.1651344634403; 
 Sat, 30 Apr 2022 11:50:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gz25-20020a170907a05900b006f3ef214e63sm1862494ejc.201.2022.04.30.11.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:50:33 -0700 (PDT)
Message-ID: <740d615d-29c0-565e-b502-7ad4be5d6d13@mind.be>
Date: Sat, 30 Apr 2022 20:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220428204048.4003582-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220428204048.4003582-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libldns: fix build with
 libressl >= 3.5.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/04/2022 22:40, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> ./dnssec.c: In function 'ldns_key_buf2dsa_raw':
> ./dnssec.c:386:5: error: invalid use of incomplete typedef 'DSA' {aka 'struct dsa_st'}
>    386 |  dsa->p = P;
>        |     ^~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/d754fbaa8f6687597682fbf0b71c16527c8cd603
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...se-accessors-for-DSA-and-RSA-objects.patch | 96 +++++++++++++++++++
>   1 file changed, 96 insertions(+)
>   create mode 100644 package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch
> 
> diff --git a/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch b/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch
> new file mode 100644
> index 0000000000..f7ebbbf8b2
> --- /dev/null
> +++ b/package/libldns/0001-Use-accessors-for-DSA-and-RSA-objects.patch
> @@ -0,0 +1,96 @@
> +From 887d618239312cc8c11e41c45492eee02a8f28a2 Mon Sep 17 00:00:00 2001
> +From: Theo Buehler <tb@openbsd.org>
> +Date: Tue, 11 Jan 2022 21:14:24 +0100
> +Subject: [PATCH] Use accessors for DSA and RSA objects
> +
> +In the upcoming LibreSSL version 3.5, the DSA and RSA structs will
> +become opaque, so we should use the OpenSSL 1.1 setters and getters
> +to fix the build.  The relevant API has been available since
> +LibreSSL 2.7. The last LibreSSL version (2.6) not having these
> +accessors was EOL late 2018, so no users should be affected by this
> +change.
> +
> +[Retrieved from:
> +https://github.com/NLnetLabs/ldns/commit/887d618239312cc8c11e41c45492eee02a8f28a2]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + dnssec.c   | 4 ++--
> + host2str.c | 4 ++--
> + keys.c     | 6 +++---
> + 3 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/dnssec.c b/dnssec.c
> +index 63fece52..fbaa518a 100644
> +--- a/dnssec.c
> ++++ b/dnssec.c
> +@@ -381,7 +381,7 @@ ldns_key_buf2dsa_raw(const unsigned char* key, size_t len)
> + 		BN_free(Y);
> + 		return NULL;
> + 	}
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
> + #ifndef S_SPLINT_S
> + 	dsa->p = P;
> + 	dsa->q = Q;
> +@@ -468,7 +468,7 @@ ldns_key_buf2rsa_raw(const unsigned char* key, size_t len)
> + 		BN_free(modulus);
> + 		return NULL;
> + 	}
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
> + #ifndef S_SPLINT_S
> + 	rsa->n = modulus;
> + 	rsa->e = exponent;
> +diff --git a/host2str.c b/host2str.c
> +index a207a913..634c5676 100644
> +--- a/host2str.c
> ++++ b/host2str.c
> +@@ -2451,7 +2451,7 @@ ldns_key2buffer_str(ldns_buffer *output, const ldns_key *k)
> + 					const BIGNUM *n=NULL, *e=NULL, *d=NULL,
> + 						*p=NULL, *q=NULL, *dmp1=NULL,
> + 						*dmq1=NULL, *iqmp=NULL;
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
> + 					n = rsa->n;
> + 					e = rsa->e;
> + 					d = rsa->d;
> +@@ -2504,7 +2504,7 @@ ldns_key2buffer_str(ldns_buffer *output, const ldns_key *k)
> + 				if(1) {
> + 					const BIGNUM *p=NULL, *q=NULL, *g=NULL,
> + 						*priv_key=NULL, *pub_key=NULL;
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
> + #ifndef S_SPLINT_S
> + 					p = dsa->p;
> + 					q = dsa->q;
> +diff --git a/keys.c b/keys.c
> +index 91a3dffd..78bea972 100644
> +--- a/keys.c
> ++++ b/keys.c
> +@@ -861,7 +861,7 @@ ldns_key_new_frm_fp_rsa_l(FILE *f, int *line_nr)
> + 	}
> + #endif /* splint */
> +
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
> + # ifndef S_SPLINT_S
> + 	rsa->n = n;
> + 	rsa->e = e;
> +@@ -982,7 +982,7 @@ ldns_key_new_frm_fp_dsa_l(FILE *f, ATTR_UNUSED(int *line_nr))
> + 	}
> + #endif /* splint */
> +
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
> + # ifndef S_SPLINT_S
> + 	dsa->p = p;
> + 	dsa->q = q;
> +@@ -1660,7 +1660,7 @@ ldns_key_rsa2bin(unsigned char *data, RSA *k, uint16_t *size)
> + 	if (!k) {
> + 		return false;
> + 	}
> +-#if OPENSSL_VERSION_NUMBER < 0x10100000 || defined(HAVE_LIBRESSL)
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000 || (defined(HAVE_LIBRESSL) && LIBRESSL_VERSION_NUMBER < 0x20700000)
> + 	n = k->n;
> + 	e = k->e;
> + #else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
