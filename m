Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2949CC64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 16:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0753812DA;
	Tue, 28 Feb 2023 16:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0753812DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7iQI8EoWegqq; Tue, 28 Feb 2023 16:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01C4C812C8;
	Tue, 28 Feb 2023 16:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01C4C812C8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 104631BF5A8
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC7DB60B46
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC7DB60B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5o8AKl8S0hsZ for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 16:51:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A44660736
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A44660736
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 16:51:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e37so7987835wri.10
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 08:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677603075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RcgjT7MRUyrvv413yzrSxnOd6ZQgxKk9QVqsgXSPPMc=;
 b=Xox5x7U6E1efSv5XnsUfNlQiLep8VGkqf70WMZGXCi1LwIy3slgMwSyLcM8lD9+vBR
 SFrBJC5JLO0bhnbpRMU3BU2vC+rj7Y3yWgKowKeyHEzTWoBOQzKID1E/y1IFY6+IEtSo
 BUQEP8QCvCr297QJLJi/P35lVy5BTIv4gpSSboPOzPHXj9P2TJNy3ZDqTc+xYfyJdLAg
 R1kd+GhtHbIIjtPZcyJt8KrXOuPyjLjwlNB204SYurM3AUMOM/08Sic6rfZNWaHk50yd
 9eYfh0oFer6J5PJp8/UVXVT0V9pD4Ia3v1HyMmTDoAmSVkMDtaPr8hON1G/7za3nXX0K
 oAyA==
X-Gm-Message-State: AO0yUKWzBQL8aYYjkhTOCConZZceEfEvCAS4IBG1ly42wliE7uoQPnqz
 ycEpa7AVflrPE0LDpAdG+KA=
X-Google-Smtp-Source: AK7set8fc9ZS6qKKYlbKKQGipdfZlINuGClxCIe1H+ODcrgwvEO5Ul3/kSMrMuKfhvAUdQJAfaeHNQ==
X-Received: by 2002:adf:f8d2:0:b0:2c5:5315:a7a7 with SMTP id
 f18-20020adff8d2000000b002c55315a7a7mr2423856wrq.32.1677603075596; 
 Tue, 28 Feb 2023 08:51:15 -0800 (PST)
Received: from ?IPV6:2a02:8070:4182:37a0:64cb:8203:42ee:ef04?
 ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b002c561805a4csm10499237wrm.45.2023.02.28.08.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 08:51:15 -0800 (PST)
Message-ID: <886d6be9-94ba-2bc9-5583-4c9400bf3a76@gmail.com>
Date: Tue, 28 Feb 2023 17:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: stephane gonauer <stephane.gonauer@6wind.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221224171920.11256-1-raphael.pavlidis@gmail.com>
 <20230222232157.380b6109@windsurf>
 <20230228130843.GC32199@carcass.dev.6wind.com>
 <CANqv2T3GWoqn6an34HQUW6njK2g=YZCqvoDMh-kfKooVacRMpA@mail.gmail.com>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <CANqv2T3GWoqn6an34HQUW6njK2g=YZCqvoDMh-kfKooVacRMpA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677603075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RcgjT7MRUyrvv413yzrSxnOd6ZQgxKk9QVqsgXSPPMc=;
 b=W3qIEfV7YBj2LNI51qkliY0hsBTeu6mIQHV/XOQvFxIUaCfITNnZoSNEA/LKWzMVQZ
 bmlYZ7vA/61a6vsvNsamO1LYUQsZTamHcPN134/2CL80gPYnn4ipHqu5Ztnx0Kj6Jyus
 mvOmhKTMgZO9bKdSagUOaEdpYi7sPc2dseWKEcWNH1vnDpXPwVRmtWBZ5zQaBnys/PsN
 epY850B+Cl7Tem5qTMO63/do+9VSVkEFTMUOe5+Oc1C94die4WzLW0Rv1tknm/6muG+z
 coeFIkZ6tt8NqZbidA5yBMAZx4/n/kPzDQE0p1y92vqnES89FFiAL/lCRxyWeKWKrYQr
 D8nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W3qIEfV7
Subject: Re: [Buildroot] [PATCH v4 1/1] package/shadow: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Stephane,

On 28.02.23 15:38, stephane gonauer wrote:
> Hi,
> 
[SNIP]
> 
> The issue can be reproduce with a simpler configuration. Enabling both
> BR2_PACKAGE_LINUX_PAM and BR2_PACKAGE_SHADOW breaks the login.
> Here follow a defconfig that reproduces the issue :

Does it only happens if BR2_PACKAGE_LINUX_PAM **and** BR2_PACKAGE_SHADOW 
is enabled?

> 
> /etc/pam.d reference a system-auth that is not present anywhere in the
> build directory. This might be the root cause but I'm not sure how to
> properly test.

If system-auth is only located in /usr/share/factory/etc/pam.d/ and not 
also in /etc/pam.d/ during boot then something is wrong with the 
systemd-tmpfiles service.

> 
> ---------------
> uildroot/configs$ cat qemu_x86_64_defconfig
> BR2_x86_64=y
[SNIP]

I am not so fit in qemu. Can you provide me the qemu command, so I can 
reproduce it, please?


Thanks,
Raphael Pavlidis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
