From: Paul Cercueil <paul@crapouillou.net>
Date: Tue, 21 Oct 2014 20:46:42 +0200
Subject: [Buildroot] [PATCH 2/2 v5] package/mono: new package
In-Reply-To: <CA+TH9Vm7c9BGBpRvkLziZM6ctainiTv5f-yb3Y-WxzdAkcfA3g@mail.gmail.com>
References: <54458B8C.4020505@crapouillou.net>
 <CA+TH9Vm7c9BGBpRvkLziZM6ctainiTv5f-yb3Y-WxzdAkcfA3g@mail.gmail.com>
Message-ID: <5446AA12.9010007@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

It is my fault, sorry - I applied the patch to a slightly older version 
of Buildroot, and since then the LIBFOO_CONF_OPT macros have been 
renamed to LIBFOO_CONF_OPTS.

Now host-mono builds fine.

However, the mono package does not. It fails because the 
"locale_charset" symbol is not found. This might be because I don't have 
locale support enabled in my toolchain. I patched around it by removing 
the inclusion of "localecharset.h" in eglib/configure.ac.

Paul

On 21/10/2014 08:06, Angelo Compagnucci wrote:
> Hi Paul,
>
> Could you send your config and a mono.log obtained with this command?
>
>   make -j1 host-mono-reconfigure >> mono.log
>
> Thank you!
>
> 2014-10-21 0:24 GMT+02:00 Paul Cercueil <paul@crapouillou.net>:
>> In-Reply-To: 1413814528-26904-3-git-send-email-angelo.compagnucci at gmail.com
>>
>> Hi Angelo,
>>
>> Your package does not work here, host-mono fails to build.
>> I attached the log file.
>>
>> Could the DLL files be downloaded instead of rebuilt? They should be
>> arch-independent, so it may be easier and faster to just download them.
>> Then only the runtime would need to be built.
>>
>> Regards,
>>
>> Paul
>>
>
>
