From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jul 2013 12:40:30 +0200
Subject: [Buildroot] where is 'ldd'?
In-Reply-To: <CAAXf6LU3ShNk9JdG-eVv7Lt3OLopP5butkPK-8Mb4L+3gmRzxg@mail.gmail.com>
References: <20130708135640.GA7070@zuhnb712> <51DAC94D.2030706@gmail.com>
 <20130708142743.GB11258@zuhnb712>
 <CAAXf6LU3ShNk9JdG-eVv7Lt3OLopP5butkPK-8Mb4L+3gmRzxg@mail.gmail.com>
Message-ID: <20130709124030.530d3a3e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 8 Jul 2013 18:49:40 +0200, Thomas De Schampheleire wrote:

> You really don't need a special ldd.
> ldd is just a script. In its most basic usage (ldd <executable>), it just runs:
> # LD_TRACE_LOADED_OBJECTS=1 <executable>
> 
> For example on busybox:
> # LD_TRACE_LOADED_OBJECTS=1 /bin/busybox
>         linux-vdso32.so.1 =>  (0x00100000)
>         libc.so.6 => /lib/libc.so.6 (0x0fe70000)
>         /lib/ld.so.1 (0x48000000
> 
> So for sporadic usage, an ldd script isn't even needed.

Right, but does this work with the uClibc dynamic loader? Anyway, if
those features don't exist with the uClibc dynamic loader, then
implementing ldd is simply impossible.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
