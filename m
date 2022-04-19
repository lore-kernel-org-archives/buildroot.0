Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B27C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 809074184E;
	Tue, 19 Apr 2022 20:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qx28f6RptTDa; Tue, 19 Apr 2022 20:54:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01AD241836;
	Tue, 19 Apr 2022 20:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59FA51BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 450F9408EF
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PqxGfOs5FMin for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:54:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D89C40142
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:54:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id t11so35321463eju.13
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=00dV2eSjWR25aADBSYFLqCxTV6Uwb5bbqTMLgsIuFKU=;
 b=drNt65iGfR5LSkSBlSXMMGfciiDxKp3Xzed5TqwC4JD+f40SvVU9vnb89swwf/Kgzu
 uj5P45NMZbvCHf/QuL+A9g6tIZ4aq6rv4mYfMgScA0jBsql582pPYMstlYIvWFwMxVlT
 ywdMwe9e3oU3LEqRT6O4niPlLVabz9ql9CH8izEoWJzUwb9ZGMzRBmKDlt3HvGHWWA8l
 0tnUAnYZDIxtXo+LCMt4paPtmEW/awRXbg0mH1CusyN1Eh+ThMLoV0YNNksvsXiqhNPP
 Mc7ilKUmqEBPKbRsLx+AvxHxjkzk4jaYVxcfXnvXfXqxr7py5bhWwxmybzmdkZU9Qjlr
 aAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=00dV2eSjWR25aADBSYFLqCxTV6Uwb5bbqTMLgsIuFKU=;
 b=e803mcZF465PRXFy4f5l+WOKCu6SisFceIonrkOnEhdmydKbIDLBGRVKElGXxjw12v
 yvuSYffuPmIJ2hWoUzHzQqr8fZbJT8tboUoCgYhOJhe2xaOZEotW6P5QkmR44LkpBxa4
 JyLzuc7bWtWfthteu8T+8uPvUFnXv/UtGFeoxnoIE7Xce8jveGtegr6vf8n2K3rnkVVg
 gBosvJMruYNC0jBQ1k5l3u5ZAclriGWPe1SK3H9pm0/8oSKjoUsuy0EscxdB8Ap/VY8U
 c6aQCKyOCyf9RnRxVpiFcKy4tbnDB4o8Pw9jpWisulnHrdmHYZNunkusCe8WfB0MBfWS
 OhnA==
X-Gm-Message-State: AOAM530xb5f1MRYRhlAdojR4GpIeKewGf0Bi7hDxWXD9XwG/DNp11kJ6
 vRQ1HfFEMHmtaXLsGGXkx7ShBqcOUHw32A==
X-Google-Smtp-Source: ABdhPJzmP01izmZkExYSnCwB/KwlsX2CblYTtwjVkUgJhe02OWQgsomKi2q05wL9jTd6L4xzr4yWQQ==
X-Received: by 2002:a17:907:7e8c:b0:6e8:92df:1656 with SMTP id
 qb12-20020a1709077e8c00b006e892df1656mr16213693ejc.386.1650401684938; 
 Tue, 19 Apr 2022 13:54:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 cb7-20020a170906a44700b006e879b4ba2dsm5971126ejb.56.2022.04.19.13.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:54:44 -0700 (PDT)
