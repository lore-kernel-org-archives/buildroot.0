From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Thu, 24 Nov 2016 01:47:49 -0500
Subject: [Buildroot] profiling
In-Reply-To: <CAK7rcp92MkDZbyRRXHD+kA4zOEA_bQsui0R58YT6Ricfe+cUyw@mail.gmail.com>
References: <CAK7rcp92MkDZbyRRXHD+kA4zOEA_bQsui0R58YT6Ricfe+cUyw@mail.gmail.com>
Message-ID: <CAK7rcp9f+X3wBJ+jtc3kC2rrJUHkiVzxOen755exEsk6tjvAKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually, I just found perf and managed to get it to go on after going
into the kernel to enable it. I think the oprofile help should explain
that perf must be enabled through the kernel in a separate location.

In any case, I got

traps: perf[85] trap invalid opcode ip:441562 sp:7ffd139cb9d0 error:0
in perf[4000000+d60000]
Illegal instruction

What is this all about? My code runs correctly normally.

On Thu, Nov 24, 2016 at 1:42 AM, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
> Hello,
>
> I'm still trying to hunt down massive latency and responsiveness
> issues with our live system. Right now, there are several symptoms and
> problems we are having moving forward...
>
> There is no oprofile `perf` binary for profiling a given target
> binary. I can select oprofile as a package, but perf does not show up
> in my bzImage anywhere and I can't do anything with opreport alone.
> Why is this even possible, and can the help or menuconfig settings be
> updated to auto select something or whatever is needed in order to get
> that tool there?
>
>
> There is a process that I have been testing and working with that is
> supposed to use a single core to tight loop. This has been working
> fine for several months in the sense that when I start up the process
> it correctly enters it's service loop. But lately, top is not showing
> any CPU consumption on the part of the process that I'm using. I don't
> know what the issue is, but the process now appears to be running
> incredibly slow, never really consuming much CPU at all. The bizarre
> thing is that I've specifically coded exactly one thread to burn the
> CPU in a tight loop, but it's not using the CPU. In addition, there is
> still data getting through, as though the kernel is scheduling it for
> a tiny amount of time which would explain the horrible latency and the
> fact that we're still getting through to the other side. But why would
> the kernel do that?
