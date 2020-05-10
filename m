From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 10 May 2020 16:14:23 -0500
Subject: [Buildroot] [PATCH] package/uboot-tools: add option to build
 env bin
In-Reply-To: <20200509115637.58834f1e@windsurf.home>
References: <20200508181304.52228-1-matthew.weber@rockwellcollins.com>
 <20200509115637.58834f1e@windsurf.home>
Message-ID: <CANQCQpbw4t_T95n8ppHAYczP38i5VGS9FG8x6nj4hxi2SkaKrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Sat, May 9, 2020 at 4:58 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Matt,
>
> On Fri,  8 May 2020 13:13:04 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > Add an option to allow the creation of a u-boot environment binary
> > from a set of provided source file(s) when the defconfig being built
> > does not offer the option via the u-boot package.
>
> I don't understand why we need this, when we already have
> BR2_TARGET_UBOOT_ENVIMAGE and related options in U-Boot.
>
> I don't see how the logic behind BR2_TARGET_UBOOT_ENVIMAGE depends on
> the defconfig being built.

The use case is when a defconfig doesn't select the u-boot package
(thus there isn't any uboot cfg / source code and the
BR2_TARGET_UBOOT_ENVIMAGE's dependencies on a uboot package build
isn't met to allow creating the env file).   Maybe we should move the
creation of this env file (BR2_TARGET_UBOOT_ENVIMAGE) to uboot-tools
by default and when the uboot package is also built, evaluate if the
source files list is empty to generate a image from the uboot
package's compiled-in env defaults (ie. uses the uboot's
scripts/get_default_envs.sh).

Matt
