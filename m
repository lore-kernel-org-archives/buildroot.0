From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 16:37:53 +0200
Subject: [Buildroot] [PATCH] libiio: Bump version to 0.7
In-Reply-To: <1467729343.2504.12.camel@analog.com>
References: <1467714448-19177-1-git-send-email-paul.cercueil@analog.com>
 <c736b54e-15f5-81fe-8aec-06b856efcdc0@gmail.com>
 <1467729343.2504.12.camel@analog.com>
Message-ID: <d1e6d01e-4df3-3fb1-1bd9-cbbab5cfaf36@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

Le 05/07/2016 ? 16:35, Cercueil, Paul a ?crit :
> Hi Romain,Le mardi 05 juillet 2016 ? 16:25 +0200, Romain Naour a ?crit :
>> Hi Paul,
>>
>> Le 05/07/2016 ? 12:27, Paul Cercueil a ?crit :
>>> The two previous patches have been merged upstream, so they have
>>> been
>>> deleted here. Another patch (picked from upstream) has been added
>>> to fix
>>> the build with thread-less toolchains.
>>>
>>> Libiio v0.7 provides two new backends, a USB backend (using libusb-
>>> 1.0)
>>> and a serial backend (using libserialport).
>>>
>>> Additionally, it is now possible to compile libiio with thread-less
>>> toolchains. In that case, thread safety is disabled.
>>
>> In the CMakeLists.txt, if WITH_NETWORK_BACKEND is selected then
>> NEED_THREADS is
>> set to 1. But you removed the dependency on BR2_TOOLCHAIN_HAS_THREADS
>> for
>> BR2_PACKAGE_LIBIIO_NETWORK_BACKEND, so it revert the previous fix.
>>
>> It's weird to select something that require threads support in
>> Buildroot which
>> is finally disabled by the build system.
>>
>> CMake Warning at CMakeLists.txt:239 (message):
>>   pthread library not found; support for threads will be disabled
> 
> The 'NEED_THREADS' in the CMakeLists.txt previously meant a hard
> dependency on pthreads for the paths that enabled it. Now with v0.7,
> its meaning switched to 'requires thread locking mechanisms of lock.c',
> and those will be no-ops with a thread-less toolchain. So despite the
> warning, the network backend will still compile and work fine.

Ok, thanks for the explanation :)

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> 
> Regards,
> -Paul
> 
>>
>
