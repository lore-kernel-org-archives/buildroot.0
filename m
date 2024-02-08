Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76E4C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 10:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E531041C60;
	Thu,  8 Feb 2024 10:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrZfrT6wf1gl; Thu,  8 Feb 2024 10:26:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47D6641BEB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47D6641BEB;
	Thu,  8 Feb 2024 10:26:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DA711BF2A1
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 10:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AA0A61683
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 10:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hH46TKdhD-d9 for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 10:26:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AD2461604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AD2461604
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AD2461604
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 10:26:19 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a39e31e1aa9so81892166b.0
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 02:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707387978; x=1707992778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+3Twr1jA3tNwce4rZaWlAqp4nTPFgDdiNqSoSXTiHmM=;
 b=XO3cxVM6sL2zPIr8v+tVKK/QbAJ/Wzy6svcp0GazHeg6uSj2KGR2yBO9FRbWSkyXtD
 XAqT16FgK9UppJFHjciY9xa3UFB6pY1DGAI5wqRlCLZdylN1F+o9UeufujwV0t7DCz+8
 14CfbNvVzPSRb4HBNDBG+REHWft11jCk9jIKpdqZB3IcZrcoxhalDwED8GXgM6yc7Gd2
 Tnk37yGB1clIWPANjTyxEzbkLTB328yBRlHKG9q/4XBOehouQJykYx/qJFnWIWi0RxSq
 F1MhUONGHLowKck0h0QFN/DXKVX7tcNgrYXPtUOF2au5w4vgFEGq9zdyxXs0SKeM3n/i
 35Cw==
X-Gm-Message-State: AOJu0YyiBsI+tm7ZZUacv71z8+UkhWLiX+D6/VZL3JHrKZDTAkuuTmNu
 LdJcgDDcRfwvzX3SIjrJp4bp3ZdKnyxNDvBxYV5hnm+Aw5I9GFQgLC9lZi0JtEP+doz2il3PZi8
 z
X-Google-Smtp-Source: AGHT+IFFuO/sp47Mx2Bj8RNjyN1MDERU4K4fEZL7ZquTrF0fm/IZVZ1KP+Jn4EBfh6r5RQ5rG7In/g==
X-Received: by 2002:a17:907:507:b0:a38:43c1:68d7 with SMTP id
 wj7-20020a170907050700b00a3843c168d7mr3844137ejb.72.1707387978061; 
 Thu, 08 Feb 2024 02:26:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOcYdZahKBA+gUz5UXRmDziZeAJWS+aqCc/qGMUnxGx78dPm3nZ5kFqUX6QSc9m9LhPtKQ9xHJLaZJCXdVvrTx96yMAZNj4nllTo+nErYgjVXbkwf/occOUMrc2EpbIRP+Ys1ykujUPRg4lSRSaR0i
Received: from [10.5.0.41] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 jl16-20020a17090775d000b00a384365e3b9sm1734526ejc.195.2024.02.08.02.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 02:26:17 -0800 (PST)
Message-ID: <e909675f-1e8f-49af-b3cb-01c44ced4705@smile.fr>
Date: Thu, 8 Feb 2024 11:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-3-antoine.coutant@smile.fr>
 <ZcOeEMfwX4XlRXO7@landeda>
Content-Language: en-US
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <ZcOeEMfwX4XlRXO7@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707387978; x=1707992778;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+3Twr1jA3tNwce4rZaWlAqp4nTPFgDdiNqSoSXTiHmM=;
 b=trHAdXticCpOjFIkFJq1iUGv9t2vl/TyyLB7p6wPVmll5Wwz4gWgL3vfYn+n54C70e
 ZjrVVYoo6JsU4Dyh8gD1iCr2Q9QFGSvAVM+NUF1n+FxuIhzKGAQTnH8nMt3jtBBPbn3l
 XuOzKDDfO1eyllEp+Vnp7fC8nctkWI74DL27ArMUfB/AuZreUu4yI4A2wjs1nKdIhrt2
 UH+09m+8O0uYVIo4qdxrXl8jucwroXyBFjvce1hhoJvY5vg8A2pQ55gOGCDKaqNWAVrf
 uKQelpxPEtTcHbp1n0v0wxi6/aFEQSpAtzgxkEbIIE7+K81Tsh1x5+soaRSd5BlGLO1Z
 hMFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=trHAdXti
