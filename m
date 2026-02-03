Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07919E87839
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C137481518;
	Tue,  3 Feb 2026 14:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UB6eL8cjbuZ; Tue,  3 Feb 2026 14:27:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE99D83AFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770128843;
	bh=NYHhr3JlKD0NnCRkflfrfudA8uG2tMjBqmQ8DhUSnLs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sS8ztlrdwVjlb+viEVwboM8Clhbgm0Ad1+BFByOEGs5ZwuRIVbohl2UrpOslkNn0x
	 d/EcWm4VTs11lTfpBVW2yNRof2OXYmBnOwXGAQ82DcGlsND0pxvdZgBoTO8j71Sgzv
	 FBcOo2QGJRqB98TLZhAPI+c3aoeUusw35gBGH4vxreLPuUpWuqZUpg7GeEKxbxUU8D
	 u5y0OIxEJJln38XgpxLttGb91kgL6BXqEn953Yzm8F/saF7q4Sv/U8fIKloa0TtnER
	 VrJQO3e88EwPPCPP1D/N5nAiQBqA+u/nmPgnR4IFdxbWKCva088zvOKWncY73t4Xoa
	 k9syiZJhYnqsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE99D83AFA;
	Tue,  3 Feb 2026 14:27:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AE0B13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3238383AFA
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9baHZOTHXlm for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA31D81518
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA31D81518
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA31D81518
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:27:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-480142406b3so42430245e9.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 06:27:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770128838; x=1770733638;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GSp2H2co7HBCTbBvBipMW1DrWHXqL49ITmvae5QQbE4=;
 b=YnoQj+Ec4n9CS1n9JLWFWVR66AOSS4Id9OMvNSXiE8kR8omoSpkCWChMveK8IE5uCg
 ilEGmAdmXnv3qzfFMddXtXqoAeRYA9SFV2R+wN1pWGvN/AK9wjz82X224Jlhz3PI2pFf
 hE/n+G2HPIDofJ7GdeC3oS7FnZU6tKwZTK9PPenBXMOJZy99KsPMxCA3uQmqtioIwe++
 2xhmAatZ+v2aPdg+2bo2Uwc8y4rJ8kUIjA0wHg5WaUdpTDYeZwzG4e4tpCh+V5tAXNtp
 GLSC7SoIXIMa8hbdfC3RHqn+UVxujLifh53smvrS7zmFx6E8/c2+sLdNDytW121ARS/0
 47Zw==
X-Gm-Message-State: AOJu0YySf9Eb3qVF3PScF8M0SvG1Ux6wvbkDVF/14DLdbh6fqqRs787b
 XHSDKDfUZZ5Kl6LMXdeQMl6CYOSVu4XOQoBNFZDrrEqbtrkNOz4CBBPcKva4Tbtstzs=
X-Gm-Gg: AZuq6aKlC76jCOHYl4swWYozCEAQE931ZzP0gOoTXCJzQ50HtTkNfeVks7zRlnV5JCJ
 zyuQIvGhYbRPBTriIVW/95lRNTDAseHSE/SdUZ1iBiXq+pFJ7Um0NqmXnrgUqw+Y3BQRp53ices
 JLza26rJqA8F6TMpFjKf5ovjLiaAAwiUKsWfTMB3xRpm5ruw7YksRxc45SjAkteXSWZoPc//FTZ
 ScH99HtF8gzEogSst3QRCSNYXZdFYXO52GCz3g30MpqgzrBosPNUu6q81a+x1aOSnEYptQw1YEA
 FVOjBeyyE00aNiginQ3ExKBd2vDZaNtHFdZyLNknnvKgCyTgW4V4yTcj8g+SNIBtWCOEF5h1sYb
 oRq3qjXkk89MqN2OrszSHhfSilqJyp+oUBzscMn10NejauiLwmCGxVBOap096u6KMobL5Fufv7R
 ouKePoAlsTPZ9c7qe+/LzYBkCYAExUkESSTISUake89bVc2Q6xET/tdeND1dlzJ4GhYph40iDjI
 OZS
