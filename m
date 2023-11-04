Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D91FC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 16:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2972441DF1;
	Sat,  4 Nov 2023 16:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2972441DF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQPZDh2QG7Hy; Sat,  4 Nov 2023 16:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 675AB41DE9;
	Sat,  4 Nov 2023 16:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 675AB41DE9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE0EC1BF5AE
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0E25822F3
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 16:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0E25822F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dh_HhmRrDzNp for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 16:26:08 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FB19822F2
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 16:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FB19822F2
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99357737980so457254366b.2
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 09:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699115166; x=1699719966;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wjw3kJVniT1MAIZXDDvjW+7mjPSEcxuZ69QoEbDo0Io=;
 b=WYmv5cpHIzqC7sMcd3F7yP2wHCvUYaRAnFxVZd8VeZz1SswnxvVmkOJRDSvMW4V82S
 9zQ9OqXjz9fH072jFaUEs3r82U8AD4Jy3H5fAmAa5wvEcMiU2W3HwxuNczcS/OEUqlTL
 gRwd2N7PG9zN1GXsUvPIZMVvHKZ3jzjiBYyd/1BgnXDzyR6/vx3tMwpyB4NmofNemO0y
 oklcjsMsIt2GnKp+UmFZSiQo5UHgbdp9EbI2FJlKX2zNJoRidbcVMkodxa8nAz7AxjxO
 VzOct+JdyfCPaQO4b+OY6Z4n8XwUwilOdJ079HQUTzyltvBC3iVyXW8cUjmwN9dU1Ent
 lI/Q==
X-Gm-Message-State: AOJu0Yx/8EwzbLDdi4ByQCIZ4Tz5F9T9i9WOepERa/Zz9qFSezAWKY9y
 QmxzjMNkVPjf+f2TCDPVCep6FEz112OWOwFvWmA=
X-Google-Smtp-Source: AGHT+IE0RLBqJD0BkpQcTV/EV2kUF/HsdwvYmZLgzexIVIG1lhlWqnEgmB3neGLuEQaq7n3PfHJXPg==
X-Received: by 2002:a17:907:869f:b0:9c3:a193:2580 with SMTP id
 qa31-20020a170907869f00b009c3a1932580mr9750219ejc.12.1699115165969; 
 Sat, 04 Nov 2023 09:26:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bn21-20020a170906c0d500b0099d798a6bb5sm2096082ejb.67.2023.11.04.09.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 09:26:05 -0700 (PDT)
Message-ID: <f34d953c-f0c6-449c-b5e3-dc35148ab2b0@mind.be>
Date: Sat, 4 Nov 2023 17:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231103000650.195673-1-adam.duskett@amarulasolutions.com>
 <20231103000650.195673-2-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231103000650.195673-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699115166; x=1699719966; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wjw3kJVniT1MAIZXDDvjW+7mjPSEcxuZ69QoEbDo0Io=;
 b=brnvYp4w6hYdqYQX7eV1w0QxFAe3xsvXXV1PBEnS1/XkZzM3dZZmgUEZ+bDsZCrVYg
 RuamM8cMVf+qE7kt6ym8tOOAz6CspRRW4JOKgk3yKGVb1YUb06IJxkDtVgpImRLYULrV
 4a7MngXzeLhzS+2FmjKQ8ep1b8EV2bMbq/aXSU+Lcoj8WaKArqA074Sjc1eRGIqBc71B
 T4quI3fOD3tXyP4FO9UIXNNy29p9r+1cy9Py8Lo2B/fPk3SsLiPRyWCB91Pz8AcJ3d2F
 JLVdCQrV++gwULbAq9oD89sotCABXVB5PZZrmfjV5eNbJ0cleWqoJeh0N/9wEXoUI5Oj
 6y0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=brnvYp4w
Subject: Re: [Buildroot] [PATCH] package/nodejs: bump version to 20.9.0
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
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/11/2023 01:06, Adam Duskett wrote:
> - Refactor 0001-add-qemu-wrapper-support.patch for 20.9.0
> 
> - NodeJS now requires GCC 10.1 header. However, as there is no
>    BR2_TOOLCHAIN_GCC_AT_LEAST_10_1, we round up to BR2_TOOLCHAIN_GCC_AT_LEAST_11.

  GCC 10.1 is the first GCC release [1] (they start counting at 1, weird 
people). So I think it really should be _AT_LEAST_10.

  Regards,
  Arnout

[1] https://gcc.gnu.org/gcc-10/

> 
> - Drop the --without-dtrace and --without-etw config options as they no longer
>    exist.
> 
> - Update support/testing/tests/package/test_nodejs.py to use
>    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN, otherwise the test fails as the
>    gcc version selected will be 7.
> 
> - Update the hash file for LICENSE.txt due to numerous changes, such
>    as the addition of new libraries and updated dates. No new license
>    types are added.
> 
> Tested with: ./support/testing/run-tests tests.package.test_nodejs
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
