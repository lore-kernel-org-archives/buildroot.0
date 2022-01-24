Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A28FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 05:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DFE760AE2;
	Mon, 24 Jan 2022 05:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9rF_0SjI8IO; Mon, 24 Jan 2022 05:42:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCFF460B15;
	Mon, 24 Jan 2022 05:42:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D08B11BF25F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 05:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCB94823A0
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 05:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CcGecRbMpn9U for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 05:42:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9CFE81DB2
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 05:42:34 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id d13so9483624ljl.5
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 21:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DmoAouQRoKoqCzTUw5quO7PcrWrRAXTGUsEPcdJgvro=;
 b=aW1SrZxI/Ue4dHRC0C0i9mYOLKoHwaXGMCmVx+NwQ6J7WnE4QtznljeMFtiCLqmbAJ
 2M5sfyKBksQBTzlnt+W/lhQBYpolDLQPgiv+xGIeOA1XXXaccPx/CrDs6lawRhyJwh+6
 BJ2LDCPp+CyKh1jG7wkbFseux9CIHMId33pli924UjWR8+CWAESN4bH1Uy2a1mATlGdy
 0JuFDzD1yyezLdvTms2zBmK7P45gcw4zverO9r7jNdo/PK/5lJorFpoJ9EfcvZEQz4wO
 VnT/VOyaF7vwDkWcIWr/4Q6gEgjJ/fonZ1e3UiCk7SGLN4s1u0MDddr5d6B72BIj0mWc
 norg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DmoAouQRoKoqCzTUw5quO7PcrWrRAXTGUsEPcdJgvro=;
 b=WQum1Q5Oh0XLI5PLaMu/X33k1ArVSj++0VQZ4T+EklN2z3nsAwlr/Bp77Q7tqKXMUK
 ViQ4GxvBxHcD0Ke+CS3zG3A5b7Xos9VMeBuy44+JP+v8GvBV5lgCIlk8i067+1YxsAKQ
 kPyYGuEjpu8cxBfjdWsAEuOrCzY6lLfGBxwwzH7G9WoiKHN8ouB9rFy3FViEgPC5wZRE
 AkGqjWvJJildinnH/AZ8tVdxtt5L3Dn8w5pCyFcUHr9O1KNAsF5rlxn1z1TVbpLv1LTZ
 C5Dz6nWSlQhvRR3kHJrhiK6iNAqGd2YkcPang1FGPyyFAfQquYi5X3fOQaUmHLn+RKx1
 rsAw==
X-Gm-Message-State: AOAM532CDqLIImkT3MXT57czPmSn8B7DYsZERUqE3fSlAJPClaIxFi/n
 GukNkmh7RGB7KedLApqGk8E=
X-Google-Smtp-Source: ABdhPJxR2FqZHQdSj9Tfe13PSzYcV/60H11fH1rVOHp88ivzKCbb9A6gucweb1rHaTiVS9tpyr9khw==
X-Received: by 2002:a2e:9e19:: with SMTP id e25mr10751000ljk.238.1643002952827; 
 Sun, 23 Jan 2022 21:42:32 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id j16sm1055353lfu.116.2022.01.23.21.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 21:42:32 -0800 (PST)
Message-ID: <1dea301e-8425-a1ca-fc69-db338825b19c@gmail.com>
Date: Mon, 24 Jan 2022 08:42:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
References: <20220117080616.10563-1-heiko.thiery@gmail.com>
 <20220122151130.59ae7148@windsurf>
 <c0fdfc83-150f-bd10-33a6-501e6171dff3@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <c0fdfc83-150f-bd10-33a6-501e6171dff3@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/2] board/kontron/pitx-imx8m: use extlinux
 instead of U-Boot boot script
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

24.01.2022 01:01, Giulio Benetti:
> IMHO the worst drawback I see while using extlinux.conf VS boot.scr is 
> the missing checksum. Especially on embedded systems we deeply treat.
> Not having such checksum can make system booting without a parameter on 
> linux command line for example, only because 1 ASCII has been corrupted.
> I prefer the system to not boot at all in general instead of having it 
> "working" while hiding some potential problem.
> 
> What do you and All think about this?

IMHO extlinux.conf is more debugging friendly.

Boot.scr requires the following command:
mkimage -C none -A arm -T script -d boot.cmd boot.scr

The mkimage utility (BR2_PACKAGE_HOST_UBOOT_TOOLS) is not on the board, 
you need to transfer the converted file over the network. Or reconnect 
the microSD card.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
