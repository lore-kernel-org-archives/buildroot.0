Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5241C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 20:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AFB683DB5;
	Tue, 30 Jan 2024 20:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AFB683DB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YmzWLk5z7z7Q; Tue, 30 Jan 2024 20:22:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B73F983DA7;
	Tue, 30 Jan 2024 20:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B73F983DA7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA1DB1BF340
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF43A83DA7
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF43A83DA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJuasIJFkXzB for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 20:22:20 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C8F083BD2
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 20:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C8F083BD2
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6ddb129350cso2638631b3a.3
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 12:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706646140; x=1707250940;
 h=content-transfer-encoding:subject:cc:to:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=40MhLZHwSsvY8pRgu4QM4KefXMO3ZdYYZu7xqj1DVQ8=;
 b=QmsBesWBQh6MFgeM653zAHuerg0x54ZV9tmxPoHPKJgtzXXtjQD/qPy96H0KLcobbo
 n6X2WxMUO7B6r2lCYn3XK0YRWEpJgvGHbiNS/oORTBjeVNdimkb4SpFtwdiWAVKmraUg
 6rhkgz7r0seyxeKQfI6FXTuxuhPdIfCjyBBiKZKKxtAn1SrP77KSjBNe699/W3yjVn9n
 1xqNRj4bf5JTTOaOiBiD6qAmfBgKWfexQM8Tl4E3Pr+zZFxBEXZkvv9i+2BhshyrWCBT
 2uehzm/HOK91fdBm48CSF079WWYEC9wrtONtDcf805qcCKtXtOCieeliAk6s18qq0QB9
 Dowg==
X-Gm-Message-State: AOJu0YwnmcQCRCARmfj5KFyLpjfnNJ3A5Kfm72HEcJfcUJDRUmy/82QR
 7Zi+ybH6mcwuwoPA1j/7+hBSTlkjh1+IUggaJOtrLqkZ8SEfnwu8Szsp/FASVGPEUxNT1s7Y2Yj
 T
X-Google-Smtp-Source: AGHT+IG5+h9SXg+YLFG1GrtcGpNdFrKhw77WSzUHB7j3pIl4HEY6tnnh1RytvZqgN2N6oQGTQhktyA==
X-Received: by 2002:a05:6a20:a39c:b0:19b:5b9d:fe93 with SMTP id
 w28-20020a056a20a39c00b0019b5b9dfe93mr4762023pzk.60.1706646139625; 
 Tue, 30 Jan 2024 12:22:19 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWl45+TsTmrmBwC19TSyjPsv64ECv27SGsesHjIcfyPa6a62jYXEy2N9E/gwjb5yt8VS+1hYwgitPW6hyb83gLQ9KCzYfKDHCgai8aM
Received: from [192.168.0.172] (d172-218-135-26.bchsia.telus.net.
 [172.218.135.26]) by smtp.gmail.com with ESMTPSA id
 g20-20020a62e314000000b006dacfab07b6sm8200335pfh.121.2024.01.30.12.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 12:22:19 -0800 (PST)
Message-ID: <40db655b-0ea0-8169-765c-8c7240d9ef39@threespeedlogic.com>
Date: Tue, 30 Jan 2024 12:22:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
From: Graeme Smecher <gsmecher@threespeedlogic.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 alexander.sverdlin@gmail.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20230601.gappssmtp.com; s=20230601; t=1706646140;
 x=1707250940; darn=buildroot.org; 
 h=content-transfer-encoding:subject:cc:to:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40MhLZHwSsvY8pRgu4QM4KefXMO3ZdYYZu7xqj1DVQ8=;
 b=ilOxifaePSXbF+U/4HFbu018yH/RQB0ViRI9wIQEKX5ZIYejcdEdiGoCnrTGtTn1xX
 3FgxdmG7m5BC+WxXYXLvXulyHwOZM8ZWmVnVjKxFOS7KXZsv4JbrzhiTwpHezfcUEXfk
 5P4pNGt+I54wqLAleW4DbsHmjdGhJkgux9C8i9cggOGeoGHfFOblTmzyhq0Cf9+EWgT3
 GBCDZ4P7j9EAtjltLNABUeA8vUhQ9xRKrC3M352On6y1b2K10Dc0htr6eaYUnLlAsz2m
 oK39mY6WSVema2FmYjeedKiAMxYqBnsQGaU81B2opZjzSoY3mzN6sP3GoovY/nLNjZC9
 5wiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=threespeedlogic-com.20230601.gappssmtp.com
 header.i=@threespeedlogic-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ilOxifae
Subject: [Buildroot] linux.mk: Wildcards in device-tree paths
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Several of the configs in buildroot use wildcards to copy device trees into the kernel build:

     $ grep -re 'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=.*\*' configs/
     configs/octavo_osd32mp1_brk_defconfig:BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/octavo/osd32mp1-brk/linux-dts/*"
     configs/octavo_osd32mp1_red_defconfig:BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/octavo/osd32mp1-red/linux-dts/*"

However, in linux.mk, this variable is expanded into LINUX_DTS_NAME as follows:

     LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))

Notably, there is no $(wildcard) in place and the "*" is passed as a literal asterisk to $(filter), which prunes it due to the missing .dts suffix. I am guessing this line in the config is inert, and that the device trees are pulled into the kernel build via some other configuration line.

I can fix this by adding a wildcard function in this expansion as follows:

     LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(wildcard $(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))))

...but before I prepare a patch, I thought I'd ask if there is a better way of accommodating a wildcard when enumerating device trees. I can, of course, list these files individually, but a wildcard is easier to maintain across device-tree revisions.

thanks,
Graeme
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
