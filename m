Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D9FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC18381411;
	Sat, 23 Apr 2022 15:04:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dq_oFLEfw0dU; Sat, 23 Apr 2022 15:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E09DE8134C;
	Sat, 23 Apr 2022 15:04:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C2271BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 066C360BC8
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SIiEucLIfeF for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:04:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0080B60BA8
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:04:23 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ks6so21616152ejb.1
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=8gDMDqQ5ZWTj/crlbvKFbHE+W+kBi6ddLvmLCT8P8bU=;
 b=DP516KxN2EPBX03dm3VtTAz3dZIKCgt0cnX+1tpnHXoVIfFIZboUXGQ2SWCRMlNzRy
 DcquUgX6Nvu9Z1WUfwYQOeiyLx0zunM6+3RRbneaY9OxWqq5z4MjbWFkDmCvUFWpR3T3
 dGBSf2UWe4N0Hh6SwVD/DNpLmAQM9reGiqzEGBxCYiafbmDOssKo7GKgdYS/r51WoRnY
 w74xgTfQoFaNIKunOL9qSKn8pPnuUjoDKoZuRCUrP/nNhKRK5mJZSOz4qR2BZxV64n4U
 n/ZYin2vLmuhriUZgc5wlAQG3uB0Sv1FUC3p9aeHS3XA7En0wzy1LCvmw230s3AURjSe
 yVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8gDMDqQ5ZWTj/crlbvKFbHE+W+kBi6ddLvmLCT8P8bU=;
 b=oNAUci8LgQ941dFJ/hTyLZlcl+ehRM9Bb4UKXKbbmVdzQQe9EiOPKRUc0BhYBkxaFh
 QSEo9iWN3Igo8URj/0ooZ/q4hiLUsJSsTMrZzGnws77mCxGLGLyymu9hJ4+jBpMEg1UB
 dKwh8S63xe75elZ6KWucK61yhgdxaD7wleWoH6HUpUgFLuROSNjwFl4oYHEqwoRA0by/
 hAidwqla/802el/QCa9OXIXd+U1kSF55tF7TwS89hS48H01rkrFWeKw1Wap0x64uufOP
 G74gSkgKMg36gT6cmHH7UQRqrNIa5gvkZWUzqjgwAA/MdeuulGr2wzQaIGs0wHHk5B1e
 6NIg==
X-Gm-Message-State: AOAM533O1UgntFWdc++oOe+c82AHdVbriVminwhmAOMN2L7A9UqDQ3/x
 xlGZDdALlPnkOSxjbyeP/x/SuRQM9QoEYg==
X-Google-Smtp-Source: ABdhPJzsCzxST7Jkye+y+0Jh7WBLsOdP6ReKB1vRNa7NkL5JvvZgCVMctXpUbbuF16dgx+ncs8BkbA==
X-Received: by 2002:a17:906:4fc8:b0:6d8:5059:f998 with SMTP id
 i8-20020a1709064fc800b006d85059f998mr8830600ejw.487.1650726262320; 
 Sat, 23 Apr 2022 08:04:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a17090666da00b006ef79b595e9sm1752062ejp.80.2022.04.23.08.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:04:21 -0700 (PDT)
Message-ID: <897db641-965a-9334-21eb-3321cac0d3bf@mind.be>
Date: Sat, 23 Apr 2022 17:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220418215412.892842-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220418215412.892842-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/mariadb: fix build with libressl
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



On 18/04/2022 23:54, Fabrice Fontaine wrote:
> Fix the following build failure with libressl:
> 
> CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following cache variables appropriately:
>     LIBRESSL_RESULT (advanced)
>     LIBRESSL_RESULT__TRYRUN_OUTPUT (advanced)
> For details see /nvmedata/autobuild/instance-27/output-1/build/mariadb-10.3.34/TryRunResults.cmake
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/cbdbfcdae4b89ac678e1bf6bcded96872c7223ab
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>   - Prepend "LibreSSL " to $(LIBRESSL_VERSION) as
>     libmariadb/cmake/libressl_version.c prints LIBRESSL_VERSION_TEXT
> 
>   package/mariadb/mariadb.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index 4eb9c71827..18667e7e70 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -60,6 +60,12 @@ MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
>   # Explicitly disable dtrace to avoid detection of a host version
>   MARIADB_CONF_OPTS += -DENABLE_DTRACE=0
>   
> +ifeq ($(BR2_PACKAGE_LIBRESSL),y)
> +MARIADB_CONF_OPTS += \
> +	-DLIBRESSL_RESULT=ON \
> +	-DLIBRESSL_RESULT__TRYRUN_OUTPUT="LibreSSL $(LIBRESSL_VERSION)"
> +endif
> +
>   ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
>   ifeq ($(BR2_PACKAGE_MARIADB_SERVER_EMBEDDED),y)
>   MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
