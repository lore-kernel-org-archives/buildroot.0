Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1C5C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 13:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 504A240106;
	Sat,  8 Jan 2022 13:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_5morDVuT5M; Sat,  8 Jan 2022 13:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 585B8400D3;
	Sat,  8 Jan 2022 13:42:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 243301BF301
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12571408DE
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 13:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T1ibTPtNd1KJ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 13:42:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE027408D0
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 13:42:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l10so16778530wrh.7
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 05:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=lGimvoDNAYupUxeCL6kYwgLrFtBFAWZN64Nuyj4YPZ0=;
 b=6RfQIXLvV6vlyVZmzvbFxKDE0D6aacd5b0SZzhKADOBwdBaujvsL1Schi0AvJibppl
 sgaFRWRqoAX7swbU3EFRq/ekKiHDsM+h2V45rA60PQzjfSkjgRPB3ofKVJc6uV3Qfr5j
 kI5R9Dx4YDMQpf6ETPovDibIRjmCcCwwsY/sqTKbAvx0sjcZ3jmW7rTcN3ip/7Xi0r5b
 asjyGCzoAihhHE7+oBPZWVDznJI7ZMl17Wbhk462f93gi3c4ujhD/280OmL3y4sOYcqY
 VNuah63N4GhJKaeVGJoFknBQ6b2675/aXoYlpY2/EsRIPN1GjKWxNyjgO4WiunCapXYE
 z2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=lGimvoDNAYupUxeCL6kYwgLrFtBFAWZN64Nuyj4YPZ0=;
 b=LTNZh0oA94VanFmKCN1yuGk6N8xdi52nZssNXtTs3PB5mq2PmvscAhsCWd5G3RlZtd
 7YTBOgNq0I0Lq4NDdhKFySZVCo+VNDdBWbD7fzTFuJfcI11pQ0Ne1tpy+XwKMA8F8QnU
 wFTrUfUhshecnE0trqiceMBWcpOiMdQzVwu5D+1OHRlfcDfcRyZLozsGwRanFrG3vlfU
 dMgK1l/7Xa9DaA869Qlyas50VIGvAxSRCJWCjZ/uux4hJPCD8EAqvsonvYsPVoiTt9lX
 5t6TxCTOQn6RwouU2ZfoKWSUkXlYsrNyb9GKsev8xvhkTnDLe0SKd8xPn3FLS17h2BY4
 3rWA==
X-Gm-Message-State: AOAM533EIGh92S505vv5Tx+Y/QW5dafGPyymRexsyTSxwMbKBtQZcP11
 Wjw/FXVkxDt2NtjN5lB+k7j5pg==
X-Google-Smtp-Source: ABdhPJwig/ukT5KJwxXuTgV+0S56Z3l5OjzphL1sDQcdoAbf4uC83oyw2Eh18eQFwavdwKBgvCEX6Q==
X-Received: by 2002:adf:dc92:: with SMTP id r18mr57652888wrj.584.1641649360124; 
 Sat, 08 Jan 2022 05:42:40 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id b5sm1672603wrr.19.2022.01.08.05.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 05:42:39 -0800 (PST)
Message-ID: <195311e2-38dc-53ee-80b8-09dca52320a0@smile.fr>
Date: Sat, 8 Jan 2022 14:42:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20201126144722.502163-1-nolange79@gmail.com>
 <c4ba627e-921f-396b-3ae4-685e7da39f5e@smile.fr>
In-Reply-To: <c4ba627e-921f-396b-3ae4-685e7da39f5e@smile.fr>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/systemd: invoke
 systemd-tmpfilesd on final image
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Norbert,

>> +#
>> +# [1] - https://github.com/systemd/systemd/issues/16183
> 
> It seems that systemd now include what you need since version 249 containing the
> commit [1].
> 
> The fakeroot_tmpfiles.sh script seems not neceesary anymore.
> 
> [1]
> https://github.com/systemd/systemd/commit/de61a04b188f81a85cdb5c64ddb4987dcd9d30d3

I have marked this patch as "Changes Requested".

Best regards,
Romain

> 
> Best regards,
> Romain
> 
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
