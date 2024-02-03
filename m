Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DC7C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C8E41E1F;
	Sat,  3 Feb 2024 18:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C8E41E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtpxiRLCUB3A; Sat,  3 Feb 2024 18:29:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2169241D75;
	Sat,  3 Feb 2024 18:29:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2169241D75
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 077411BF852
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 17:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E81384191B
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 17:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 46Ery04qj6Aj for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 17:22:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0425441906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0425441906
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0425441906
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 17:22:52 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so467766666b.3
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 09:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706980971; x=1707585771;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q7thiY6PkejDSTo7wU3zxcHwJ/4E/PXCcs/9OuDFj8w=;
 b=GcD07UZU7awIKr5LJDeA6KKm3pgTA+qr2cRCrWSHZG9LXU5gS00HDRVEbAEOb826M2
 71uis1SPJh2ky2uNI3E7KdbnKMbrCtZnce0YxAv0jSebJFLgCvSSaedytUDnoYXud6pZ
 PQzQkwfRHR/pax6ho7VhtHj4DLxzbNg/12OVNdJJB7ZaDwszOiQgtQSsDeL8YUqB4dMA
 3ruZ7a+rRQUlXCsmh7srXTrgRCweYuc9D6X1Uuiwj2K4aGTaJXBPiWJqUUqqG/+6BcPw
 a41vFP1T06ktq36m0a1FMiTOTrq4O7xZw3X7dm4AaAIHJcf9I2/Ep8Zm2TqGdZefl5Lb
 XeEw==
X-Gm-Message-State: AOJu0YzoRBwictzj9EbwyT0JRx4vWEwhJPLVIxxZ6/IaLDW81TyceXWM
 c+ToIM6QTo4CkyFJfoOQE5sLilnPehHvp1jjaMmgjTUeWLuPLlQZFVll+oPd
X-Google-Smtp-Source: AGHT+IHRgouF/DlXdNBPk8IPaSgJ2rodWxIbQXC48gubtiNE4AIQXA3VfyrLVjy4KEBFs/zUn5L3Qg==
X-Received: by 2002:a17:906:3157:b0:a37:2c8f:6ca2 with SMTP id
 e23-20020a170906315700b00a372c8f6ca2mr2374577eje.37.1706980970621; 
 Sat, 03 Feb 2024 09:22:50 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWjJkZfQ+c9ElJH+KJE4+LtmYJah014c0ei7PbnWzpq4LhUdkcaDQqWWSiCEOBeF8jKTdC/H1a3B4vfA+70Di44z6U8G6XLBA==
Received: from ?IPV6:2a00:10:7f17:f01:4503:8b32:1ee1:49d4?
 ([2a00:10:7f17:f01:4503:8b32:1ee1:49d4])
 by smtp.gmail.com with ESMTPSA id
 ps8-20020a170906bf4800b00a377876153esm151779ejb.48.2024.02.03.09.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Feb 2024 09:22:50 -0800 (PST)
Message-ID: <3e7ed18c-9a37-46f2-a85e-f7f9ba35767e@gmail.com>
Date: Sat, 3 Feb 2024 18:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stefan Ott <stefan@ott.net>, buildroot@buildroot.org
References: <d000051f-9013-41e0-b72f-68cbd0652854@gmail.com>
 <20240203030138.1934339-1-stefan@ott.net>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20240203030138.1934339-1-stefan@ott.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706980971; x=1707585771; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q7thiY6PkejDSTo7wU3zxcHwJ/4E/PXCcs/9OuDFj8w=;
 b=TIQzs0FWM0MUMGvbqyq1DsXjOf7A2f895behP7F3dBMJ2wDR/r1PTqrsraPeW0hcoF
 NlCw9vfmpdMiWBl689ERdqn1FEo8jU08RbCN9GggI+up9iGVb8fH0d68ZRBc0qGDhc6U
 ChUMLWzTC5HWJWAa8C3hvKqoZLdTp7tr1hCGD2mOIdYaRBj5W/g1abTRnF8ylhC3PbkA
 0Gtnj4hxKkcDpCDKCg0I02mULBTlZDUMaT5TJljNw6Eo52oehMK6+VMp1E56X/XLqkw5
 9oyAG2yC1YRaz9P+7Q8CIoGTph9zGQp5iE4+GNy+sw4g9/aTQ/95nzwOSz0Jo3oFkCyB
 CRvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TIQzs0FW
Subject: Re: [Buildroot] [PATCH v4] package/sway: make systemd optional
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

Hi Stefan,
looks good to me. Unfortunately, I do not have permission to do that.

Thanks,
Raphael Pavlidis

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
