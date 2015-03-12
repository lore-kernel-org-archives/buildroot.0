From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 12 Mar 2015 14:01:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/Makefile.in: Do not add
 --enable-debug flag.
In-Reply-To: <20150311214225.746fe0cd@free-electrons.com>
References: <1426093401-23108-1-git-send-email-johan.oudinet@gmail.com>
 <20150311214225.746fe0cd@free-electrons.com>
Message-ID: <CAJtjsKbOtyBFYOPmLoKWMbpBA0Msyr0DqMiaOzbuzTdSL0vERQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wed, Mar 11, 2015 at 9:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> -ifeq ($(BR2_ENABLE_DEBUG),y)
>> -ENABLE_DEBUG := --enable-debug
>> -else
>> +ifneq ($(BR2_ENABLE_DEBUG),y)
>>  ENABLE_DEBUG := --disable-debug
>>  endif
>
> So if we have BR2_ENABLE_DEBUG enabled, then we don't pass
> --disable-debug. And when BR2_ENABLE_DEBUG is disabled, we're passing
> it. I'm not sure to understand the logic here.
>
> Shouldn't we simply unconditionally pass --disable-debug, or not pass
> anything at all?

I felt bad in passing --disable-debug when BR2_ENABLE_DEBUG is set,
and I didn't want to remove it otherwise (in case a package expects
it). Still, the result is not logic. Actually, there is no good reason
for a package to depends on a --disable-debug flag to produce a
version without debugging information (see for example
http://stackoverflow.com/a/4680578/1448926)
I'm going to remove --disable-debug too.

>
> Also, a number of packages had workarounds in their specific .mk file
> to avoid --enable-debug. It would be good to get rid of such
> workarounds as well.

Indeed, I'm going to get rid of such workarounds and send another
version for this patch.
Thanks for the quick review.

-- 
Johan Oudinet
