From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 15 May 2012 08:19:58 +0200
Subject: [Buildroot] [PATCH 1/1] opencv: bump to version 2.4.0
In-Reply-To: <20120515034259.GA3091@sapphire.tkos.co.il>
References: <1337035892-29285-1-git-send-email-s.martin49@gmail.com>
 <20120515034259.GA3091@sapphire.tkos.co.il>
Message-ID: <CAHXCMMKcLXdLWySrosjh41WbottHaEz-Y0cZGxrtaJ-hq4Htxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, all,

2012/5/15 Baruch Siach <baruch@tkos.co.il>:
> Hi Samuel,
>
> On Tue, May 15, 2012 at 12:51:32AM +0200, Samuel Martin wrote:
>> Update Config.in and .mk according to the new features.
>>
>> Remove the patch handling uclibc without long double support, which is
>> not necessary anymore.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> [snip]
>
>> +config BR2_PACKAGE_OPENCV_ENABLE_SSE
>> + ? ? bool "enable SSE instructions"
>>
>> - ? ? ? For further information: see OpenCV documentation.
>> +config BR2_PACKAGE_OPENCV_ENABLE_SSE2
>> + ? ? bool "enable SSE2 instructions"
>> +
>> +config BR2_PACKAGE_OPENCV_ENABLE_SSE3
>> + ? ? bool "enable SSE3 instructions"
>>
>> -comment "Build options"
>> +config BR2_PACKAGE_OPENCV_ENABLE_SSE41
>> + ? ? bool "enable SSE4.1 instructions"
>>
>> -config BR2_PACKAGE_OPENCV_WITH_PYTHON
>> - ? ? bool "python support"
>> - ? ? depends on BR2_PACKAGE_PYTHON
>> +config BR2_PACKAGE_OPENCV_ENABLE_SSE42
>> + ? ? bool "enable SSE4.2 instructions"
>> +
>> +config BR2_PACKAGE_OPENCV_ENABLE_SSSE3
>> + ? ? bool "enable SSSE3 instructions"
>> +
>> +endif # BR2_i386 || BR2_x86_64
>
> Can we detect the SSE capability of the target automatically using the various
> BR2_x86_* config options in target/Config.in.arch?

Of course, we could.
But IMHO, this belongs more to the target/Config.in.arch file than to
any packages.
OpenCV may be the first package that can take benefit from such
options, but hope it's not the last one ;-)

I'll see how we can handle this. Any objections?


Cheers,


Sam
