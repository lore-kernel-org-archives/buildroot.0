Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B98CCA47A
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 16:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C109883388;
	Tue, 14 Jun 2022 16:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhuUpacNtaKO; Tue, 14 Jun 2022 16:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D442F8331B;
	Tue, 14 Jun 2022 16:58:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E33D1BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2E041852
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 00gHe7T6t3Es for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:57:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4DDC417D9
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:57:41 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id v1so18310272ejg.13
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=uZqx2sv3HMFUk94ShOKiw/P3OTFXeO1KH0Vq8VF0s+g=;
 b=F0JyVTqnegfZoZPjSdcpMRJM3Z+gnnKdz2g2FyFmaVeNgr/Mtskl6cBhvgUE0bndya
 e2A5iLIkgbf+rQmQ+GJm491gYcpqkNnldDMddgTRKR/UuFdcqaPCwZM3yD3suiJisMNE
 Zynw1bBHeFVe7+ApzNJXtA7BO9jK9VOqOZ0I74c7+IUnKArzAcg8o64jeXZG9PzfzGWV
 7T8wE4zKddXIrMVG+UYO/gJKCxmcUsrR9VoXL/fHgZbUNnJfvy6cgY9iK7IydM5U0N1J
 zPXJ/7GR7V9I2kDw9gF5h3BNzW1MDvwoVxrEQd/vbld6Lkhh4xFgx1jW6Rog6ZoAeiSr
 72cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uZqx2sv3HMFUk94ShOKiw/P3OTFXeO1KH0Vq8VF0s+g=;
 b=oWwWhWzeoy4lpJY6AsTJy8BBX8vN4PhP4otJg6adrQgs2KiqN+nuCFdUjocK6VCvxL
 +hVlZnYZ2y86Unw47UxwmUspwZdUjIHg0RU+pkNLtD+UXoA/6UhV2Rled6j5EQdK3Q7S
 wWtMjmmphkKZmXIsQkZLlaLHlJcONARSHfJPpBnWjf35ETnBDJ8qJ4j23YlEuzu0BCHn
 WudGfO/sH1q7mGyA5zbLLIGUv0QkoWyBoyVG4M4DVnKaMAiWGLGB/V+7TzZgCoXUGwvJ
 GqTgxSzETL1n4aNHiFCz/iy0HmntZLaNfWhpv8Cs1vVz2BcGN8nB0JJNzNhVvfXWn+7C
 sySg==
X-Gm-Message-State: AOAM5329v8STSkCOlF91N8sR+7CBknnoleVaVOumXjW4qWJFgxieGYdV
 Pig+owd/FTXwJ7ZdoabMuYw0pKS0VQyc/w==
X-Google-Smtp-Source: AGRyM1uXzrMnySBH1VhxzlRImAJnvhMcoEeNSk6aJ4Q0XRZtnMc0UuygvpcoKZbAqqkxWBMAnTuxrA==
X-Received: by 2002:a17:906:6d98:b0:715:76eb:9e33 with SMTP id
 h24-20020a1709066d9800b0071576eb9e33mr5097589ejt.729.1655225860065; 
 Tue, 14 Jun 2022 09:57:40 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 14-20020a170906328e00b006fee961b9e0sm5185732ejw.195.2022.06.14.09.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:57:39 -0700 (PDT)
Message-ID: <c19504dc-3125-a315-3dac-1e8291b75a0b@mind.be>
Date: Tue, 14 Jun 2022 18:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220611114053.89542-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220611114053.89542-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ruby: fix build with libressl
 >= 3.5.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/06/2022 13:40, Fabrice Fontaine wrote:
> Fix the following build failure with libressl raised since bump to
> version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> ossl_pkey.c: In function 'ossl_pkey_export_traditional':
> ossl_pkey.c:681:62: error: invalid use of incomplete typedef 'EVP_PKEY' {aka 'struct evp_pkey_st'}
>    681 |  EVP_PKEY_asn1_get0_info(NULL, NULL, NULL, NULL, &aname, pkey->ameth);
>        |                                                              ^~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/9b2622fbc4c2c2b787578ee83fc6a23795a84415
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Fix-build-with-LibreSSL-3-5.patch    | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
> 
> diff --git a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
> new file mode 100644
> index 0000000000..039a6466d6
> --- /dev/null
> +++ b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
> @@ -0,0 +1,25 @@
> +From e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d Mon Sep 17 00:00:00 2001
> +From: Jeremy Evans <code@jeremyevans.net>
> +Date: Fri, 25 Mar 2022 13:11:31 -0700
> +Subject: [PATCH] Fix build with LibreSSL 3.5
> +
> +[Retrieved from:
> +https://github.com/ruby/openssl/commit/e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + ext/openssl/ossl_pkey.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ext/openssl/ossl_pkey.c b/ext/openssl/ossl_pkey.c
> +index 2a4835a2..24d0da46 100644
> +--- a/ext/openssl/ossl_pkey.c
> ++++ b/ext/openssl/ossl_pkey.c
> +@@ -670,7 +670,7 @@ ossl_pkey_export_traditional(int argc, VALUE *argv, VALUE self, int to_der)
> + 	}
> +     }
> +     else {
> +-#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
> ++#if OSSL_OPENSSL_PREREQ(1, 1, 0) || OSSL_LIBRESSL_PREREQ(3, 5, 0)
> + 	if (!PEM_write_bio_PrivateKey_traditional(bio, pkey, enc, NULL, 0,
> + 						  ossl_pem_passwd_cb,
> + 						  (void *)pass)) {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
