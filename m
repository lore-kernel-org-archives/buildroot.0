From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Mon, 4 Sep 2017 15:38:58 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-09-03
In-Reply-To: <20170904150903.1ea53556@windsurf.lan>
References: <20170904063112.61D1E2085B@mail.free-electrons.com>
 <CALdGskKWPKBPC8gRdZKhOgMXbWoKgMzVxVOzau6HiBc+Sp6ohg@mail.gmail.com>
 <20170904150903.1ea53556@windsurf.lan>
Message-ID: <CALdGskJ+t_1CRGhS1A-9HradbW2UhAmNgGX5h53_VDboRSXe0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All

Sorry for the noise.  Think I have found the issue.  The OpenJpeg team
added threading which can be disabled.  I'm guessing this is the build
issue.
Will create and test a patch for this before submitting.

Regards

Olivier

On 4 September 2017 at 15:09, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Mon, 4 Sep 2017 15:04:33 +0200, Olivier Schonken wrote:
> > Hi Thomas
> >
> > Looks like these errors are from uclibc builds.
> >
> > In file included from
> > /home/buildroot/autobuild/run/instance-3/output/host/arm-
> buildroot-linux-uclibcgnueabi/sysroot/usr/include/sched.h:34:0,
> >                  from
> > /home/buildroot/autobuild/run/instance-3/output/host/arm-
> buildroot-linux-uclibcgnueabi/sysroot/usr/include/pthread.h:24,
> >                  from
> > /home/buildroot/autobuild/run/instance-3/output/build/
> openjpeg-2.2.0/src/lib/openjp2/thread.c:288:
> > /home/buildroot/autobuild/run/instance-3/output/host/arm-
> buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/sched.h:210:46:
> > error: attempt to use poisoned "malloc"
> >  # define __sched_cpualloc(cnt) ((cpu_set_t
> *)malloc(__CPU_ALLOC_SIZE(cnt)))
> >                                               ^
> > /home/buildroot/autobuild/run/instance-3/output/host/arm-
> buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/sched.h:211:33:
> > error: attempt to use poisoned "free"
> >  # define __sched_cpufree(__set) free(__set)
> >
> > Not sure what the best course of action will be. Try to fix it for
> > uclibc, do a rollback or disable build for uclibc and open issue on
> > github for openjpeg.
> >
> > Your thoughts?
>
> I'm not sure here, since I haven't investigated those build issues.
> Let's Cc the Buildroot mailing list and uClibc-ng maintainer Waldemar
> to see what they think.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170904/4ddc932b/attachment.html>