X-Received: by 2002:a05:600c:6610:b0:477:a1a2:d829 with SMTP id
 5b1f17b1804b1-482db4520f2mr173449915e9.13.1770128837745; 
 Tue, 03 Feb 2026 06:27:17 -0800 (PST)
Received: from [10.5.90.75]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e135422csm54571039f8f.40.2026.02.03.06.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 06:27:17 -0800 (PST)
Message-ID: <9dc9992a-2d0f-4429-bc7d-fcdfd81573e8@smile.fr>
Date: Tue, 3 Feb 2026 15:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
 <20250808133112.3212687-3-elmehdi.younes@smile.fr>
 <aYH4ESxcsrQj_6pZ@windsurf>
Content-Language: en-US
In-Reply-To: <aYH4ESxcsrQj_6pZ@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770128838; x=1770733638; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GSp2H2co7HBCTbBvBipMW1DrWHXqL49ITmvae5QQbE4=;
 b=CyeM7z3hCCdB30929UVNWI863oNMe6nhl+1nhPa3OMnhYGO31+0MOi64qzxbmQHPJz
 cNVkg9yLVbEOENVLGqTIN/NhOcAptHCmsZWiMfrKC2UyXc1wmW+zuQ9UUTa3LMrWi4+s
 +xjjHbcLpo1VmP9Pn6igGu+xX78tnk33yWGgI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=CyeM7z3h
Subject: Re: [Buildroot] [RFC PATCH 2/5] package/rust-bin: add Rust sources
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 2/3/26 14:33, Thomas Petazzoni wrote:
> Hello,
>
> Thanks for this patch, and sorry for the delay in reviewing
> it. Generally the approach looks good, but we have a few comments, see
> below.
>
> On Fri, Aug 08, 2025 at 03:31:09PM +0200, El Mehdi YOUNES via buildroot wrote:
>> Rust-for-Linux requires the Rust standard library sources (e.g. core/lib.rs)
>> to enable CONFIG_RUST. This patch provides them in rust-bin while keeping the
>> prebuilt compiler tarball unchanged.
>>
>> It adds HOST_RUST_BIN_SOURCE_TARBALL = rustc-$(VER)-src.tar.xz to
>> HOST_RUST_BIN_EXTRA_DOWNLOADS, and splits extra downloads into
>> HOST_RUST_BIN_STD_TARBALLS (rust-std-*) and HOST_RUST_BIN_SOURCE_TARBALL so
>> extraction is controlled separately: rust-std-* are unpacked under $(@D)/std,
>> and rustc-<ver>-src.tar.xz is unpacked to rust-src then only the 'library/'
>> subtree from the source tarball is installed $(HOST_DIR)/lib/rustlib/src/rust/.
>>
>> The utils/update-rust script is also extended to generate the sha256 line for
>> rustc-<ver>-src.tar.xz in package/rust-bin/rust-bin.hash.
>>
>> see
>> https://github.com/torvalds/linux/blob/master/Documentation/rust/quick-start.rst
>>
>> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
>> ---
>>   package/rust-bin/rust-bin.hash |  2 ++
>>   package/rust-bin/rust-bin.mk   | 18 ++++++++++++++++--
>>   utils/update-rust              |  9 +++++++++
>>   3 files changed, 27 insertions(+), 2 deletions(-)
> First of all, fixing package/rust-bin is not sufficient, you also need
> to ensure that package/rust does the right thing. Indeed, we have two
> ways of proving the Rust compiler in Buildroot: using a pre-compiled
> Rust compiler (package/rust-bin) or building the Rust compiler from
> source (package/rust). The Rust support in Linux should work for both
> cases.

Thanks a lot for the feedback, this series was first sent only for feedback,

the change only for rust-bin was in purpose to facilitate testing and 
have some

feedback before the final patch.

I will add it on a v2

>> diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
>> index 215bd84ad3..2195584f8f 100644
>> --- a/package/rust-bin/rust-bin.mk
>> +++ b/package/rust-bin/rust-bin.mk
>> @@ -14,16 +14,19 @@ RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
>>   HOST_RUST_BIN_PROVIDES = host-rustc
>>   
>>   HOST_RUST_BIN_SOURCE = rust-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
>> +HOST_RUST_BIN_SOURCE_TARBALL = rustc-$(RUST_BIN_VERSION)-src.tar.xz
>> +HOST_RUST_BIN_STD_TARBALLS =
> Setting to an empty variable is not really needed.
>
>>   
>>   ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
>> -HOST_RUST_BIN_EXTRA_DOWNLOADS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
>> +HOST_RUST_BIN_STD_TARBALLS += rust-std-$(RUST_BIN_VERSION)-$(RUSTC_TARGET_NAME).tar.xz
> This could be just a = sign.
>
>>   endif
>>   
>> +HOST_RUST_BIN_EXTRA_DOWNLOADS += $(HOST_RUST_BIN_SOURCE_TARBALL) $(HOST_RUST_BIN_STD_TARBALLS)
>>   HOST_RUST_BIN_LIBSTD_HOST_PREFIX = rust-std-$(RUSTC_HOST_NAME)
>>   
>>   define HOST_RUST_BIN_LIBSTD_EXTRACT
>>   	mkdir -p $(@D)/std
>> -	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS), \
>> +	$(foreach f,$(HOST_RUST_BIN_STD_TARBALLS), \
> The change from HOST_RUST_BIN_EXTRA_DOWNLOADS to
> HOST_RUST_BIN_STD_TARBALLS could actually go in a separate,
> preparatory commit. It would make the commit adding the installation
> of Rust sources shorter and simpler to review.
>
>>   		$(call suitable-extractor,$(f)) $(HOST_RUST_BIN_DL_DIR)/$(f) | \
>>   			$(TAR) -C $(@D)/std $(TAR_OPTIONS) -
>>   	)
>> @@ -61,4 +64,15 @@ endef
>>   
>>   HOST_RUST_BIN_POST_INSTALL_HOOKS += HOST_RUST_INSTALL_CARGO_CONFIG
>>   
>> +define HOST_RUST_BIN_EXTRACT_SRC_LIBRARY
>> +	mkdir -p $(@D)/rust-src
>> +	$(call suitable-extractor,$(HOST_RUST_BIN_SOURCE_TARBALL)) \
>> +	$(HOST_RUST_BIN_DL_DIR)/$(HOST_RUST_BIN_SOURCE_TARBALL) | \
>> +	$(TAR) -C $(@D)/rust-src --strip-components=1 $(TAR_OPTIONS) -
> Please indent follow-up lines, as such:
>
> 	$(call suitable-extractor,$(HOST_RUST_BIN_SOURCE_TARBALL)) \
> 	       $(HOST_RUST_BIN_DL_DIR)/$(HOST_RUST_BIN_SOURCE_TARBALL) | \
> 	       $(TAR) -C $(@D)/rust-src --strip-components=1 $(TAR_OPTIONS) -
>
> so that's it's clearly visible it's the same command.
>
>> +	mkdir -p $(HOST_DIR)/lib/rustlib/src/rust
>> +	cp -a $(@D)/rust-src/library $(HOST_DIR)/lib/rustlib/src/rust/
> Can we install in $(HOST_DIR)/src/rust for example? In PATCH 5/5,
> you're anyway passing explicitly the path to the Rust source code.
>
> Or do we need to use $(HOST_DIR)/lib/rustlib/src/rust/ because in the
> package/rust case (where we build the compiler ourselves), the source
> gets installed there automatically?
>
> Could you fixup those issues and submit an updated version?

Thank you so mush for the feedback, I will fix.

I'll try to send a v2 on the next days

>
> Thanks a lot!
>
> Thomas
Best regards,
El Mehdi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
