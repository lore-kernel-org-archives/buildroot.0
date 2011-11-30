From: Adriano Campos <adrianoribeirocampos@gmail.com>
Date: Wed, 30 Nov 2011 10:36:27 +0000
Subject: [Buildroot] include the Xenomai in kernel linux
Message-ID: <CAOiFVFvG0FrhcgdYo9-16Pyy5D6a79bL5B2+QvvXPj86TXqb-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 28 Nov 2011 12:24:42 +0000,
Adriano Campos <adrianoribeirocampos@gmail.com> a ?crit :
Hi,
I have another question about buildroot and qemu. I try buildroor with
config file "qemu_arm_versatile_defconfig" and this work with QEMU
(emuling arm versatilepb), but config file "integrator926_defconfig"
dont work with QEMU (emuling arm integrator). Does this file is the
configuration for the card and not for the qemu virtual machine. Who
makes these files?Anyone can help me to create a configuration file
for "QEMU_integrator926_defconfig."
best regads
Adriano Campos


>  In the 2011-08 version of buildroot works correctly using the configuration
> file "buildroot-2011-08 \ config \ qemu_arm_versatile_defconfig" supplied
> with the buildroot. However I need to apply the patch and Xenomai is not
> possible in this version so I'm now using the buildroot version 2011-11-rc3,
> but is not working.

"is not working" is not precise enough to help you. Could you provide
some details ?

> With the same configuration file, the generated image does not run under
> QEMU. Can you help?

I'm not sure you realize that Xenomai is a patch against the kernel and
that this patch is therefore only available for *certain* kernel
versions. The kernel version used in qemu_arm_versatile_defconfig has
no Xenomai patch available. If you want to use Xenomai, you *have* to
use a kernel version that is explicitly supported by Xenomai, and the
version supported by Xenomai depend on the architecture.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
