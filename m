From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 20 Aug 2016 23:43:15 -0400
Subject: [Buildroot] compiler plugins & compiling the kernel
In-Reply-To: <CAK7rcp9SVrJ4HA3wH6U9P-Tv8EzJdBKUtZa=EVwihZTR5TCdtQ@mail.gmail.com>
References: <CAK7rcp_m+9YC6gJ0xyarD217F4wyjwjg9QSdBLzVgPJ9QLrm7w@mail.gmail.com>
 <20160820200119.4ec5848b@free-electrons.com>
 <CAK7rcp9SVrJ4HA3wH6U9P-Tv8EzJdBKUtZa=EVwihZTR5TCdtQ@mail.gmail.com>
Message-ID: <CAK7rcp9ZEKb7dYNv23E7NF52+u0vL67f3q1XozKK3jRy2dq=pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 20, 2016 at 6:39 PM, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
> On Sat, Aug 20, 2016 at 2:01 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Sat, 20 Aug 2016 13:10:07 -0400, Kenneth Adam Miller wrote:
>>
>>> I've noticed that when the kernel is built, it appears to always be
>>> built with the host compiler, and not the buildroot specified cross
>>> compiler. Why is that?
>>
>> This is not true, the kernel is built with the cross-compiler.
>> Otherwise, Buildroot would never be able to build an ARM, PowerPC or
>> MIPS kernel on a x86 or x86-64 build machine.
>>
>
> Well I'm not arguing with you, but I had at one point set up buildroot
> within a docker instance, and then started the build going when it
> stopped because of some compiler centric package on my host. I
> installed something, and then the build continued in exactly that
> sequence. Although, because my docker instance was stopped abruptly
> and since bash saves history to disk after having been exited I don't
> have that package name. The compiler packages I have are gcc, gcc-5,
> gcc-5-base:amd64, gcc-5-locales, gcc-5-plugin-dev, gcc-6-base:amd64,
> libgcc-5-dev:amd64, libgcc1:amd64
>
>>> In addition, for some pax related options, it requires gcc plugins for
>>> the version being used. That means that I would have to have plugin
>>> support for my host, correct?
>>
>> No, you would need support for plugins in the cross-compiler.
>>
>
> We have been building gr-security modded kernels for some time on a
> different machine with gcc 4.8, but I'm having this confusion; does
> the buildroot internal compiler support that? Because I'm getting an
> error in buildroot indicating that compiler plugins must be supported,
> and I'm using the buildroot internal compiler with version 5.x, it
> confused me a little bit.
>

I found the exact output that brought about the build error.

>>> linux-headers 3.14.51 Configuring...
...
make[2]: Entering directory ... build/linux-headers-3.14.51
Makefile:652 *** Your gcc installation does not support plugins. If
the necessary headers for plugin support are missing, they should be
installed. On Debian, apt-get install gcc-<ver>-plugin-dev. If you
choose to ignore this error and...

>>> I don't believe that there is a way to
>>> enable plugin support for the buildroot toolchain or for crosstool. At
>>> least, when I looked and searched I didn't see any option that
>>> mentioned that. I just want to make sure that I have it correct in
>>> that my host compiler is being used to build the kernel.
>>
>> You're not correct. Support for plugins should be added to the
>> cross-compiler if you need plugin support to build your kernel.
>>
>
> That doesn't appear to be an option in buildroot.
>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
