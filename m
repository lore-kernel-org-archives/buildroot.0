Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9455FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28E65403E7;
	Tue, 10 May 2022 19:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eShjh8YxmXSV; Tue, 10 May 2022 19:13:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CA0940148;
	Tue, 10 May 2022 19:13:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71CED1BF307
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60BFF82F13
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4pVZYzY2qds for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:13:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02EC882EF1
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:13:26 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n10so34859648ejk.5
 for <buildroot@buildroot.org>; Tue, 10 May 2022 12:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TwBYWKRmH5ammj3eldR8E1Sjpj9LA9yFwRsUnPVl2YE=;
 b=ezW/bFlUmAsjWGrYryg+ksO/b64uhFPHHB2Tw/3Fab3iAPreSr3cZlewTq8Eagqk8n
 Z/32VcFIbQR0yCJ/PMlNImu3ajusczD6Hww9bEoAQg/6Mlk6UNiqiAQ1vyoh2r/aQPor
 gkSasalV4t2ShZH7Rrcr5OEP8PyyGQQnW4JdzTqt0XbwJJ4RWvp7rN3O52NBQkQvxfnF
 60ThOvYzOajP8Q7eNbDCzp2t65XnWJ6hAK8MUmVuhvIUypJS8zDFrfaDZ+IwWnJrTz2i
 6ngh82gic0ZLJZnaNrw3b1aaZZtAEJdLgWyqI/Dtjcal5NtLlIT1PhP/IhPEoKvHKTVz
 skeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TwBYWKRmH5ammj3eldR8E1Sjpj9LA9yFwRsUnPVl2YE=;
 b=0GtKAB2ukEQ4O0lznHax1Yxtqy6sLstZsO7mpuBb2g7K01qKuZQAxJNUOiBqh3a74B
 TJtg0aFhbO1ZHm7Nw/aFAffZhyvIfv4Q7mhDdcM8uaiPI27EhCk4qvWYw1sNVWLgMv54
 parI5VVEVrsRtjCGSF8PV4hy27qk+/GrA6VsgBc5iVlEgsGK4z6J2SzZ5lvi1l6/Ix4z
 yH1AP/JplNQLvqWgNMNOEplUnl7hjWSB0Oxm+rFz3QoqFof48zEg6tZo0Gdkf0bynk0b
 Qs7PferwBm3iu/TuL81V6v2BXawKdkMdY2LgCBA1oQM8NbkTuoIrSQjIgzVTkMyZJ0+W
 fdlw==
X-Gm-Message-State: AOAM533WGpWS4QzKx8NyagQ86pQOjohkxE7CKbfMqWOxtoFXzLSH4Gfk
 R12OQ68wtPz6fb//qzoG8BPOcA==
X-Google-Smtp-Source: ABdhPJxVtfcF/KiGJCT3yqly3zvyI2ygAgwUt0PHVO42C7/zvLJ6EZUiKm5PqaJi3bphsYowRipUrw==
X-Received: by 2002:a17:907:11c7:b0:6f3:941a:83c2 with SMTP id
 va7-20020a17090711c700b006f3941a83c2mr21266156ejb.33.1652210005151; 
 Tue, 10 May 2022 12:13:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a170906480c00b006f3ef214dd5sm82700ejq.59.2022.05.10.12.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 12:13:24 -0700 (PDT)
Message-ID: <b994c5b7-def3-48e9-9695-08cfc266fe34@mind.be>
Date: Tue, 10 May 2022 21:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Andrey Nechypurenko <andreynech@gmail.com>,
 Yegor Yefremov <yegorslists@googlemail.com>
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
 <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
 <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
Cc: Alsey Miller <alseycmiller@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/05/2022 17:20, Andrey Nechypurenko wrote:
> Hi Yegor,
> 
>>> I am just curious if the following patch will be accepted for the
>>> upcoming release?
>>
>> What about bumping it to 3.23.1?
> 
> At the time I submitted the patch (29.03), v.3.22 was the latest one. It
> also fixes the bug I was facing. So it is good enough for me and definitely
> better than v.3.18 currently used by Buildroot. If you would like to submit
> another one for v. 3.23.1 it would be great.

  Up to now, we've always kept the cmake version in sync with the value of 
BR2_CMAKE_VERSION_MIN (defined in support/dependencies/check-host-cmake.mk and 
updated every time there is a package that requires a specific newer version - 
like swift would, as mentioned by Alsey.

  However, I'm not altogether sure why we do that. Probably so we can detect the 
need for newer cmake in the autobuilders. But maybe we should tackle that in a 
different way.

  What is the bug you were facing? Perhaps backporting its fix is appropriate?

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
