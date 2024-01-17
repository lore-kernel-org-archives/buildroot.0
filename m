Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DDDC47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 11:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5E841E7E;
	Wed, 17 Jan 2024 11:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5E841E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9Ysa0cNYT5L; Wed, 17 Jan 2024 11:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6787C41E6E;
	Wed, 17 Jan 2024 11:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6787C41E6E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B51E41BF28C
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 11:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B12B41E6E
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 11:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B12B41E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HAcwgXL8xMVa for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 11:15:23 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2295441E08
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 11:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2295441E08
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e67f70f34so11406384e87.0
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 03:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705490121; x=1706094921;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YVWEFAgrNvzqBq9pmEwhpZqwMucVJ7j7+h5hzmhAUPU=;
 b=inHN9TdblXlWmFf6emdjJs+yMV5HKSFfXiJ9ah2+P3hJrQs48pY/p3DHw1us6NcBwi
 w/1jKTvqQHmL+5k4G9WtzSX2xQeIdMqnQzuLlEhgboEFC9snY+RYuk3Y21zRvba6cHWz
 z7eaPzVxe6bNEpa3eQg+kAu+eAgQqzWsQPE89DRcJYiGsLC5lO6dZQvjz1PZULeClysH
 iJZoGg6hGLZCP7tp5ea40EYJ3xtl3DiFafKCFQH5u7JhinAx0erAqqj7xCOCv1IN3Cms
 qwbKCgGaWI+uesGgRmUJwBLQZ/ieV78gOx+nDdS5GTZXkgehAPqtoJozgY0aO8RjMZxk
 PjVA==
X-Gm-Message-State: AOJu0YxiPh/a5sr4ZrYGOpXQVIh5dF0g1HuV861TIFMqITrtv2HrQLJa
 m23+KwQeasvVkBzK19REo3lSZuJS3yboyg==
X-Google-Smtp-Source: AGHT+IGKvfj/JOjVJcElEV8W228JcCwN1W4M9g+Az+4sZW9vaXvHrTPnxMGPphbuq8AWh3IOZyCzSA==
X-Received: by 2002:a05:6512:1323:b0:50e:b3ed:f4fb with SMTP id
 x35-20020a056512132300b0050eb3edf4fbmr5301993lfu.15.1705490120816; 
 Wed, 17 Jan 2024 03:15:20 -0800 (PST)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz.
 [89.103.66.201]) by smtp.gmail.com with ESMTPSA id
 p10-20020a1709060dca00b00a26d20a48dasm7625506eji.125.2024.01.17.03.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 03:15:20 -0800 (PST)
Message-ID: <8cd703c2-6256-4993-a6c8-aba7a824676d@sairon.cz>
Date: Wed, 17 Jan 2024 12:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240109183354.361126-1-sairon@sairon.cz>
 <ZaOkIQZ9czn7zQpU@landeda>
Content-Language: en-US
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <ZaOkIQZ9czn7zQpU@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1705490121; x=1706094921; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YVWEFAgrNvzqBq9pmEwhpZqwMucVJ7j7+h5hzmhAUPU=;
 b=ADtYFOHZ43qLSszt2QNaWG+QurCAyKej/88TWADhhCcNQ6BfxB2IKlEu2xAVcpr7pZ
 YJHSy73WeT8I7bLl1V4sBcd3T6zDfEK2IOqIRxdWl+kx3rlyJI9dySrP4q728lKLW6uZ
 j6hgIHUXGatTwpEEOkp+oqMF4EOHLp/qg76fVnXD0v41ZlOkHtFU8Y47SS9jOdUqfaJp
 nU7BLxRSxKag6vzN9jqfADCSioIr3MGYew6+laO2nczIfc6KeXMCxGQvv+sQtIqA4eT1
 r1+T3Z3vD7KMsQDNsa05V1NZlEOKNanrrOfjoYSYJVYhTaj279iKegUzgakReRWo5fk2
 NVnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=ADtYFOHZ
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20231211
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

>> Updated WHENCE hash due to various commits:
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/WHENCE
> 
> If the file changed, that is because there were changes upstream, so
> stating there are "various commits" that changed the file is not very
> helpful.

It's a bit vague formulation indeed, however it's accompanied with the 
link to the list of changes in the upstream git tree. Unfortunately cgit 
UI doesn't have a way to specify commit range to limit the list of commits.

Anyway, I simply followed the example of previous updates of 
linux-firmware, where a similar wording was used:

----

commit f9ff92a0793fe86353583fc5d36e74ef7e79c255
Author: Bernd Kuhls <bernd@kuhls.net>
Date:   Fri Nov 3 21:11:31 2023 +0100

     package/linux-firmware: bump version to 20231030

     Updated license hash due to various commits:
 
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/WHENCE

---

commit f9ff92a0793fe86353583fc5d36e74ef7e79c255
Author: Bernd Kuhls <bernd@kuhls.net>
Date:   Fri Nov 3 21:11:31 2023 +0100

     package/linux-firmware: bump version to 20231030

     Updated license hash due to various commits:
 
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/WHENCE

---

In some cases the hash was updated without any log message at all, like 
in bec9e5f7852f6fefb234877dff45916d921c4b18.

But no problem, I don't take it personally. Seeing you addressed "all" 
in your reply, I get it's something that we should all be more careful 
about :)

> So, a better phrasing would have been:
> 
>      Updated WHENCE hash due to various new entries for new blobs.
> 

I'll try to keep it in mind for the next time, thanks.

Cheers,
Jan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