Subject: Re: [Buildroot] [PATCH v4 2/7] package/pkg-meson.mk: add rust
 cross-compiler support
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
Cc: sebastian.weyer@smile.fr, bernd@kuhls.net, romain.naour@smile.fr,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


On 07/02/2024 16:13, Yann E. MORIN wrote:
> Antoine, All,
>
> On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
>> From: Romain Naour <romain.naour@smile.fr>
>>
>> This change is needed to be able to build target packages requiring
>> rust. If a package has rust in its project or in an add_language()
>> call in their meson.build file, meson will try to find a suitable
>> compiler for this language[1]. If the language is classified as
>> required but not found, it will abort the build.
>>
>> It is necessary to specify rust and rust_ld separately in
>> support/misc/cross-compilation.conf.in. If you specify it in one line
>> just as "rust", it will generate the following warning:
>>      WARNING: Please do not put -C linker= in your compiler command,
>>      set rust_ld=command in your cross file or use the RUST_LD environment
>>      variable, otherwise meson will override your selection.
>>
>> [1] https://mesonbuild.com/Reference-manual_functions.html#add_languages
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
>> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
>> ---
>>   package/pkg-meson.mk                   | 13 +++++++++++++
>>   support/misc/cross-compilation.conf.in |  2 ++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
>> index 65cabf23ba..25dd4f0d7f 100644
>> --- a/package/pkg-meson.mk
>> +++ b/package/pkg-meson.mk
>> @@ -82,6 +82,16 @@ else
>>   PKG_MESON_TARGET_FC = /bin/false
>>   endif
>>   
>> +ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
>> +PKG_MESON_TARGET_RUSTC = $(HOST_DIR)/bin/rustc
>> +PKG_MESON_TARGET_RUSTC_LINKER = $(notdir $(TARGET_CROSS))gcc
> Why can't PKG_MESON_TARGET_RUSTC_LINKER be an absolute path, when
> PKG_MESON_TARGET_RUSTC is one, and [...]

I tested with an absolute path and it worked. I don't know

why I chose to use a relative path.


Thanks for the report, I will make the change in the v5.


Regards,

Antoine Coutant

>> +PKG_MESON_TARGET_RUSTC_TARGET_NAME = $(RUSTC_TARGET_NAME)
>> +else
>> +PKG_MESON_TARGET_RUSTC = /bin/false
>> +PKG_MESON_TARGET_RUSTC_LINKER = /bin/false
> [...] especially since here PKG_MESON_TARGET_RUSTC_LINKER is an absolute
> path?
>
> Regards,
> Yann E. MORIN.
>
>> +PKG_MESON_TARGET_RUSTC_TARGET_NAME =
>> +endif
>> +
>>   # Generates sed patterns for patching the cross-compilation.conf template,
>>   # since Flags might contain commas the arguments are passed indirectly by
>>   # variable name (stripped to deal with whitespaces).
>> @@ -91,6 +101,7 @@ define PKG_MESON_CROSSCONFIG_SED
>>           -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
>>           -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
>>           -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
>> +        -e "s%@TARGET_RUSTC@%$(PKG_MESON_TARGET_RUSTC)%g" \
>>           -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
>>           -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
>>           -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
>> @@ -99,6 +110,8 @@ define PKG_MESON_CROSSCONFIG_SED
>>           -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
>>           -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
>>           -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
>> +        -e "s%@TARGET_RUSTC_LINKER@%$(PKG_MESON_TARGET_RUSTC_LINKER)%g" \
>> +        -e "s%@RUSTC_TARGET_NAME@%$(PKG_MESON_TARGET_RUSTC_TARGET_NAME)%g" \
>>           -e "s%@BR2_CMAKE@%$(BR2_CMAKE)%g" \
>>           -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
>>           -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
>> diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
>> index a58ab553d0..21cec10b82 100644
>> --- a/support/misc/cross-compilation.conf.in
>> +++ b/support/misc/cross-compilation.conf.in
>> @@ -13,6 +13,8 @@ fortran = '@TARGET_FC@'
>>   pkg-config = '@PKGCONF_HOST_BINARY@'
>>   g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
>>   g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
>> +rust = ['@TARGET_RUSTC@', '--target', '@RUSTC_TARGET_NAME@' ]
>> +rust_ld = '@TARGET_RUSTC_LINKER@'
>>   
>>   [built-in options]
>>   c_args = [@TARGET_CFLAGS@]
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
