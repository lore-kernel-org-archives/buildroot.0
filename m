From: Will Moore <will.moore@beraninstruments.com>
Date: Thu, 3 Jan 2013 16:59:15 -0000
Subject: [Buildroot] Building For 486
In-Reply-To: <000301cde9cd$7b4bb8e0$71e32aa0$@co.uk>
References: <000301cde9cd$7b4bb8e0$71e32aa0$@co.uk>
Message-ID: <AC90E66A6CD74D73BE3BEFF9E6A04249@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ted,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Ted Wood
> Sent: 03 January 2013 16:15
> 
> I'm trying to use Buildroot to build an image for a Vortex 6326D SBC with a
> 486 processor.
> 

It is DM&P vortex86dx on the 6326D, I am using the same processor on a ICOP
VDX-6354D using buildroot.  I am sure you already know this is not an i486 but a
SoC that is *something* like a i486...
 
> 
> Even if I set the processor options to 486 using  menuconfig, when I try to
> run it, the built kernel comes up with the message
> 

You need to ensure you use "an appropriate" kernel configuration for the
vortex86dx and correctly configure buildroot to build the kernel with it, let me
know if this makes no sense and you need more details...

IMHO a good starting place is the 2.6.29.6 kernel config provided by DM&P in
their X-Linux distribution.  I say a good starting place as I have had no end of
problems moving to more recent kernels.  (OT: I have had no end of problems with
this CPU full-stop, I have a deep seated suspicion that the FPU is "broken" or
at least both Linux and QNX kernels don't like it much, I run with it turned off
and use the Linux FPE. YMMV).

> 
> "This kernel requires an i586 CPU, but only detected an i486 CPU. Unable to
> boot please use a kernel appropriate for your CPU"
> 
> Is it that the Linux kernel simply does not support 486 processors after a
> certain version?

Nope, you can run Linux on a vortex86dx, you can run it on a vortex86sx too.
 
HTH,


Will

> 
> 
> 
> 
> 
> 
> 
> 
