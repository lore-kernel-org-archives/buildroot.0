From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Tue, 18 Feb 2014 09:51:48 +0100
Subject: [Buildroot] ipv6 and eglibc
In-Reply-To: <20140218094655.27e2a040@skate>
References: <53031C60.6020803@gmail.com> <20140218094655.27e2a040@skate>
Message-ID: <53031F24.4070900@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear Thomas Petazzoni,
thank you for you kind and fast answer.
I'll submit the patch (after checked it works ;-) )

Best Regards
Marco

--

Il 18/02/2014 09:46, Thomas Petazzoni ha scritto:
> Dear Marco Trapanese,
>
> On Tue, 18 Feb 2014 09:40:00 +0100, Marco Trapanese wrote:
>
>> I'm trying to add the postgres package, starting with this hints:
>>
>> http://www.slideshare.net/jerome42/create-lightweight-docker-containers-with-buildroot
>>
>> I'm using the eglibc in order to enable the eglsf support for Qt5.
>> Postgresql requires the BR2_TOOLCHAIN_BUILDROOT_INET_IPV6.
>>
>> Searching for this keyword I see this:
>>
>> Symbol: BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 [=n] ?
>> Type : boolean
>> Prompt: Enable IPv6 support
>> Location:
>> -> Toolchain
>> Defined at package/uclibc/Config.in:70
>> Depends on: BR2_TOOLCHAIN_BUILDROOT [=y] &&
>> BR2_TOOLCHAIN_BUILDROOT_UCLIBC [=n]
>> Selects: BR2_INET_IPV6 [=y] ?
>>
>> I guess because I'm using eglibc instead of uclibc.
> This is because what J?r?me (who happens to be my cousin) did was
> not completely correct (and I've Cc'ed J?r?me so he gets this
> feedback!).
>
> Having a dependency on BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 in a package
> is incorrect, as it only works with the internal toolchain backend,
> when building uClibc toolchains.
>
> Instead, he should have read the great Buildroot documentation at
> http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options :-)
>
> So, Marco, just modify the line:
>
> 	depends on BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
>
> by:
>
> 	depends on BR2_INET_IPV6
>
> Also, please submit patches to add Postgresql support. Instead of
> having people following the not-completely correct tutorial of J?r?me,
> we would have Postgresql support in Buildroot itself.
>
> Thanks!
>
> Thomas
