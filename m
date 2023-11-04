Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88062C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 16:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C74760AF4;
	Sat,  4 Nov 2023 16:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C74760AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LjAJVz7g4evR; Sat,  4 Nov 2023 16:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D4F060AAE;
	Sat,  4 Nov 2023 16:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D4F060AAE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55E0F1BF2C5
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E6CF41E35
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E6CF41E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Py6aAUzW_Gwy for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 16:47:51 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C569041E34
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 16:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C569041E34
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9d10972e63eso451191066b.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 09:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699116468; x=1699721268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=apSK3QrgOFWfhQD7p1mWfqVJnThMoXoIffTy3I9K6qQ=;
 b=ZEJW+SIVhRfVekXvJpgpk3PZf1TJfC0Rtj9ixMQHLo9nVdf7w2o3s8/7JmfaqpFuqR
 UdXxypq7w4fv8jjAHRnLcXy0rHBq361V3FSMmdPHmOsJrMjSnNoavvoSA1VaLsXNt55A
 9GE/HKn9r0NUVFPuvLFhsnoj8/X611XHm4c6LDNiPjzHhMJf2g5Hv8K/jr2S5SGfWQWw
 tc895L0LCzAunCOkLRQ9Cu1NXeYpv2umXIRvJs11wGsebLz9Irx9BvIyRLQ19NFRFt8L
 Y1IDbgQIZuSzIX58mPIqhhwLE1EeDlBt3C2WwJyiaOGfbBA9r1eOH8KIGGl+vbQ4aIfH
 hAKg==
X-Gm-Message-State: AOJu0Ywyc3JC8g2QDFr/mEcdRD8XReED0gnH1zvAWRzA5VyOV1C8IuVN
 b3eFagW8ynf7E/Ob+tIvnHeYGw==
X-Google-Smtp-Source: AGHT+IH+hL/WxXFBIoc9XRGfpPEDNpyA3zoAAc/difs/7b1kBg6cdzmAsULYuRzpoqaDg2Wse1XBmw==
X-Received: by 2002:a17:906:c78d:b0:9bd:ff07:a586 with SMTP id
 cw13-20020a170906c78d00b009bdff07a586mr7084412ejb.68.1699116468582; 
 Sat, 04 Nov 2023 09:47:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170906a18100b009c6a4a5ac80sm2077096ejy.169.2023.11.04.09.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 09:47:48 -0700 (PDT)
Message-ID: <7b966c79-ed82-4f83-b033-b50407d91b3d@mind.be>
Date: Sat, 4 Nov 2023 17:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20231104162303.537730-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20231104162303.537730-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699116468; x=1699721268; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=apSK3QrgOFWfhQD7p1mWfqVJnThMoXoIffTy3I9K6qQ=;
 b=fSLZyyhDQ7YZ9FW3nUolV+ZUmtjcgk72m4iIQqvnp+446Ldi0TdwMGWSYWk3QcxpIJ
 PvXp8+DInUd6feOsmh/l+jJgaLPPygJz+bIlUdd3msmlfeGJBa36Sqhb5qXbblIMuf8E
 iubygIc+bOU4EWh7afuNZLa+INmx49CwdCeJ+5eqA0ir4lcj9PyabGg9xfWPlyv5yEIl
 YOVr/3sp9VWukqSypyUEaSZkYMmTSurbHmB7yF1LDb9ZSGJWtt1FRfNizY3bmtX9f2Mp
 Sn56cgWMIuNV0cRXgEL4tzrSv5wGVxGkNJX/w8iNPhe6nRKzJggFxqdbj9pGqEe/PbXb
 E5FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fSLZyyhD
Subject: Re: [Buildroot] [PATCH 1/1] package/libgdiplus: add upstream link
 to patch
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/11/2023 17:23, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                                              | 1 -
>   ...01-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch | 1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 1fda294145..1a78addd0e 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -662,7 +662,6 @@ package/libftdi1/0003-CMakeLists.txt-fix-static-build-with-libusb-and-lato.patch
>   package/libfuse/0001-fix-aarch64-build.patch Upstream
>   package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch Upstream
>   package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch Upstream
> -package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch Upstream
>   package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch Upstream
>   package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch Upstream
>   package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch Upstream
> diff --git a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
> index 450286462e..33746872ac 100644
> --- a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
> +++ b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
> @@ -10,6 +10,7 @@ So let's disable the build of unit tests by default and introduce
>   --enable-unit-tests configure option to enable it.
>   
>   Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> +Upstream: https://github.com/mono/libgdiplus/pull/701
>   ---
>    Makefile.am  | 8 ++++++--
>    configure.ac | 4 ++++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
