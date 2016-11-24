From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Thu, 24 Nov 2016 01:42:48 -0500
Subject: [Buildroot] profiling
Message-ID: <CAK7rcp92MkDZbyRRXHD+kA4zOEA_bQsui0R58YT6Ricfe+cUyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm still trying to hunt down massive latency and responsiveness
issues with our live system. Right now, there are several symptoms and
problems we are having moving forward...

There is no oprofile `perf` binary for profiling a given target
binary. I can select oprofile as a package, but perf does not show up
in my bzImage anywhere and I can't do anything with opreport alone.
Why is this even possible, and can the help or menuconfig settings be
updated to auto select something or whatever is needed in order to get
that tool there?


There is a process that I have been testing and working with that is
supposed to use a single core to tight loop. This has been working
fine for several months in the sense that when I start up the process
it correctly enters it's service loop. But lately, top is not showing
any CPU consumption on the part of the process that I'm using. I don't
know what the issue is, but the process now appears to be running
incredibly slow, never really consuming much CPU at all. The bizarre
thing is that I've specifically coded exactly one thread to burn the
CPU in a tight loop, but it's not using the CPU. In addition, there is
still data getting through, as though the kernel is scheduling it for
a tiny amount of time which would explain the horrible latency and the
fact that we're still getting through to the other side. But why would
the kernel do that?
