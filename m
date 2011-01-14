From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 10:40:16 +0100
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <469243A17FE74439A7BBB6F327046F20@beraninstruments.com.local>
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114090752.5f01ade5@surf>
	<469243A17FE74439A7BBB6F327046F20@beraninstruments.com.local>
Message-ID: <20110114104016.252e7f90@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jan 2011 09:24:19 -0000
"Will Moore" <will.moore@beraninstruments.com> wrote:

> > Hard to say since we can't reproduce without having the hardware. I
> > suspect that on a "normal" x86 CPU, sshd and ssh-keygen are working
> > fine.
> 
> I am working on a *similar* platform (vortex86dx VDX6354 embedded PC104)
> with buildroot for some time.  I have dropbear working without problems.

Ok, good to know. We don't know if Kyle is using dropbear of the
full-fledged openssh. That might make a difference.

> > Are you sure that the Vortex 86DX supports all instructions of i486 ?
> 
> I think it does.
> 
> > Are you sure that the FPU is compatible ?
> 
> I think it is.
> 
> Certainly I have had no problems associated with running a buildroot
> generated i486 toolchain.

Ok, great.

> I think your problem may be the kernel config.  Can I suggest that you
> download the X-Linux sources from http://www.dmp.com.tw/tech/os-xlinux/ then
> use the kernel configuration for the vortex86dx as your kernel
> configuration?  X-Linux is currently stuck at 2.6.29.6 and I have had
> problems moving to more recent kernels (gdbserver no longer stopped at
> breakpoints, kernel panics at boot).  YMMV.  As X-Linux is provided by DM&P
> who make the vortex86dx I have taken the "safe" approach and stuck with
> 2.6.29.6 too and used their kernel configuration verbatim.  Please note: I
> am unclear what is in the eBOX 3100 and so what the differences between this
> and the VDX6354 are.  If the eBOX is actually a vortex86sx (no FPU) then I
> have also previously used the VSX6154 which contains the vortex86sx with
> buildroot using the X-Linux kernel configuration for vortex86sx.

You could probaby diff their 2.6.29.6 kernel with the official
2.6.29.6, and see what their changes were, port them over to a new
kernel release and even get them merged so that you can benefit from
newer kernel versions.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
