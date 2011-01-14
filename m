From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 09:07:52 +0100
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
Message-ID: <20110114090752.5f01ade5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kyle,

On Thu, 13 Jan 2011 13:29:42 -0800
Kyle Hayes <kyle@greenmonitor.com> wrote:

> I am getting a seg fault when ssh-keygen tries to run and when sshd
> tries to start.  Here is my set up:
> 
> Buildroot: GIT checkout from 1/11/11
> Kernel: 2.6.37
> Initrd type: CPIO/gzip
> 
> machine: DMP eBox 3100 (PC-compatible x86 machine w/256MB of RAM)
> 
> I've got extlinux installed, the kernel boots fine and I get a login
> prompt.  However, I see errors that ssh-keygen and sshd are seg
> faulting.
> 
> I would appreciate any tips on how to debug/fix this.  Buildroot is
> exactly the system I was looking for.

Hard to say since we can't reproduce without having the hardware. I
suspect that on a "normal" x86 CPU, sshd and ssh-keygen are working
fine.

So the best you could do is use gdbserver on the target and a
cross-gdb (both can be built by Buildroot) and start ssh-keygen without
gdbserver in order to find the location of the segfault in ssh-keygen.
That would really in understanding the issue.

Are you sure that the Vortex 86DX supports all instructions of i486 ?
Are you sure that the FPU is compatible ? The documentation of the
Vortex 86DX states that it has a FPU, but I don't know if it's the same
as the one in normal x86 CPUs. Maybe you could try to build Buildroot
with BR2_SOFT_FLOAT=y (config options: "Use software floating point by
default").

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
