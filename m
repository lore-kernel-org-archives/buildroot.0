Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4389EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B26560A75;
	Wed, 27 Apr 2022 19:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9TY4ZDPxzew; Wed, 27 Apr 2022 19:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 205A960701;
	Wed, 27 Apr 2022 19:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 706DC1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EC0660B3D
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8N88u2GwYaw2 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:39:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6058D60A75
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:39:43 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id e23so3118402eda.11
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=w0sH0BgZ7LmVCMMz5dZn6Ytmo9/4BSVyCZ6fZLVf/xI=;
 b=VC+nUC8G0Bwv/n38qof5uDcgjUf7AmXqGExSQQ3b+J3YuY+HwHcPjRODElllqB9w/p
 eVzCjbgwQ9eSNuvatmLEL2Na4DUcxixbMR1o//BPDOT4EKIxoT8mV1ajOsSu3zScV1Q/
 FJDI2lbUzUmBV5dGqkqjPTcNg3olyOwTMFta5zTuWhLbMZGO+nhXeaW0S3IujLh/AZ7V
 h9wF809R3D3GyBtYYq+4y6mlEfdIuxK6OkV9YNTFEYLdGyt/XbGDrWLU25xWhaysFrJg
 i6re7uephrhvKld+er+xHLEntOGcgQ6dHCW4kPHCFbz5k3Xi2FEQeSHasomnIRO1Fzxp
 NBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=w0sH0BgZ7LmVCMMz5dZn6Ytmo9/4BSVyCZ6fZLVf/xI=;
 b=ZGNfVTdl2OmPMQ31WOdIoTFHTd7e2Hragq9jatduU3JSxIZBprrluCcWBv3hYh4bNU
 o0FfMlIdXB+FXFlIJK2awqOk/O+dtqv92njaykbuN/qCWMZXoSd0Z2LHFo4Dpaf7iUa8
 yGCXL9MQoiYz+jq8BCe8fkfDLw5x7wWye4zWfAPKzjpXvVfRdJBwRBNiShlVzEmT0Rys
 UsUJkRVPsViLleSmFRGy5EWiuRzoqsyp11YeRr/Xr8PkdMsxg1NP+8hCgEWsvjhcr7ii
 nAYuVwdCpkr1VfhgWNRTydkXyNSiJsBDEiMw/KMIPs5xjjJ6n1QuMRY1dlHD2cRxp/Kw
 4nFg==
X-Gm-Message-State: AOAM5318tnbs28ZLRqRhXmI7OOctawYSof3E2DI/2fqEDxXRr5AJJkUK
 J1Nc8cIhIcqZgbZHEyOdNnGiJg==
X-Google-Smtp-Source: ABdhPJzJh60PXnNcO8wH4Ey+Q/mmSqqLhUchgBiXqblk5bMj2mKDEkMyAKsjYTpoAZ0sIA8h1BysPQ==
X-Received: by 2002:a05:6402:1c1e:b0:416:5b93:eacf with SMTP id
 ck30-20020a0564021c1e00b004165b93eacfmr32302606edb.302.1651088381588; 
 Wed, 27 Apr 2022 12:39:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 jr16-20020a170906a99000b006e4c05e8919sm7265574ejb.35.2022.04.27.12.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:39:41 -0700 (PDT)
Message-ID: <f0301ea5-7277-303a-3771-cc9bff3a4d18@mind.be>
Date: Wed, 27 Apr 2022 21:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220427081744.116766-1-aperez@igalia.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427081744.116766-1-aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/brotli: workaround m68k build
 issues
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



On 27/04/2022 10:17, Adrian Perez de Castro wrote:
> On m68k building with optimizations  results in failures such as:
> 
> /tmp/cckiMnG5.s: Assembler messages:
> /tmp/cckiMnG5.s:142572: Error: value -39206 out of range
> /tmp/cckiMnG5.s:142629: Error: value -40282 out of range
> /tmp/cckiMnG5.s:146408: Error: value -53294 out of range
> /tmp/cckiMnG5.s:159014: Error: value -39206 out of range
> /tmp/cckiMnG5.s:159071: Error: value -40282 out of range
> /tmp/cckiMnG5.s:162850: Error: value -53294 out of range
> /tmp/cckiMnG5.s:175456: Error: value -39206 out of range
> /tmp/cckiMnG5.s:175513: Error: value -40282 out of range
> /tmp/cckiMnG5.s:179292: Error: value -53294 out of range
> /tmp/cckiMnG5.s:191898: Error: value -39206 out of range
> /tmp/cckiMnG5.s:191955: Error: value -40282 out of range
> /tmp/cckiMnG5.s:195734: Error: value -53294 out of range
> 
> These only appear when building with -O2, the smaller code generated
> with -Os does not cause trouble, so workaround by using that.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/2f222d5a86b4237b81ca31dba89f58b0e6e879db/
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/brotli/brotli.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
> index 43c8524c0b..ac49fe664f 100644
> --- a/package/brotli/brotli.mk
> +++ b/package/brotli/brotli.mk
> @@ -21,6 +21,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
>   BROTLI_CFLAGS += -O0
>   endif
>   
> +# Workaround "Error: value -1234 out of range" assembler issues
> +# when building with optimizations.
> +ifeq ($(BR2_m68k),y)
> +BROTLI_CFLAGS += -Os
> +endif
> +
>   BROTLI_CONF_OPTS += -DCMAKE_C_FLAGS="$(BROTLI_CFLAGS)"
>   
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
