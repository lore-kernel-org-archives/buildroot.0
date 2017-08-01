From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 1 Aug 2017 08:29:45 -0700
Subject: [Buildroot] Kernel with *AND* without initrd
Message-ID: <CAGt4E5scWEvH+k3OOA5QG9koLLc=9T9nfDkEYoC-gwK5s_y86w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Our home-grown rootfs build system (which we are looking to replace
with buildroot) has a feature that is quite helpful to developers: it
generates a kernel with embedded initrd and one without during the
same build process. (The rootfs is also generated in multiple
formats.)

It does the initrd/non-initrd build by building the initrd kernel,
then setting CONFIG_INITRAMFS_SOURCE="" and re-building the kernel.
This is very quick, since almost nothing has to actually be rebuilt.

There was a patch accepted into the Linux kernel a couple of months
ago to fix this build method after an unrelated commit broke it. The
commit message also explains a bit more about our build system.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57ddfdaa9a72fe726a44d26d99db31bc137dbeff

Is there a way to do something similar with buildroot? As far as I can
tell, it's very easy to generate the rootfs in multiple different
formats, but the kernel is built only once. If "initrd" is enabled, it
will have the RAM disk embedded. Otherwise it won't. And you can't get
the respective other one.

Did I miss anything? If not, is there a recommended way of adding this
functionality? I am sure other developers would find this interesting,
as well.

Thanks,
-Markus