Message-ID: <afc126a1-3afc-44e8-710c-69e9be5dd1ed@mind.be>
Date: Tue, 19 Apr 2022 22:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20220419073954.537319-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419073954.537319-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/openjdk{-bin}: security bump
 11.x to version 11.0.14.1+1
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
Cc: Christian Ambach <ambi@samba.org>, Tudor Holton <buildroot@tudorholton.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/04/2022 09:39, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
>    - JDK-8217375: jarsigner breaks old signature with long lines in manifest
>    - JDK-8251329: (zipfs) Files.walkFileTree walks infinitely if zip has dir named "." inside
>    - JDK-8264934, CVE-2022-21248: Enhance cross VM serialization
>    - JDK-8268488: More valuable DerValues
>    - JDK-8268494: Better inlining of inlined interfaces
>    - JDK-8268512: More content for ContentInfo
>    - JDK-8268795: Enhance digests of Jar files
>    - JDK-8268801: Improve PKCS attribute handling
>    - JDK-8268813, CVE-2022-21283: Better String matching
>    - JDK-8269151: Better construction of EncryptedPrivateKeyInfo
>    - JDK-8269944: Better HTTP transport redux
>    - JDK-8270386, CVE-2022-21291: Better verification of scan methods
>    - JDK-8270392, CVE-2022-21293: Improve String constructions
>    - JDK-8270416, CVE-2022-21294: Enhance construction of Identity maps
>    - JDK-8270492, CVE-2022-21282: Better resolution of URIs
>    - JDK-8270498, CVE-2022-21296: Improve SAX Parser configuration management
>    - JDK-8270646, CVE-2022-21299: Improved scanning of XML entities
>    - JDK-8270952, CVE-2022-21277: Improve TIFF file handling
>    - JDK-8271962: Better TrueType font loading
>    - JDK-8271968: Better canonical naming
>    - JDK-8271987: Manifest improved manifest entries
>    - JDK-8272014, CVE-2022-21305: Better array indexing
>    - JDK-8272026, CVE-2022-21340: Verify Jar Verification
>    - JDK-8272236, CVE-2022-21341: Improve serial forms for transport
>    - JDK-8272272: Enhance jcmd communication
>    - JDK-8272462: Enhance image handling
>    - JDK-8273290: Enhance sound handling
>    - JDK-8273756, CVE-2022-21360: Enhance BMP image support
>    - JDK-8273838, CVE-2022-21365: Enhanced BMP processing
>    - JDK-8274096, CVE-2022-21366: Improve decoding of image files
>    - JDK-8279541: Improve HarfBuzz
> 
> For more details, see the announcement:
> 
> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2022-January/011643.html
> https://mail.openjdk.java.net/pipermail/jdk-updates-dev/2022-February/012348.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  This also invalidates [1], care to send an update of it?

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20220411070454.77482-1-ambi@samba.org/



> ---
>   package/openjdk-bin/openjdk-bin.hash | 2 +-
>   package/openjdk-bin/openjdk-bin.mk   | 2 +-
>   package/openjdk/openjdk.hash         | 2 +-
>   package/openjdk/openjdk.mk           | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
> index bbc939d4e8..082da7bf87 100644
> --- a/package/openjdk-bin/openjdk-bin.hash
> +++ b/package/openjdk-bin/openjdk-bin.hash
> @@ -2,7 +2,7 @@
>   sha256  6ea18c276dcbb8522feeebcfc3a4b5cb7c7e7368ba8590d3326c6c3efc5448b6  OpenJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz
>   
>   # From https://github.com/adoptium/temurin11-binaries/releases
> -sha256  3b1c0c34be4c894e64135a454f2d5aaa4bd10aea04ec2fa0c0efe6bb26528e30  OpenJDK11U-jdk_x64_linux_hotspot_11.0.13_8.tar.gz
> +sha256  43fb84f8063ad9bf6b6d694a67b8f64c8827552b920ec5ce794dfe5602edffe7  OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz
>   
>   # Locally calculated
>   sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
> diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
> index 266c93d363..c9ddc9f69f 100644
> --- a/package/openjdk-bin/openjdk-bin.mk
> +++ b/package/openjdk-bin/openjdk-bin.mk
> @@ -9,7 +9,7 @@ HOST_OPENJDK_BIN_VERSION_MAJOR = 17
>   HOST_OPENJDK_BIN_VERSION_MINOR = 0.1_12
>   else
>   HOST_OPENJDK_BIN_VERSION_MAJOR = 11
> -HOST_OPENJDK_BIN_VERSION_MINOR = 0.13_8
> +HOST_OPENJDK_BIN_VERSION_MINOR = 0.14.1_1
>   endif
>   HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
>   HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
> diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
> index 2f46b044ad..f8a4f15260 100644
> --- a/package/openjdk/openjdk.hash
> +++ b/package/openjdk/openjdk.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
>   sha256  8c076203a6f85ab916b3e54de1992bcbcc5ffe580c52b1ac8d52ca7afb9f02d1  openjdk-17.0.1+12.tar.gz
> -sha256  119c6233fe7ff5670c590e2f9d6686ac4d80c97b17065506998b75c547b54f2c  openjdk-11.0.13+8.tar.gz
> +sha256  0e859cc03378439023e17ee82aecee5a52265fb38906a8bebf16027aa2b2bcf5  openjdk-11.0.14.1+1.tar.gz
>   sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index 5fccdaa7ac..94b8cba577 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -9,7 +9,7 @@ OPENJDK_VERSION_MAJOR = 17
>   OPENJDK_VERSION_MINOR = 0.1+12
>   else
>   OPENJDK_VERSION_MAJOR = 11
> -OPENJDK_VERSION_MINOR = 0.13+8
> +OPENJDK_VERSION_MINOR = 0.14.1+1
>   endif
>   OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
>   OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
