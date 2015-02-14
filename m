From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 14 Feb 2015 09:53:56 +0100
Subject: [Buildroot] [PATCH v4 1/3] package/mono: enable mono library
	compilation
In-Reply-To: <20150214075839.5ee08252@free-electrons.com>
References: <1423748972-17471-1-git-send-email-angelo.compagnucci@gmail.com>
 <1423748972-17471-2-git-send-email-angelo.compagnucci@gmail.com>
 <20150214075839.5ee08252@free-electrons.com>
Message-ID: <CA+TH9Vnswp+zP1Han+xkLZxCQO+HPwNvTTMqKbWZ_5-Gbij4mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-02-14 7:58 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Thu, 12 Feb 2015 14:49:30 +0100, Angelo Compagnucci wrote:
>
>> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
>> index 0bbf338..9ec3c24 100644
>> --- a/package/mono/mono.mk
>> +++ b/package/mono/mono.mk
>> @@ -21,7 +21,6 @@ MONO_AUTORECONF = YES
>>  MONO_CONF_OPTS = --disable-gtk-doc \
>>       --with-mcs-docs=no \
>>       --with-moonlight=no \
>> -     --disable-libraries \
>>       --with-ikvm-native=no \
>>       --enable-minimal=aot,profiler,debug \
>>       --disable-mcs-build \
>
> Apparently, Mono was working fine with --disable-libraries, as long as
> no third party libraries are used. So should we make this optional
> instead? What is the size impact of this (i.e a Mono build with
> --disable-libraries, and a Mono build without --disable-libraries), in
> terms of installed size? If the size difference is small compared to
> the overall size of Mono, then I'm fine for doing it unconditionally.
>
> Could you comment on this?

libmono* size is ~6mb and the overrall size of mono with only 4.5
libraries is ~60mb so it's a ~3.6%. If think it's too much, I'll add
an option to enable/disable compilation of it.
I think that the size is small (if compared to the entire size) and
could be enabled without too much thinking. Obviously, a user can
manually remove files he/she not uses, there are tons of libraries
rarely used that can be removed. But this is an optimization step that
only the software developer can do.

Sincerely, Angelo

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
