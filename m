From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 5 Sep 2017 11:11:30 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-09-03
In-Reply-To: <96835C3F-D03F-4FE6-8A03-08B5CE55F411@openadk.org>
References: <20170904063112.61D1E2085B@mail.free-electrons.com>
 <CALdGskKWPKBPC8gRdZKhOgMXbWoKgMzVxVOzau6HiBc+Sp6ohg@mail.gmail.com>
 <20170904150903.1ea53556@windsurf.lan>
 <CALdGskJ+t_1CRGhS1A-9HradbW2UhAmNgGX5h53_VDboRSXe0A@mail.gmail.com>
 <96835C3F-D03F-4FE6-8A03-08B5CE55F411@openadk.org>
Message-ID: <CALdGsk+fPU-Tz+X94fJjKgQY_ndmPa8i4VOi=mOXrEBjCiY_Rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar

The "attempt to use poisoned "malloc" and "free" " errors are specific to
uclibc thus far, the other 2 or so errors pertains to missing CXX
compilers. For which I will be submitting a patch soon.
I have been experimenting with turning off the thread optimization part for
OpenJPEG, but the error has been very persistent thus far.  It doesn't look
like a threading issue per se, but more like a localization to the
threading being added to OpenJPEG that caused the issue.

Regards

Olivier

On 4 September 2017 at 19:31, Waldemar Brodkorb <wbx@openadk.org> wrote:

> Hi,
> does it happen for musl or glibc toolchains? All support NPTL for ARM.
>
> best regards
>  Waldemar
>
> sorry for tofu
>
> Am 04.09.2017 um 15:38 schrieb Olivier Schonken <
> olivier.schonken at gmail.com>:
>
> Hi All
>
> Sorry for the noise.  Think I have found the issue.  The OpenJpeg team
> added threading which can be disabled.  I'm guessing this is the build
> issue.
> Will create and test a patch for this before submitting.
>
> Regards
>
> Olivier
>
> On 4 September 2017 at 15:09, Thomas Petazzoni <thomas.petazzoni@free-
> electrons.com> wrote:
>
>> Hello,
>>
>> On Mon, 4 Sep 2017 15:04:33 +0200, Olivier Schonken wrote:
>> > Hi Thomas
>> >
>> > Looks like these errors are from uclibc builds.
>> >
>> > In file included from
>> > /home/buildroot/autobuild/run/instance-3/output/host/arm-bui
>> ldroot-linux-uclibcgnueabi/sysroot/usr/include/sched.h:34:0,
>> >                  from
>> > /home/buildroot/autobuild/run/instance-3/output/host/arm-bui
>> ldroot-linux-uclibcgnueabi/sysroot/usr/include/pthread.h:24,
>> >                  from
>> > /home/buildroot/autobuild/run/instance-3/output/build/openjp
>> eg-2.2.0/src/lib/openjp2/thread.c:288:
>> > /home/buildroot/autobuild/run/instance-3/output/host/arm-bui
>> ldroot-linux-uclibcgnueabi/sysroot/usr/include/bits/sched.h:210:46:
>> > error: attempt to use poisoned "malloc"
>> >  # define __sched_cpualloc(cnt) ((cpu_set_t
>> *)malloc(__CPU_ALLOC_SIZE(cnt)))
>> >                                               ^
>> > /home/buildroot/autobuild/run/instance-3/output/host/arm-bui
>> ldroot-linux-uclibcgnueabi/sysroot/usr/include/bits/sched.h:211:33:
>> > error: attempt to use poisoned "free"
>> >  # define __sched_cpufree(__set) free(__set)
>> >
>> > Not sure what the best course of action will be. Try to fix it for
>> > uclibc, do a rollback or disable build for uclibc and open issue on
>> > github for openjpeg.
>> >
>> > Your thoughts?
>>
>> I'm not sure here, since I haven't investigated those build issues.
>> Let's Cc the Buildroot mailing list and uClibc-ng maintainer Waldemar
>> to see what they think.
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170905/32dd53de/attachment.html>
