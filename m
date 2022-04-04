Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E82C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5EEA40567;
	Mon,  4 Apr 2022 18:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHL4BDZEroLp; Mon,  4 Apr 2022 18:02:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD0C2409DC;
	Mon,  4 Apr 2022 18:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72C561BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6276A8293F
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zaGVeqLkMQu5 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:02:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A183828B3
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:02:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id k23so18189435ejd.3
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m7kMTj4iPbT5jL8zX1ci0n9ZhCIWC2JKU58xyyBUh7o=;
 b=f81YbWjvB8yzhsw0IL/8sihnA4KZ42HIvbH1SdW9lqZntZ/ESEg3eP4GF7G8bMVAH3
 7WO5OG6lqTYSAHczMwfbSsILPKiSP4LFIRIxF72pt1B1wJceAEfotJHP/fNIPYEnAvzu
 bPgffkOreSYkZ3fay+7cDLLR/ntJPtcHB4YrzHzRPLcoGm+gTPHCZnOTWbFCxNS+oQ1o
 3rr99uaiGn/4b6hVUcYsNurKOCfcj/pv62N3iusnmXLF5vwvaDpPOJVbLRZkOaXNAYh+
 JBrAvlORllA//RdfArBBR9cZDlq6DudDFj8RJWEAynYRwzN+shyGWYwobeyKRDn8RGsz
 9MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=m7kMTj4iPbT5jL8zX1ci0n9ZhCIWC2JKU58xyyBUh7o=;
 b=YkiFhAnujmlzKAA057NnUyGS9bSGhRWcwNA/sggCSXsuKuP6K6b9WhmZr00ZvHIJ2H
 G4rSwUt/5k3KLW6jN9xp45JwWi3T3u2psCC9UXdiDFnq8wrHicrcHd5/hcQfxplG4yK1
 d6OPoUnm5KPc+wABgel5DE0tJEqEqMbjEH7ExSD2meYNafFIm99sDVZX8PT/uc4R99dD
 ++l+6yqRSdmeOC+S93MQbEyTj3DBj9Bj1rM/2Gil06DI/YydRCxGtewhvraQEcTxWD1a
 cU0mRe2YlFTYFmOk6OYFxLJ0EKGArtYjVFAfmvYLzOIm0ssXXa1j8E7SAxuG9sriqK6k
 MwZQ==
X-Gm-Message-State: AOAM533AHF9/batKr2hM9TlHTCmuX7HHvSlQkxJ+LwDys+RW48hpzAOW
 6IpeMl50EL75mrBmCjpVfzPeWVEkqHtRrw==
X-Google-Smtp-Source: ABdhPJyijGC9+hR7bn/v/4Lt82EFUVtlRB/tTzwLwBsnXVsDpFng9MrziJ1r27cnUvkPDEQ44tbb3A==
X-Received: by 2002:a17:907:8a24:b0:6e7:ee5e:431c with SMTP id
 sc36-20020a1709078a2400b006e7ee5e431cmr1368905ejc.68.1649095349650; 
 Mon, 04 Apr 2022 11:02:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a056402115500b00413c824e422sm5604959edw.72.2022.04.04.11.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:02:29 -0700 (PDT)
Message-ID: <68302099-f74f-4ba0-0db4-92102f2cce94@mind.be>
Date: Mon, 4 Apr 2022 20:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220401165722.540239-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220401165722.540239-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix pkg-config
 without openssl
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
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/04/2022 18:57, Fabrice Fontaine wrote:
> Fix the following build failure with libdbi-drivers raised since bump to
> version 14.1 in commit c9bd02911565819789120370178e82da5dfbacc0 and
> https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=beff361bc1edc24ee5f8b2073a1e5e4c92ea66eb:
> 
> configure: error: Package requirements (libpq) were not met:
> 
> Package 'libssl', required by 'libpq', not found
> Package 'libcrypto', required by 'libpq', not found
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/415cb61a58b928a42623ed90b0b60c59032f0a4e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...libpq-Fix-pkg-config-without-OpenSSL.patch | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch
> 
> diff --git a/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch b/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch
> new file mode 100644
> index 0000000000..90b0577a20
> --- /dev/null
> +++ b/package/postgresql/0001-libpq-Fix-pkg-config-without-OpenSSL.patch
> @@ -0,0 +1,34 @@
> +From 465ab24296c27502c81c8c197725cba728b9b057 Mon Sep 17 00:00:00 2001
> +From: Peter Eisentraut <peter@eisentraut.org>
> +Date: Fri, 1 Apr 2022 17:12:56 +0200
> +Subject: [PATCH] libpq: Fix pkg-config without OpenSSL
> +
> +Do not add OpenSSL dependencies to libpq pkg-config file if OpenSSL is
> +not enabled.  Oversight in beff361bc1edc24ee5f8b2073a1e5e4c92ea66eb.
> +
> +Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Discussion: https://www.postgresql.org/message-id/flat/20220331163759.32665-1-fontaine.fabrice%40gmail.com
> +[Retrieved from:
> +https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=465ab24296c27502c81c8c197725cba728b9b057]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/interfaces/libpq/Makefile | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/interfaces/libpq/Makefile b/src/interfaces/libpq/Makefile
> +index 89bf5e0126..b5fd72a4ac 100644
> +--- a/src/interfaces/libpq/Makefile
> ++++ b/src/interfaces/libpq/Makefile
> +@@ -95,7 +95,9 @@ SHLIB_PREREQS = submake-libpgport
> +
> + SHLIB_EXPORTS = exports.txt
> +
> ++ifeq ($(with_ssl),openssl)
> + PKG_CONFIG_REQUIRES_PRIVATE = libssl libcrypto
> ++endif
> +
> + all: all-lib libpq-refs-stamp
> +
> +--
> +2.30.2
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
