From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jun 2010 11:19:49 +0200
Subject: [Buildroot] Annoying... nothing work at all :-(
In-Reply-To: <1276398794.8108.31.camel@localhost>
References: <1276398794.8108.31.camel@localhost>
Message-ID: <20100613111949.358df33a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jun 2010 05:13:14 +0200
"sani.broyeur" <sani.broyeur@free.fr> wrote:

> - When invoking "make menuconfig && make" an ext2 image is created. OK
> but unbootable, without bootloader nor kernel.

We've made the choice by default to only build a toolchain + a simple
root filesystem image with only Busybox in it. So that's expected.

> - When asking to add a bootloader, grub doesn't install properly on
> target image, config is not done. This part is broken.

What do you expect exactly ? How would you want grub to be installed ?
If you're not more specific about what you expect, it's going to be
hard to help you.

(FYI: I'm currently doing a fairly big bootloader code cleanup, for
which I've sent a 49 patches patch set yesterday on this list. At least
with this patch set applied, Grub compiles properly. However, I'm not
sure what to do with the resulting binaries.)

> - When asking to add a CF/FAT16 bootloader, syslinux doesn't install
> at all on target image, this part is also broken since it does really
> nothing on the image :-)

What do you call "target image" ? The ext2 filesystem ? Then it is
expected that syslinux isn't installed *in* it. However, the syslinux
image is supposed to be available in output/images/.

But again, I know syslinux builds properly with my bootloaders-cleanup
branch applied. The bootloader code in Buildroot hasn't been
unmaintained for quite some time, so he doesn't surprise me that you
encounter issues.

Another thing is that Buildroot is used a lot for non-x86 architectures
(ARM, PowerPC, etc.), and for these architectures, the bootloader is
never *in* the root filesystem image. The fact the bootloader is *in*
the root filesystem image is a x86-specific thing, and as we haven't
had a lot of x86-related contributions lately, it may well be that
we're not doing what should be done for this specific architecture.

> - When asking a kernel, attempts lead often to cryptic make errors and
> the whole buildroot tree has to be recreated from .tar.gz without
> kernel generation. The "kernel" menu in menuconfig is broken, and no
> kernel config is invoked at build or within menuconfig.

Please provide detailed reproduction steps, because ? attemps lead
often to cryptic make errors ? is by no means an useful description of
what's happening.

FWIW :

 * I've built succesfully a kernel yesterday with Buildroot, both ARM
   and PowerPC.

 * I'm working on a big cleanup of the linux compilation code in
   Buildroot, because the current code is way too complicated.

> - When invoking linux26-menuconfig (I'v found that one time), either
> nothing, or make errors, this one is also broken.

Be more specific ?

> All produced forms of "target" are either incomplete, or unusable, or
> unbootable, when the commands are not ending with errors!

Be more specific ?

> Is there somewhere an USABLE documentation?

The only documentation we have so far is
http://buildroot.org/downloads/buildroot.html. Patches welcome.

> I'm not a newbie to linux, but this "buildroot project" seems for sure
> not usable before years of improvements...

We certainly have rough edges, particularly in the area of
bootloader/kernel compilation, which haven't seen any
cleanup/refactoring since a very, very long time.

I'm sorry, but your message is by no means useful :

 * You're not giving an appropriate level of precision that would give
   us the opportunity to understand and solve the problems you're
   facing. For each problem: the .config file that allows to produce
   the issue, the behaviour that you see, and the behaviour that you
   would expect Buildroot to have.

 * You're insulting the work done by the developers on the Buildroot
   project, reducing their incentive to help you and to solve your
   problems.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
