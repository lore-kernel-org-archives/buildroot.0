From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 22 Oct 2014 10:59:55 +0200
Subject: [Buildroot] [PATCH 2/2 v5] package/mono: new package
In-Reply-To: <5446AEBA.4090505@crapouillou.net>
References: <54458B8C.4020505@crapouillou.net>
 <CA+TH9Vm7c9BGBpRvkLziZM6ctainiTv5f-yb3Y-WxzdAkcfA3g@mail.gmail.com>
 <5446AEBA.4090505@crapouillou.net>
Message-ID: <CA+TH9Vk_tf0id+QtxMU=xdHNwdqEmyArRUKJWH32XLrd9pLyMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

> By the way, the package does not install /etc/mono/4.0 or 4.5. It only
> installs /etc/mono/2.0, so some of my test apps do crash.

Thank you for spotting this, I will fix it!

> However, the mono package does not. It fails because the "locale_charset" symbol is not found.
> This might be because I don't have locale support enabled in my toolchain.
> I patched around it by removing the inclusion of
> "localcharset.h" in eglib/configure.ac.

This is strange. localcharset.h is inside an AC_CHECK_HEADERS, so it
should not hurt your compilation. localcharset.h it's in gettext
package, that I've never checked in my builds. Probably you have
something wrong with your gettext.
I'll investigate the problem!

Sincerly Angelo

> Cheers
>
> Paul
>
> On 21/10/2014 08:06, Angelo Compagnucci wrote:
>>
>> Hi Paul,
>>
>> Could you send your config and a mono.log obtained with this command?
>>
>>   make -j1 host-mono-reconfigure >> mono.log
>>
>> Thank you!
>>
>> 2014-10-21 0:24 GMT+02:00 Paul Cercueil <paul@crapouillou.net>:
>>>
>>> In-Reply-To:
>>> 1413814528-26904-3-git-send-email-angelo.compagnucci at gmail.com
>>>
>>> Hi Angelo,
>>>
>>> Your package does not work here, host-mono fails to build.
>>> I attached the log file.
>>>
>>> Could the DLL files be downloaded instead of rebuilt? They should be
>>> arch-independent, so it may be easier and faster to just download them.
>>> Then only the runtime would need to be built.
>>>
>>> Regards,
>>>
>>> Paul
>>>
>>
>>
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
