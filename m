Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06907C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 17:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D52F40ABD;
	Tue,  5 Apr 2022 17:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 50S_bkLePisS; Tue,  5 Apr 2022 17:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91EC54018A;
	Tue,  5 Apr 2022 17:28:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 660EA1BF2BE
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 17:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 548264014E
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 17:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrWpqDbz9FwG for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 17:28:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20B7F400E9
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 17:28:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id dr20so28010481ejc.6
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 10:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=uKLkT23uBIOOt2sqRAP9y5o+YKBRl1Z7VWgwo7sFF40=;
 b=SfKWNWYePxf1+DF/5DbtfYXVvhp5VzmYUmhhFkxFMTOzWE61Xf5871f9L1/GGTtJzY
 movAcJuIcM4OwK/JGYr0qn4jjOvIWrNsMGEKi1Zr2f+B++vmSP0o6TC0KiKH7eqPypdQ
 AAbA+Z1P4DHvIyWYn2x9+ZbGppf91gb5cwBWpRUH6eyeOwtRuh+/G7topbLSV5tysyeq
 POWWiIaoWo9CXK5zLQ1yvmRRtqDddgoz/DmQ4K+ZeBjwAy5ZE0gRE+573zyshBKIum5V
 RptGzIp9nG6YNzQivaVlmWfB9So0oE3FgLdbhijis8cbe+HB3SlSuNkQ+pswtmUnoCo5
 esPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uKLkT23uBIOOt2sqRAP9y5o+YKBRl1Z7VWgwo7sFF40=;
 b=LNdmdUYq4mfgka3/6OK8gyVg9LZrsmHOZA8jHd5SSckqoau0aGDsyvIiwvfIm4hv88
 m8ScEhInkLMhqPLUjO82XSA/YjHPjXsrMzCkU0xBk0dD//hoXw+EvlMTxjDsRgGaYq1b
 t/SrnXR+LSDk4mJDq4feu4zpnDAOuftYRckzBtZoxlwKvHH//yYmrkvsWwm5mrUGdRYw
 DaCZYO5zsjxqmDt4eRhbVU758zyl3a0MzYnpTxyxSn8UPm8R2Z8R0w/x0MmmL76GyMJh
 bLTVT3bUtcc9Q+rPOW74b0MltcOwRpn1v3asTNUR1xhP+qRYdzUUn1XeefETtbEIYoro
 XXgw==
X-Gm-Message-State: AOAM533O3yJ2ncWNNPRDNMBKsd2CuUpCY8lVXpIItDwT92rUUcQjjWjg
 8s+/RHA6BA+/yNU1u/w+yaSCNA==
X-Google-Smtp-Source: ABdhPJxuiG1g3KWRlfH57ExRAw9pmCb2kOtUgQdWa6iTEH61k1jUEIQVBHHFAidFhTB3nH7Z7U42dg==
X-Received: by 2002:a17:907:1c1c:b0:6e4:e488:4e76 with SMTP id
 nc28-20020a1709071c1c00b006e4e4884e76mr4531935ejc.93.1649179680360; 
 Tue, 05 Apr 2022 10:28:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a17090654cd00b006e0db351d01sm5748632ejp.124.2022.04.05.10.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 10:27:59 -0700 (PDT)
Message-ID: <f9f85a6c-9c40-a36d-faaa-9b86dcbc02ed@mind.be>
Date: Tue, 5 Apr 2022 19:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220405163540.9277-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405163540.9277-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libkcapi: fix build with
 BR2_OPTIMIZE_0
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



On 05/04/2022 18:35, Fabrice Fontaine wrote:
> Override COMMON_CPPFLAGS to fix the following build failure with
> BR2_OPTIMIZE_0 raised since bump to version 0.14.0 in commit
> cd707a9112e38b4ce98326b96c0ed12054ca1cca and
> https://github.com/smuellerDD/libkcapi/commit/0e7b2b0300782aca19c324f3352f109777b4c51a:
> 
> /home/autobuild/autobuild/instance-15/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/features.h:412:4: error: #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]

  I haven't looked at the details, but in this case it seems to me the proper 
solution is to make sure _FORTIFY_SOURCE is not enabled.

  But perhaps that is exactly what this patch does?

  Regards,
  Arnout

> 
> It should be noted that upstream already rejected a PR to remove
> -Werror: https://github.com/smuellerDD/libkcapi/pull/132
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/35141ea3046f5a4593e0b27ef92e4ace6bc0be66
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/libkcapi/libkcapi.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
> index 71dfbd9eff..353939bb31 100644
> --- a/package/libkcapi/libkcapi.mk
> +++ b/package/libkcapi/libkcapi.mk
> @@ -15,6 +15,7 @@ LIBKCAPI_CONF_ENV = \
>   	ac_cv_path_DB2PDF="" \
>   	ac_cv_path_DB2PS="" \
>   	ac_cv_path_XMLTO=""
> +LIBKCAPI_MAKE_OPTS = COMMON_CPPFLAGS=""
>   
>   ifeq ($(BR2_PACKAGE_LIBKCAPI_ENCAPP),y)
>   LIBKCAPI_CONF_OPTS += --enable-kcapi-encapp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
