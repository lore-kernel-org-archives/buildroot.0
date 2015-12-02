From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 2 Dec 2015 12:58:00 -0200
Subject: [Buildroot] [PATCH v2] musl: add a sys/queue.h implementation
In-Reply-To: <CANu7NGu6Y7Uh02hygwa6FfyjL7kgExhZ14wzyLGbNcMGSrnRKw@mail.gmail.com>
References: <1449017908-7935-1-git-send-email-sergio.prado@e-labworks.com>
 <20151202104554.1c667515@free-electrons.com>
 <CANu7NGu6Y7Uh02hygwa6FfyjL7kgExhZ14wzyLGbNcMGSrnRKw@mail.gmail.com>
Message-ID: <CANu7NGtc8OeiK2z7pjcFYBW521szn3mH1D1ev0GiDXSw+tpcuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Via "git log" and "git grep" I identified two packages that have changes
because of queue.h: fastd and libtirpc.

Fastd is using a patch that removes the need of queue.h, and that patch is
already upstream. So I think we do not need to change that.

Libtirpc is using a patch to add a local sys/queue.h implementation. I will
prepare a patch for this one.

Best regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-12-02 11:00 GMT-02:00 Sergio Prado <sergio.prado@e-labworks.com>:

> Hi Thomas,
>
> 2015-12-02 7:45 GMT-02:00 Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com>:
>
>> Dear Sergio Prado,
>>
>> On Tue,  1 Dec 2015 22:58:28 -0200, Sergio Prado wrote:
>> > Musl does not provide a 'sys/queue.h' implementation, and this has been
>> > a problem for packages that depend on it.
>> >
>> > So lets create a package called netbsd-queue that will install a
>> > 'sys/queue.h' in the staging directory when enabled, based on the
>> > NetBSD implementation.
>> >
>> > Musl toolchain and external toolchain packages will depend on this
>> > package, so that 'sys/queue.h' will be always installed when compiling
>> > with a musl based toolchain.
>> >
>> > Tested on ARM and x86 in the following cases:
>> >   - Buildroot musl toolchain.
>> >   - External musl toolchain without 'sys/queue.h'.
>> >   - External musl toolchain with 'sys/queue.h'.
>> >
>> > Fixes:
>> >
>> http://autobuild.buildroot.net/results/24bad2d06ab40024dacf136bee722072d587f84e
>> >
>> > And possibly many others.
>> >
>> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>>
>> From a quick look, it looks good. Can you chase down the packages that
>> had their own workaround for the lack of queue.h ?
>>
>
> OK. I will do it.
>
>
>>
>> At the moment, I see only libtirpc, but I might have missed others. If
>> you could prepare a patch for those packages to make them use the now
>> globally available queue.h, it would be good.
>
>
>> Thanks!
>>
>
> Thanks,
>
>
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151202/5b0fca77/attachment.html>
