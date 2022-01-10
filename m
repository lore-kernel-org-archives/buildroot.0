Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3948BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAD37826E7;
	Mon, 10 Jan 2022 07:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5yVjdfhTFfO; Mon, 10 Jan 2022 07:33:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2363F826C0;
	Mon, 10 Jan 2022 07:33:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B34091BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9318A408E1
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5J94AFKiJSl for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:33:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2DA9408B6
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:33:15 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k18so24900418wrg.11
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TMxzMnz3ViGkv24mfrITNUtDFEVdu6HP72bGcotiB68=;
 b=BZH7Uryj+VQYOH7ewEeqShmvonz1gwR4dD/WN2z4JrbmZ1bKB+DZvPTVkNY8Cf1ezX
 G3oscpP/Nt68y0WzfG8J3eqwpXYIn6kSp3YFbFGuc0q0m0H3YhGQZMkZu+shol6lJU6M
 H1lpGx7roBnCmGm7oEI+0fRL8HW07ej9ya8j9Saj7hORwSTPjLEzkXtSAqnxssEb9GvD
 6UOExjN4pTqGZFXqwiFyLgIOwl32NzSUK4aT5fLIRW/dHvsv2mVN4BYw4yGIAtUCjs3X
 z/nl7U6aAi+SiEa4Wj2v75a1D9Gsn3x7UFk7gQgIjcQMGe0T08Q/it07WB5bmixqX0FE
 30gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TMxzMnz3ViGkv24mfrITNUtDFEVdu6HP72bGcotiB68=;
 b=VBDYRubiR9t1IOyvxlD3fBCak3Bz0lE4rHAYcC4tiL7x0c6kDolqMK31ozuBQGpUVV
 pFX6yPZaWbWNpUSxMxpgEqXM18984zvzMafRNmZYhy4es5eMiHImE/fENTly+Qrg6uZ3
 XWYv8CNCbbiJ5dnEc45hB1XgE4t/SN+URd9XBXEhaecrfSK6lDsP740zx+LImA7137Xi
 SJ/zXutsLantfIZ/5e47F1DdcIiJn3URrlX1VrNgBWtFe4lCZK9jgspkmilQwBmebDpF
 +CESAuzY1RBDmAe7qkVXSsLmqslXsksb7fbl2qGgt4Qb743ww7NR6tm31/H1pQaC7RBc
 zQsw==
X-Gm-Message-State: AOAM530BFdgOnn+pC/GDvr8egNLUgBcW+gwn0ut4WV+DD7M2FtvRZb8r
 ZB9Y9fn/yuq6FIfZZ/xLYDkodw==
X-Google-Smtp-Source: ABdhPJzr3vimVW2yfAoLVt31xeq+csbuBwjK2CeoCQ5V5LdQXKGDtk4CTtZaSKz1nOO2TFLa4fD8kw==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr63744497wry.195.1641799993810; 
 Sun, 09 Jan 2022 23:33:13 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id b14sm6249096wri.112.2022.01.09.23.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:33:13 -0800 (PST)
Message-ID: <420ac869-6aea-a492-7a74-3014b7bb4cf3@mind.be>
Date: Mon, 10 Jan 2022 08:33:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: William Tambe <tambewilliam@gmail.com>
References: <CAF8i9mOtQLce7b+H_PzHrsiUe_5qphpk-QsXq=WeLZodMv1heA@mail.gmail.com>
 <d85d6f3c-2315-8583-a48c-b0b58e443a4d@mind.be>
 <CAF8i9mPphK+bKcnTtd6soqP1_vfPaE=F=GB945sW+Xdwqm+h4A@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAF8i9mPphK+bKcnTtd6soqP1_vfPaE=F=GB945sW+Xdwqm+h4A@mail.gmail.com>
Subject: Re: [Buildroot] BR2_PACKAGE_DHCP_CLIENT fails to build:
 readline/history.h: No such file or directory
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/01/2022 00:46, William Tambe wrote:
> On Sun, Jan 9, 2022 at 2:08 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 09/01/2022 19:18, William Tambe wrote:
>>> I am attempting to build:
>>>
>>> +BR2_PACKAGE_DHCP=y
>>> +BR2_PACKAGE_DHCP_CLIENT=y
>>>
>>> However it fails as follow complaining about not finding readline/history.h:
>>>
>>> making all in /home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/bin/nsupdate
>>> /home/tambewilliam/Documents/buildroot-build/host/bin/pu32-elf-gcc
>>
>>    pu32 doesn't exist in Buildroot, so this may very well be due to external changes.

  So, do you have external changes that may be the cause of this? IOW, can you 
reproduce the problem on upstream Buildroot?

>>
>>> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35
>>> -I../.. -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/lwres/include
>>> -I../../lib/lwres/unix/include -I../../lib/lwres/include
>>> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/dns/include
>>> -I../../lib/dns/include
>>> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/bind9/include
>>> -I../../lib/bind9/include
>>> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/isc/include
>>> -I../../lib/isc -I../../lib/isc/include -I../../lib/isc/unix/include
>>> -I../../lib/isc/pthreads/include -I../../lib/isc/noatomic/include
>>> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/isccfg/include
>>> -I../../lib/isccfg/include    -D_REENTRANT -DVERSION=\"9.11.35\"
>>> -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
>>> -D_FILE_OFFSET_BITS=64  -Os -g0  -static   -W -Wall
>>> -Wmissing-prototypes -Wcast-qual -Wwrite-strings -Wformat
>>> -Wpointer-arith -fno-strict-aliasing -fno-delete-null-pointer-checks
>>> \
>>>           -DSESSION_KEYFILE=\"/var/run/named/session.key\" \
>>>           -c ./nsupdate.c
>>> ./nsupdate.c:104:10: fatal error: readline/history.h: No such file or directory
>>>     104 | #include <readline/history.h>
>>>         |          ^~~~~~~~~~~~~~~~~~~~
>>
>>    This sounds like you changed your configuration without doing 'make clean'. Is
>> that possible?
> 
> I am building from clean or from scratch.
> 
>>
>>    Is BR2_PACKAGE_READLINE enabled in your configuration? Has it been built?
> 
> Yes, BR2_PACKAGE_READLINE is enabled in my configuration.

  And does it get built? Does output/build/readline/.stamp_staging_installed exist?

  The bind.mk file has this:
ifeq ($(BR2_PACKAGE_READLINE),y)
BIND_DEPENDENCIES += readline
else
BIND_CONF_OPTS += --with-readline=no
endif

which should make sure that readline is built and installed before bind. This in 
turn should make sure that output/host/*/sysroot/usr/include/readline/history.h 
exists.

  Regards,
  Arnout

> 
>>
>>    Regards,
>>    Arnout
>>
>>> compilation terminated.
>>> make[5]: *** [Makefile:473: nsupdate.o] Error 1
>>> make[4]: *** [Makefile:79: subdirs] Error 1
>>> make[3]: *** [Makefile:88: subdirs] Error 1
>>> make[2]: *** [package/pkg-generic.mk:270:
>>> /home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/.stamp_built]
>>> Error 2
>>> make[1]: *** [Makefile:23: _all] Error 2
>>> make[1]: Leaving directory '/home/tambewilliam/Documents/buildroot-build'
>>> make: *** [pu32/makefile:67: pu32-build/buildroot] Error 2
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
