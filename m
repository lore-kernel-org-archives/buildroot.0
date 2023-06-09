Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18803C7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 815AC41971;
	Fri,  9 Jun 2023 20:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 815AC41971
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4yrPQsxAgZct; Fri,  9 Jun 2023 20:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFC4C40C21;
	Fri,  9 Jun 2023 20:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFC4C40C21
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F69E1BF375
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 20:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67F6561173
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 20:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67F6561173
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INYEgN_cPQ7d for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 20:16:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4221C60A82
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4221C60A82
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 20:16:55 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-19eab8bca4dso1099734fac.0
 for <buildroot@buildroot.org>; Fri, 09 Jun 2023 13:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686341814; x=1688933814;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Y+ioCeMgL95/bmTsNtSK4Mn4BP23fbI/YRHn2mcCwvc=;
 b=WH4qubpzsqaH8j9a0JLsGeKFzVu6J8RneIToElrQyNlzWp8jD2KoZst7bBbtJ/5l5/
 Nw7f6d/76OrIqFe93nhPgbgjX0acxH4wYa/aAZpfYZ8QUQc/koDNPADFsRscFsmwzGg1
 D4X+MhWnlrbuTw4Meo9Cj99bv92G+rhdJW1yuo4i5EXsNc0T2MizHdhe9vKozLjlVutD
 uyh7RqH8EeFqVpmmgroJTJX0szhdwZSzLc3Ia0Thttc8dKaFaNW+RvkCmqhQbAyaBNmo
 uGNp9Fnutxn+sg6uzrKhIBjJJpOszd+SFQ5mkNYAVuPSlT9rLzUI+adMz1RH7d+G2hBV
 rf1Q==
X-Gm-Message-State: AC+VfDzZihhUc1fE69TCNqLLjXggoXQAMvtUeyysqY3+nHhtSS0T56ba
 ZKt0GLpnrmXrytGqHAd/ccLAh9dByEi/8w==
X-Google-Smtp-Source: ACHHUZ5YMFnrXX1qmx8TdpYLOPWGW7H2qFAE+7k8GWUO20abX1/Erg3Go03oUFp8ZeD3cmlaROTZjg==
X-Received: by 2002:a05:6870:b1d2:b0:196:12ec:110a with SMTP id
 x18-20020a056870b1d200b0019612ec110amr2120697oak.48.1686341813911; 
 Fri, 09 Jun 2023 13:16:53 -0700 (PDT)
Received: from [10.0.0.73] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 e14-20020a4ae0ce000000b0055afd810b50sm1091174oot.44.2023.06.09.13.16.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 13:16:53 -0700 (PDT)
Message-ID: <f7406cf9-7bdb-fe2c-835c-3d103cad2124@gmail.com>
Date: Fri, 9 Jun 2023 14:16:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: buildroot@buildroot.org
From: Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686341814; x=1688933814;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+ioCeMgL95/bmTsNtSK4Mn4BP23fbI/YRHn2mcCwvc=;
 b=StfWjfm1k/e9ONA1/+Sm6k3QKVmkw0CKiW1PY618xvFZUz4GwNnnNTfeFII4zP4TWp
 dWFIw7sdNeJpufdQu4fwtqmC0UAfk5b03tWFdmpE5BxBspzIWUkw7dczY/JSe7n4JFX+
 xeRdRQiY7Esdv0seTJ8icWxG1nE33A5oDT819BKqC9DmICaZRfWdpx1h7tk5MKVxNWbH
 ixoUFgj3c05Q32GH0GpsnIaE8EGFgrU6Fu8xcdKH7GXdfRzsT8gUL5qzI10rJkdW8cPu
 fK6vMHbtZ3SYMfo03joJMWNiC8V3LFBVgQ0xePxil1YOIlwngiit5uOwlUYyYpGZTFka
 rZyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=StfWjfm1
Subject: [Buildroot] 2023.05 - heimdal now requires the libjson perl package
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

While samab4 was updated and looks as though it has a workaround for not 
requiring the system's libjson-perl package, heimdal that samba4 is 
dependent on doesn't seem to have a workaround and still requires the 
system's libjson-perl package to be installed if I'm not mistaken.

Lance
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
