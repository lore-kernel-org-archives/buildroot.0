From: Anders Darander <anders.darander@gmail.com>
Date: Mon, 30 Jan 2012 21:18:33 +0100
Subject: [Buildroot] Gdb(server) on ARM and uClibc
In-Reply-To: <CAE4k23-gErY-gcTnjN1Ldeo6Qv=+ze4OFrMui-sw5HfP0R=9Kw@mail.gmail.com>
References: <CAE4k23-gErY-gcTnjN1Ldeo6Qv=+ze4OFrMui-sw5HfP0R=9Kw@mail.gmail.com>
Message-ID: <CAE4k2388pmoeXVufYiU6cN+K-HgOtoHNg9Qd8QxhdxVhpu7dXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 28, 2012 at 21:04, Anders Darander
<anders.darander@gmail.com> wrote:
> Hi,
>
> I'm probably missing something simple when it comes to my
> uClibc-configuration... (Or is there still problems with gdb on uClibc
> and ARM?)
>
> I'm getting "error: No uintptr_t available; your C library is too
> old." when I'm compiling uClibc. I've tried both 7.2.x and 7.3.x. Next
> step will be to merge the tree I've based my work on sofar with
> master, and try 7.4, however I doubt that it'll help me... (I've sofar
> based this work on the tree
> https://github.com/fhunleth/buildroot-beaglebone.git, as I'm working
> on a beaglebone. I know that the tree in question is getting close to
> 2 months behind master now, but apart from the 7.4 inclusion, I
> haven't seen anything in the git log that I immediately recognize as a
> potential solution).

Again, it shows that one should check HEAD first...

After merging my branch cloned from
https://github.com/fhunleth/buildroot-beaglebone.git, with master from
buildroot, I can at least compile gdbserver.

The main differences, gdb 7.3 => 7.4, and uClibc 0.9.32 => 0.9.32.1.
And Peter also had some gdb-related bug fixes, that might have
helped...

Cheers,
Anders
