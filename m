From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 18 Mar 2019 19:11:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/skeleton-init-common: Create
 /lib/modules directory
In-Reply-To: <20190318174436.GI14237@scaer>
References: <20190318163010.8056-1-norbert.lange@andritz.com>
 <20190318174436.GI14237@scaer>
Message-ID: <CADYdroMoAzR6=nniTiBZvvs2fkwJJ7hGM-rd2OixxA6FpjRj7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 18. M?rz 2019 um 18:44 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> On 2019-03-18 17:30 +0100, Norbert Lange spake thusly:
> > For read-only root file systems, the kernel-modules
> > will be mounted over this directory.
>
> This does not mean anything.
>
> Either you build your kernel with Buildroot, and the kernel does the
> installation of modules in /lib/modules, and thus you do not need to
> create it, or you build your kernel outside of Buildroot and you install
> the modules at build time in there.
>
> So, having a read-only filesystem is of no consequence here.
>
> Also, I don;t see how "the kernel-modules will be mounted over this
> directory", which imply this is done at runtime. If your system uses
> special means to store the kernel modules, then it's your duty to
> provide it on your own, like as an overlay (or a specific package) that
> install those files/direcoties.

If you prepare a kernel with an builtin initramfs containing
the modules and an initscript to mount those over /lib/modules,
then you wont have to touch the root fs.
(can be replaced independently of each other).

>
> > This directory should always exist for this reason,
>
> This is wrong: one can have a no-module kernel, in which case
> /lib/modules is useless.

One could also have nothing to use with  /mnt, /media and /opt.

> > just as /mnt and /opt are in the skeleton.
>
> Those are madanted by the FHS [0].

Ok, if I red that right, then /boot and /srv would be required/mandated aswell?

I guess I wont get the change up-streamed, and thats fine (minor annoyance
that I cant use verbatim buildroot's with such kernels). But this seems
to be pretty arbitrary given that buildroot seems rather lenient
otherwise (for good reasons).

Norbert.
