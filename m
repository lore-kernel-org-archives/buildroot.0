From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 18 Dec 2015 16:12:57 -0200
Subject: [Buildroot] [PATCH v3] libgdiplus: new package
In-Reply-To: <CANu7NGtNLr0u42ZXMoOuuPMOp+Rm=c=GROEF=tZmgrWHQgfPqg@mail.gmail.com>
References: <1448410510-23087-1-git-send-email-sergio.prado@e-labworks.com>
 <20151217222952.28cfb35c@free-electrons.com>
 <20151218114117.5d273ce1@free-electrons.com>
 <CANu7NGtNLr0u42ZXMoOuuPMOp+Rm=c=GROEF=tZmgrWHQgfPqg@mail.gmail.com>
Message-ID: <CANu7NGt5xa9gWAxY4ha7VDbo0HxTNQ4VeMD7f4kD74tggmsdYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

There was an error in the configure script that was not generating ldflags
correctly, and the generated Makefile was trying to link with -L/lib. I
have sent a patch to fix it, and there is already a patch to fix it
upstream.

The reason I did not catch this problem was because the toolchains I used
to test generated a warning instead of an error:

Beaglebone with uclibc
arm-buildroot-linux-uclibcgnueabihf-gcc: WARNING: unsafe header/library
path used in cross-compilation: '/lib'

Qemu x86 with glibc
i686-buildroot-linux-gnu-gcc: WARNING: unsafe header/library path used in
cross-compilation: '/lib'

Why some toolchains generate an error and others a warning in this
situation? Is there a configuration to enable this check when generating
the toolchain?

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-12-18 8:56 GMT-02:00 Sergio Prado <sergio.prado@e-labworks.com>:

> Hi Thomas,
>
> 2015-12-18 8:41 GMT-02:00 Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com>:
>
>> Hello,
>>
>> On Thu, 17 Dec 2015 22:29:52 +0100, Thomas Petazzoni wrote:
>>
>> > Other than that, I couldn't spot any issue, so I applied. Don't
>> > hesitate to monitor http://autobuild.buildroot.org and/or the daily
>> > autobuild report e-mails to see if there are any libgdiplus related
>> > failures.
>>
>> There are some build issues:
>>
>>   http://autobuild.buildroot.org/?reason=libgdiplus-3.12
>>
>> There is a -L/lib somewhere which is wrong. Could you have a look?
>>
>
> Sure, I'll take a look.
>
>
>>
>> Thanks a lot!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151218/9489ced7/attachment.html>
