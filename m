Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF79C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 19:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DAB44031C;
	Wed, 12 Jan 2022 19:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNxrE_3idCK8; Wed, 12 Jan 2022 19:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 321A04011D;
	Wed, 12 Jan 2022 19:45:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 356601BF2CD
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21BFC4011D
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 19:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1-xUhSw4cRO for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 19:45:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0868D400A4
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 19:45:36 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id k15so14105638edk.13
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 11:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=k8Ib3lSu/jdoy+O1lxCtvlLnLDH9U+ezHGPnrYXLAxU=;
 b=gT5nOez4fULvjpguTG6Xsmi4+eULBbTfUIaUlS3hPosUUh9bbxV9c4eVngPDXwSlL2
 nnRyRv7AcMI6TRCIqGlrSoMkW7NsWO9RqnnE7GEO45x/wwYsl9fpb2ks9xJYJLwsm6l9
 ginkZmBJkNzzo/5aTV4pAQR3hE8/7nHUFcMWywOmlIqM890r1AT+tt+g8feS68aXh77m
 YjBc3fIYbdn0XeNJ2t37XIXUePodmbamRN3EuslG6XGMSqep7LPJQdIIz9Xu+rQ0rkeV
 OjvtnW+qSPkt+NHrXF6qNWSXqObSS69Zo1vtbLBKTvvLoxT3nQd6G7H3G4UUX9CWgMo2
 V7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k8Ib3lSu/jdoy+O1lxCtvlLnLDH9U+ezHGPnrYXLAxU=;
 b=VC7AR/mLPm7BmbP3eO41vXJq9b7MYA7j8wsd3tXIqWMBRkW/al7poYeWWockv8/nVb
 1LAKpVMSuccEtyj4lRmXmuAgP9SiZYIjgGlw699hriID8QsUihVvcswqS4ExryiOPLKO
 g9ovJq8S78/OoZz0SELMIMjlK4bLzMdKQRx/VtxEJ7D01j1JS440ESdqPsnuISQILGuY
 fk2JAUXQL6GDzHJepDjcn49wNTcjmWwSkcE2eisvDs/QmpfsSz2k5onPDD1dmFL9dr2b
 422vS+8yb/SAsjGYWY/jULi9w/utfnPGgwTX4Z+ONLlfdedR713R5X1ZyFj0kQgfy0ZV
 5ksQ==
X-Gm-Message-State: AOAM53008VIn4i8U6/lW8u4yAR5j+gjmmc5kaZ8Dt074dUgiKI6RNxKm
 NuvGa5xJErPRWKDM41JElNHkUptOM6Pb/A==
X-Google-Smtp-Source: ABdhPJwb5XoYFP1+EZb+igrJaaF25gJOuYmvzG/WsEORBmYCiXKVlE2RkFkFDS8cOQv9FQs9ZqQ89w==
X-Received: by 2002:a17:906:b00c:: with SMTP id
 v12mr940821ejy.543.1642016735062; 
 Wed, 12 Jan 2022 11:45:35 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r17sm268780edw.70.2022.01.12.11.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 11:45:34 -0800 (PST)
Message-ID: <84f17b9f-471f-be29-2fea-5bde1d100389@mind.be>
Date: Wed, 12 Jan 2022 20:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220112172302.2991419-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220112172302.2991419-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tinycbor: disable -Werror
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



On 12/01/2022 18:23, Fabrice Fontaine wrote:
> Disable -Werror to avoid the following build failure with gcc 4.8 raised
> since bump to version 0.6.0 in commit
> ee1a2826dcf7ff75f90b0bf9f7aa53d19ce19cf6 and
> https://github.com/intel/tinycbor/commit/e2a4ed135c4d9101c4df83f2dd033cd249b6ef07:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -Werror=incompatible-pointer-types -Werror=implicit-function-declaration -Werror=int-conversion -fPIC  -c -o src/cborerrorstrings.pic.o src/cborerrorstrings.c
> cc1: error: -Werror=incompatible-pointer-types: no option -Wincompatible-pointer-types
> cc1: error: -Werror=int-conversion: no option -Wint-conversion
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/a9fe64c42bb96f9e7b4af3050464f6570c1c00fa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-Makefile-add-DISABLE_WERROR.patch    | 44 +++++++++++++++++++
>   package/tinycbor/tinycbor.mk                  |  2 +-
>   2 files changed, 45 insertions(+), 1 deletion(-)
>   create mode 100644 package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch
> 
> diff --git a/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch b/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch
> new file mode 100644
> index 0000000000..334bea7eb0
> --- /dev/null
> +++ b/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch
> @@ -0,0 +1,44 @@
> +From 5f26eaf8d7be760fafe11ef4a6e0f907e7e8c3f0 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 10 Jan 2022 23:17:45 +0100
> +Subject: [PATCH] Makefile: add DISABLE_WERROR
> +
> +Allow the user to disable -Werror to avoid the following build failure
> +with gcc 4.8 raised since version 0.6.0 and
> +https://github.com/intel/tinycbor/commit/e2a4ed135c4d9101c4df83f2dd033cd249b6ef07:
> +
> +/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -Werror=incompatible-pointer-types -Werror=implicit-function-declaration -Werror=int-conversion -fPIC  -c -o src/cborerrorstrings.pic.o src/cborerrorstrings.c
> +cc1: error: -Werror=incompatible-pointer-types: no option -Wincompatible-pointer-types
> +cc1: error: -Werror=int-conversion: no option -Wint-conversion
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/a9f/a9fe64c42bb96f9e7b4af3050464f6570c1c00fa
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/intel/tinycbor/commit/5f26eaf8d7be760fafe11ef4a6e0f907e7e8c3f0]
> +---
> + Makefile | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 6492ea16..3cde2b3d 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -236,10 +236,15 @@ tag: distcheck
> + .SECONDARY:
> +
> + cflags := $(CPPFLAGS) -I$(SRCDIR)src
> +-cflags += -std=gnu99 $(CFLAGS) \
> ++cflags += -std=gnu99 $(CFLAGS)
> ++
> ++ifneq ($(DISABLE_WERROR),1)
> ++cflags += \
> + 	-Werror=incompatible-pointer-types \
> + 	-Werror=implicit-function-declaration \
> + 	-Werror=int-conversion
> ++endif
> ++
> + %.o: %.c
> + 	@test -d $(@D) || $(MKDIR) $(@D)
> + 	$(CC) $(cflags) $($(basename $(notdir $@))_CCFLAGS) -c -o $@ $<
> diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
> index bf6e8e4c1e..cad50e633b 100644
> --- a/package/tinycbor/tinycbor.mk
> +++ b/package/tinycbor/tinycbor.mk
> @@ -16,7 +16,7 @@ ifeq ($(BR2_PACKAGE_CJSON),y)
>   TINYCBOR_DEPENDENCIES += cjson
>   endif
>   
> -TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) V=1
> +TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) DISABLE_WERROR=1 V=1
>   
>   ifeq ($(BR2_STATIC_LIBS),y)
>   TINYCBOR_MAKE_OPTS += BUILD_STATIC=1 BUILD_SHARED=0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
