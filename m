Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4F7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 10:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2AAE82564;
	Mon, 10 Jan 2022 10:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MS9v2IqtZmGO; Mon, 10 Jan 2022 10:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B232C825E6;
	Mon, 10 Jan 2022 10:43:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8587E1BF40A
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 10:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7441E825E6
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 10:43:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ha6ktA8iWDVB for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 10:43:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E392D82564
 for <buildroot@busybox.net>; Mon, 10 Jan 2022 10:43:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r9so24120923wrg.0
 for <buildroot@busybox.net>; Mon, 10 Jan 2022 02:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FMiltYESFOcN8VRHoD/FV5JwSEh0AkNWsirAFJIs4tE=;
 b=gaoDJTMQsNNZXbnnlsva9R6dqSAmeC8vsKMw4+7aWVUKnRdNv/Mn1aO0CqdP4dvq/D
 AYOx6odg78C98N5NZDxjiROCvVcQ/IsOZDpyMLhv+SohDdzPIocqBT/5ShSWWwGC9dxD
 kc2cbfF0RzuPXuGcKQi9KMopkxZyoZw93NMpxmnNaV/dwgtL/vwI66ktwKJdbshVemlK
 taDkDUdSlu6IckCKZyp7lrFw5r4WQP+HRZ9ecwK8ZV+HL10Aozb5j5JbS4/wCdn3FUAK
 dVP9TeiBmlWfqVWaCDLz/J8TysweZ2Xt2apSgyuZOg1m1wQWaiBFo7FqwaOZywDzpPKn
 OCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FMiltYESFOcN8VRHoD/FV5JwSEh0AkNWsirAFJIs4tE=;
 b=HJE6rOwYvSYPcsW6N46yXSdxdWNVZ0oYrVZXpZWNSxFiYdYgvp0S2fmXZmvPSVxmjT
 h4ALvVtabiEYxFjkOqqey7OQezSgSJtrfir6g79frmNc3lt07NctM/QUh38GGJ2I58Dx
 ebl3ULxQfvGQvODX74NUvkDxrjPPK3pFJt+T7de3FMwva4DRXU5m519Mr06G0Qp7m3R1
 pBTBqTe9oFrYzAgnId++WK/8mfznrXgUNWpDFiEHlag6GdLj+WdLZU8i7s2Z65tfSbrw
 W4HfohPNSf/FGRUzgo9Tec+dIeIR9VOMcp8f9KhR3apLi2raTUjdCT9H7ohLXumcaRtr
 0vCg==
X-Gm-Message-State: AOAM530QGWgRKcYzVJK2tjqHF+vOvI2UfEANZ8yI/gqvIzLT60h+A2Sq
 1aRkU+pZE6JqiYZPxK6FtITJxQ==
X-Google-Smtp-Source: ABdhPJzPTngXZIXBH+IkrR2o1ZhOhBtiQfccRd1Lye/ABvzZuXlIvhb3ZP5YndgICVy+R7fcVl0K9g==
X-Received: by 2002:adf:fc47:: with SMTP id e7mr4969354wrs.77.1641811426932;
 Mon, 10 Jan 2022 02:43:46 -0800 (PST)
Received: from [10.39.5.212] ([109.190.253.16])
 by smtp.gmail.com with ESMTPSA id o15sm6593323wro.70.2022.01.10.02.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 02:43:46 -0800 (PST)
