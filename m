From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 22 May 2013 15:57:36 +0100
Subject: [Buildroot] [PATCH] mongrel2: Needs a glibc or a
 uClibc-0.9.34-git based toolchain
In-Reply-To: <20130522164332.3a293c0d@skate>
References: <1369231808-11185-1-git-send-email-markos.chandras@gmail.com>
 <20130522164332.3a293c0d@skate>
Message-ID: <CAG2jQ8jBwG7odjAVHUfMYwP6_pzA90LiMkhmF6QhuK6b4eBw-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22 May 2013 15:43, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Markos Chandras,
>
> On Wed, 22 May 2013 15:10:08 +0100, Markos Chandras wrote:
>
>> +     # {get,make,swap}context functions present in
>> +     # glibc and in uClibc's master branch.
>> +     depends on BR2_UCLIBC_VERSION_SNAPSHOT || !BR2_TOOLCHAIN_BUILDROOT
>>       help
>>         Mongrel2 is an application, language, and network architecture
>>         agnostic web server that focuses on web applications using
>
> An external toolchain can be uClibc based... but we don't know which
> version. However, since no uClibc stable release has been released with
> this feature, I don't expect any external toolchain today to have this
> feature enabled. So something like:
>
>         depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
>                 external toolchain uses glibc or eglibc || \
>                 crosstool-ng backend has glibc or eglibc selected
>
> Would probably be more appropriate.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Hi Thomas,

No problem. Although I can't find an option for external toolchain +
eglibc. So what I have right now is this:

        # {get,make,swap}context functions present in
        # {e,}glibc and in uClibc's master branch.
        depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
                BR2_TOOLCHAIN_CTNG_eglibc || \
                BR2_TOOLCHAIN_CTNG_glibc || \
                BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC || \
                BR2_TOOLCHAIN_EXTERNAL_GLIBC

I believe this should cover all the cases. Thanks for the review

--
Regards,
Markos Chandras
