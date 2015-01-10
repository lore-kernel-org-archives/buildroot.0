From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 10 Jan 2015 02:13:32 +0100
Subject: [Buildroot] [PATCH] Linux kernel module for Waveshare 3.2inch
 RPi LCD (B) V3 touch controller
Message-ID: <trinity-1952e396-b250-47cb-af17-8f840cae0bc2-1420852412854@3capp-gmx-bs28>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Fri, Jan 09, 2015 at 11:48:14PM +0100, Yann E. MORIN wrote:
> Peter, All,
> 
> On 2015-01-09 22:40 +0100, Yann E. MORIN spake thusly:
> > On 2015-01-09 21:21 +0100, Peter Seiderer spake thusly:
> [--SNIP--]
> > > Maybe the way to go is to wait (or add?) for raspberry pi linux-3.18
> > > kernel support in buildroot with device tree overlay support (see [1],[2])?
> > 
> > I'm working on it, and should be able to submit it shortly. You can see
> > the previous attempt in that thread:
> >     http://lists.busybox.net/pipermail/buildroot/2015-January/116241.html
> 
> I've updated my branch, and have now submitted the series:
>     http://lists.busybox.net/pipermail/buildroot/2015-January/116919.html
> 

Thanks, great work. My RaspberryPi B+ booted with the new linux-kernel/DT support.

The only thing I had to change is the kernel compression standard
(in the kernel config file) from CONFIG_KERNEL_XZ=y to CONFIG_KERNEL_GZIP=y
because otherweise the script mkknlimg failed with:
"* Is this a valid kernel? In pass-through mode."

Maybe some uncompress tool is missing or is to old on my host? Is
it possible to run mkknlimg automatically (with buildroot host/usr/bin path)
to avoid such errors (and avoid someone installing zImage without running
mkknlimg)?

No DT overlays tested so far (will do soon to enable the buttons on my adafruit28
which need gpios configured to input with pull-up)...

So far:

Tested-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