Message-ID: <a648c373-3b9f-bae5-96dd-e51760619ced@mind.be>
Date: Mon, 10 Jan 2022 11:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20201017221743.160029-1-nolange79@gmail.com>
 <20201017221743.160029-2-nolange79@gmail.com>
 <20220109151653.GC1477939@scaer>
 <CADYdroOukmBWuv749KyKoLe7=icsN3Cogp1EATm3RbjmwYMDMA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroOukmBWuv749KyKoLe7=icsN3Cogp1EATm3RbjmwYMDMA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2 2/4] package/gcc: use binutils wrappers
 for target libs
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 22:08, Norbert Lange wrote:
> Am So., 9. Jan. 2022 um 16:16 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
>>
>> Nrobert, All,
>>
>> On 2020-10-18 00:17 +0200, Norbert Lange spake thusly:
>>> This will use gcc-ar, gcc-nm and gcc-ranlib instead of the
>>> normal binutils tools. The difference is that with the
>>> wrappers, gcc plugins will be automatically picked up,
>>> which might be necessary with some flags.
>>>
>>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>>> ---
>>> v1->v2:
>>> *   Only set those wrappers if gc 4.7 or newer
>>> ---
>>>   package/gcc/gcc.mk | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
>>> index 114c2887a0..a24ffe3ee2 100644
>>> --- a/package/gcc/gcc.mk
>>> +++ b/package/gcc/gcc.mk
>>> @@ -99,6 +99,9 @@ GCC_COMMON_TARGET_CFLAGS += -Wno-error
>>>   endif
>>>
>>>   # Propagate options used for target software building to GCC target libs
>>> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
>>> +HOST_GCC_COMMON_CONF_ENV += AR_FOR_TARGET=gcc-ar NM_FOR_TARGET=gcc-nm RANLIB_FOR_TARGET=gcc-ranlib
>>
>> So we were a bit skeptical about this one.
>>
>> First, we believe that only the final gcc should be using those. Indeed,
>> we do not need much of the initial gcc, except libgcc.a, which anyway
>> gets overwitten by the final gcc, so we do not care that the libgcc.a is
>> built with LTO (and thus the gcc wrappers). >>
>> Second, gcc initial is only used to build glibc, and as your patch 4
>> states, glibc must not be built with LTO, we we also do not care that
>> the initial gcc uses its wrappers to build libgcc.

  Although I may have been the one to make this obvservation to begin with, I'm 
starting to come back on that. Even though indeed it is probably not very useful 
to apply the wrappers to gcc-initial, it doesn't hurt either. And by putting it 
in _COMMON_CONF_ENV, we make sure that (almost) all of the options are together 
in gcc.mk. Note that --enable-lto is also in COMMON_OPTS.

>>
>> Third, shouldn't we be using the tupple-prefixed wrappers? Or does it
>> just happens that gcc will internally add its build directory to PATH so
>> that it can find the un-prefixed just-built ones?
>>
>> For that last point, I added gcc-ar, gcc-nm, and gcc-ranlib in my PATH,
>> that are just simple wrapper scripts that trace their being called, and
>> then call to the actual gcca-r et al.:
>>
>>      #!/bin/sh
>>      me="${0}"
>>      my_name="${0##*/}"
>>      found=false
>>      for i in $(which -a "${my_name}"); do
>>          if [ "${i}" -ef "${me}" ]; then
>>              found=true
>>          elif ${found}; then
>>              me="${i}"
>>          fi
>>      done
>>      if ! ${found}; then
>>          exit 42
>>      fi
>>      printf "YEM: wrapped %s\n" "${me}"
>>      exec "${me}" "${@}"
>>
>> Turns out that the 'YEM: wrapped' string occurs nowhere in the build
>> directory (so it does not end up in config.log or whatever), and it
>> does not even appear on the stdout/stderr either.
>>
>> So I am wondering how we can exercise these... Any hint?
> 
> Can't tell anymore, I went to crosstool-ng for the compiler some time ago,
> so unlike my other patches I dont use them anymore. >
>  From my memory, it affected some of the additional libs gcc builds,
> libstdc++, some sanitizers maybe.
> there was not absolute paths or tuples as the various stages should
> use the wrappers from the previous ones. I believe the final compiler
> ignores PATH and uses the stage2-compiler with abs path to build the
> included target libraries.

  That it doesn't look in PATH indeed sounds feasible.

  However, what is very surprising is that GCC doesn't automatically use the 
plugins when --enable-lto is passed. Before blindly adding some random options, 
we want to really understand why it is needed, in case maybe things are already 
broken in some other way, and to be able in the future to make changes and 
understand if they're OK or not.

  That said, I have checked and indeed, without these options it seems to use 
plain ar instead of gcc-ar.

  So I looked a bit deeper, and found this really old bug about enabling lto for 
libgcc [1]. It refers to a bunch of other issues found while doing this.

  For me, however, the conclusion is that the patch should be applied, but with 
better explanation. That way, you can set BR2_TARGET_OPTIMIZATION to -flto and 
get an LTO'ed libgcc/libstdc++/etc. If LTO is not used, it doesn't harm to use 
the wrapper.

  There's just one little concern though: I think the wrappers aren't even 
generated unless LTO is enabled. But that point is moot - since GCC N (where N > 
4.9 and < 9), LTO is enabled by default, and we don't pass --disable-lto if LTO 
is not enabled. In other words, nowadays the BR2_GCC_ENABLE_LTO symbol is useless.


  Regards,
  Arnout


[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=59893



> 
> I am just sure it was very deliberately done *this* way.
> 
> Norbert
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
