From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 24 Jun 2009 16:35:21 +0200
Subject: [Buildroot] How to get symbolic debugging to work?
In-Reply-To: <h1r69p$kd5$1@ger.gmane.org>
References: <h1p5br$11r$1@ger.gmane.org>  <h1r69p$kd5$1@ger.gmane.org>
Message-ID: <1245854121.25464.29.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2009-06-23 at 18:18 +0000, Grant Edwards wrote:
> On 2009-06-22, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> 
> > I've given up temporarily on getting thread support to work in
> > gdbserver.  Now I'm just trying (and failing) to get basic
> > symbolic debugging to work.
> 
> Gdb 6.8 just plain doesn't work for ARM targets.
> 
> I switched to 6.7.1, and it works fine (including debugging
> multiple threaded apps).

I've now tried this change as well, but it doesn't help with our
problem. Whatever I try, gdb always immidiately receives SIGCHLD and
dies:

gdb /usr/bin/image-test 
GNU gdb 6.7.1
Copyright (C) 2007 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show
copying"
and "show warranty" for details.
This GDB was configured as "arm-linux-uclibcgnueabi"...
Using host libthread_db library "/lib/libthread_db.so.1".
(gdb) r
Starting program: /usr/bin/image-test 
warning: Can not parse XML target description; XML support was disabled
at compile time

[1]+  Stopped(SIGCHLD)        gdb /usr/bin/image-test


That's the same result that I also got with gdb 6.8, except that I
didn't get the warning about the XML target description with that
version.

Our platform is armv5tel with EABI


Sven
