From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Aug 2010 11:29:15 +0200
Subject: [Buildroot] modprobe problem
In-Reply-To: <4C64FCF4.9090204@marretta.com>
References: <mailman.12480.1281652495.17863.buildroot@busybox.net>
	<4C64FCF4.9090204@marretta.com>
Message-ID: <20100813112915.3033de1f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Massimiliano,

On Fri, 13 Aug 2010 10:06:12 +0200
Massimiliano Marretta <max@marretta.com> wrote:

> I have the same problem if I compile buildroot whit internal
> toolchain, scratchbox external toolchain or crosstool-ng external
> toolchain:
> 
> for example (the problem occur whit all modules and different kernel
> version):
> 
> $ modprobe it87
> [    36.041863] hwmon_vid: no symbol version for module_layout
> modprobe: failed to load module hwmon_vid
> (/lib/modules/2.6.34.1-0.2-desktop/kernel/drivers/hwmon/hwmon-vid.ko):
> invalid module format
> 
> If I modify the makefile "Makefile.in.advanced" to compile modules
> and kernel at same time the problem is resolved.

Can you try with Buildroot 2010.08-rc1 ? I've completely rewritten the
kernel build process in Buildroot, and it might have fixed this problem.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
