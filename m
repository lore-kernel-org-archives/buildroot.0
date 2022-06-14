Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9199C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F19E83224;
	Tue, 14 Jun 2022 18:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YW4_pEnF4XmE; Tue, 14 Jun 2022 18:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D868831EF;
	Tue, 14 Jun 2022 18:46:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AAA91BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7830D409E3
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPzu3BW9Htvr for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:46:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5AE540191
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:46:01 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bg6so19019412ejb.0
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=fWHr4wXhk95/MMZ1mA3BwI0tU0FtszGGMIyvOMHY5Og=;
 b=a/A1ofCbkZIJ4nVWrt4vN+21rO8esfTAq3s6SJDg3hft9knczcbqBoQfaY79bZUbRC
 cRteeoW+8UQcN8Xe1CUj48gsq3ijVduOqOCvuNH5rI7aq9nMxUFiyfosqDeWtNfUbcE6
 RikFvMdKh+Uhzg+f43wAvSWAmBoLjthQ6gGJf5onz1fYWlg/cvxy4Gyv2ihhDnYfTxfx
 2SZDTSMJQKzgN7yWFAQAVWr+RQtSja0+Xt4FtYPMO+Urq0jX++zWgQus3yTK7MOK3fSI
 cP2oo72zcMV1poceM5TJjMqq6g1MuoEvBC6ICIMo4jfGlbh0F85e4Udu9Speyc4mCStf
 ClTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fWHr4wXhk95/MMZ1mA3BwI0tU0FtszGGMIyvOMHY5Og=;
 b=atn3SOOWVPxBoCN+DoCrdm94Fvome6c2+xTPVsS/Xq8w52FYRUqIdM13DwuXe9Lqen
 ZCmgi+bcuLwhS3Ao1BD2z40KHt/RSirlY0r6L4t0z+X+Sy5urDOY28FZ0BWibL99p6l5
 qqMjmP60CzCTwhmHdXvCn+5hJ8cleOPnhKkFWY9CpR2HqtE3gIR/775BQjs7JNQwXq6k
 NQILt9T0C1swrdCJFJ2BuMFTQpyNgctNeCKbPk+ZTnzn2fgOu15AVf6us0m+FVhH09ui
 /x57tmjD7gZUTYFm6jH6G/dBGhfJwcVYhfvk6fG0b0tI+trOLartIxt1OtQByRDdLriE
 bd9w==
X-Gm-Message-State: AJIora/P/Mn4gkyqHNxLQnjk3QT7liZH6j/zhGHJG9s3IleXJFNOkB0K
 orQhfs0ZQURCMz5H9iRE+NtF0A==
X-Google-Smtp-Source: ABdhPJz8Tpbd1WpR640hVrFCw+RE7JrDgwU/oTySBOdgpS2F/IbFLsFFeKFeI5RJO0+03YgFlJs93g==
X-Received: by 2002:a17:906:5192:b0:712:73e:e15c with SMTP id
 y18-20020a170906519200b00712073ee15cmr5618388ejk.737.1655232359911; 
 Tue, 14 Jun 2022 11:45:59 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 p8-20020a056402500800b0042dc0181307sm7468126eda.93.2022.06.14.11.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:45:59 -0700 (PDT)
Message-ID: <70eb10a0-23e8-d784-e186-5f3892d1ff37@mind.be>
Date: Tue, 14 Jun 2022 20:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220611130631.359062-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220611130631.359062-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libabseil-cpp: drop
 unrecognized option
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



On 11/06/2022 15:06, Fabrice Fontaine wrote:
> ABSL_RUN_TESTS has been replaced by the standard BUILD_TESTING option
> (which is already passed by cmake infrastructure) since version
> 20210324.0 and
> https://github.com/abseil/abseil-cpp/commit/a50ae369a30f99f79d7559002aba3413dac1bd48
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libabseil-cpp/libabseil-cpp.mk | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
> index 738cd03c39..7c6bda7659 100644
> --- a/package/libabseil-cpp/libabseil-cpp.mk
> +++ b/package/libabseil-cpp/libabseil-cpp.mk
> @@ -13,14 +13,12 @@ LIBABSEIL_CPP_INSTALL_STAGING = YES
>   LIBABSEIL_CPP_CONF_OPTS = \
>   	-DCMAKE_CXX_STANDARD=11 \
>   	-DABSL_ENABLE_INSTALL=ON \
> -	-DABSL_USE_GOOGLETEST_HEAD=OFF \
> -	-DABSL_RUN_TESTS=OFF
> +	-DABSL_USE_GOOGLETEST_HEAD=OFF
>   
>   HOST_LIBABSEIL_CPP_CONF_OPTS = \
>   	-DCMAKE_CXX_STANDARD=11 \
>   	-DABSL_ENABLE_INSTALL=ON \
> -	-DABSL_USE_GOOGLETEST_HEAD=OFF \
> -	-DABSL_RUN_TESTS=OFF
> +	-DABSL_USE_GOOGLETEST_HEAD=OFF
>   
>   $(eval $(cmake-package))
>   $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
