Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F13E77377
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B89742D08;
	Sat, 30 Sep 2023 16:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B89742D08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tZE_WSOaleB; Sat, 30 Sep 2023 16:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A9B42CEC;
	Sat, 30 Sep 2023 16:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26A9B42CEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 258621BF681
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F249760BF7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F249760BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id me9ZdHkT0uzp for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:06:34 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E8ED60BD3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E8ED60BD3
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32320381a07so10753548f8f.0
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696089992; x=1696694792;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/uY9+lyJBN0qEmdkYhykgvqLczd/S3/xCBJM6hJqg7Y=;
 b=LEw8fVkfDUfPJxck73hcNLq3ltCqu2efvgFpmkrw9ZpQjFi7YpMa+30Bm1l5fTSMjD
 s8nB2H5jaPu395IKkSXG+0uz6oF5ADAbpHNBGFLl7/NufixzqPzFN1Ghqrjz4VNfjoKs
 +QkZivVQ7tFjhTWoYAkBjs+ovDhhvnHGKc1BcUhUbNfqYz/gDMB6gjGw/N6Dx/BEYPcx
 E/V5LE2dSxYwyjtzJaj55XgPZPcv2Cd4iDHaewDRP3LqqDEO92gwkNOMZYG+FxTfGpa2
 m/CJDgcEwGf/NaPDewPc+4080QTPGkZQn7kNjR1K8JO8LsfUD0UdkD8L3Cv0bxJ2SAoW
 x6dw==
X-Gm-Message-State: AOJu0YwDqswlcOuphXcUKuUCac7/Jbh+sR0qPOJGW1yvGrhDT07cu51r
 mrMHMKqvh5Yo0sXTIn3rH9wUwxGapokjHfGLogUSaA==
X-Google-Smtp-Source: AGHT+IFFfnFARRdMamGGkOorrIq6ZKcjW7RwS/COF2cXzF/0+Jl3DgT4lcou5C096F9uQFCZAUlMJw==
X-Received: by 2002:adf:d235:0:b0:327:b583:21a4 with SMTP id
 k21-20020adfd235000000b00327b58321a4mr76686wrh.8.1696089992278; 
 Sat, 30 Sep 2023 09:06:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adfe891000000b003266ece0fe2sm2374795wrm.98.2023.09.30.09.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 09:06:31 -0700 (PDT)
Message-ID: <63b848ff-3ec5-b4ed-d381-2c30f8ded8a7@mind.be>
Date: Sat, 30 Sep 2023 18:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
In-Reply-To: <20221004110421.137795-1-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696089992; x=1696694792; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/uY9+lyJBN0qEmdkYhykgvqLczd/S3/xCBJM6hJqg7Y=;
 b=SZN8vAl1vBEqkaAXepumV1L2VZC1phqnaf1QkGXu0MmxDpAscXU/Mi2aFCmsoix+UG
 8+Gdx6n5055M/1TuoW2p6oBNdRlolFRIjjW9G1sVXRvkuG2oXdOIbtjctMGs51eQIroJ
 Wkqo7x1kwhjZhsXRpQkF4MEBpOHCSGyAlLz+tTH8Wj7B4YN6B9ibybv9qWgpQt64ufXL
 jVGqDMMhSmqxqp/3j7H1stObu8qAogoRUQVd3U9oJ+PQjk2xR8BHi90A9cwe3hJnq6KJ
 eOex0cLRTNqQmfLzNJZs3+AihLDWKNrp79teDaIOXwFz2wQ+YUbGmY91BwZXtzOaZAzQ
 IVMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SZN8vAl1
Subject: Re: [Buildroot] [PATCH v4 0/5] Configure default wifi through
 kconfig
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/10/2022 13:04, Angelo Compagnucci wrote:
> This series was born while adding support for a board and feeling the
> necessity to have the networking options available in .config.
> I understand that something like that could be done by adding an
> overlay, but it requires a lot of boilerplate only to be able to connect
> to a wifi network.

  As you say, it's something that can easily be added in an overlay. In 
addition, it's something that is only useful in a very specific, very small use 
case: when you're demonstrating a board of which you use only in a single place 
and aren't planning to move anywhere else, and when you don't want ot spend time 
preparing a proper overlay for it.

  So, I'm going to mark this series as rejected.

  That said, there are some useful bits in it, which I'll comment on individually.

  Regards,
  Arnout

> 
> Angelo Compagnucci (5):
>    system: adding options for configuring wifi
>    package/wpa_supplicant: configure wifi on systemv when enabled
>    package/wpa_supplicant: configure wifi on systemd when enabled
>    package/ifupdown-scripts: add wifi configuration when enabled
>    package/initscripts: add service to load kernel modules at boot
> 
>   package/ifupdown-scripts/ifupdown-scripts.mk |  2 +
>   package/initscripts/init.d/S11modules        | 59 ++++++++++++++++++++
>   package/wpa_supplicant/wpa_supplicant.mk     | 24 ++++++++
>   system/Config.in                             | 15 +++++
>   4 files changed, 100 insertions(+)
>   create mode 100644 package/initscripts/init.d/S11modules
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
