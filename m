From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 22:32:39 +0200
Subject: [Buildroot] [PATCH 1/1] configs/nanopi_r1: new defconfig
In-Reply-To: <20191027195046.13111-1-zinosat@gmail.com>
References: <20191027195046.13111-1-zinosat@gmail.com>
Message-ID: <20200413223239.3b5caa0f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Davide,

I have finally applied your patch, but I have a number of
comments/questions.

On Sun, 27 Oct 2019 20:50:46 +0100
Davide Viti <zinosat@gmail.com> wrote:

> Add initial support for Nanopi R1 board with below features:
> 
>   - U-Boot 2019.01
>   - Linux 5.0
>   - Default packages from buildroot
> 
> Configuration files taken from Armbian:
> 
>   https://github.com/armbian/build/blob/master/patch
> 
> Signed-off-by: Davide Viti <zinosat@gmail.com>

First of all, is this your new e-mail? Our DEVELOPERS file still has:

	Davide Viti <zinosat@tiscali.it>

if your e-mail has changed, could you send a patch to update our
DEVELOPERS file ?

>  board/friendlyarm/nanopi-r1/boot.cmd          |   8 +
>  board/friendlyarm/nanopi-r1/genimage.cfg      |  36 ++++
>  .../nanopi-r1/kernel/linux-extras.config      |   2 +
>  .../nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts   | 170 ++++++++++++++++++
>  .../friendlyarm/nanopi-r1/nanopi_r1_defconfig |  22 +++
>  board/friendlyarm/nanopi-r1/readme.txt        |  29 +++
>  .../nanopi-r1/sun8i-h3-nanopi-r1.dts          | 102 +++++++++++
>  configs/nanopi_r1_defconfig                   |  49 +++++
>  8 files changed, 418 insertions(+)

You forgot to update the DEVELOPERS file and the .gitlab-ci.yml file,
so I've done that as part of applying your patch.

>  create mode 100644 board/friendlyarm/nanopi-r1/boot.cmd
>  create mode 100644 board/friendlyarm/nanopi-r1/genimage.cfg
>  create mode 100644 board/friendlyarm/nanopi-r1/kernel/linux-extras.config
>  create mode 100644 board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts

These two files were nicely under a kernel/ subdirectory.

>  create mode 100644 board/friendlyarm/nanopi-r1/nanopi_r1_defconfig

But this one.

>  create mode 100644 board/friendlyarm/nanopi-r1/readme.txt
>  create mode 100644 board/friendlyarm/nanopi-r1/sun8i-h3-nanopi-r1.dts

And this one, which are U-Boot specific were not in a uboot/
sub-directory, so I moved them into a uboot/ sub-directory, and
adjusted the defconfig accordingly.

Another question is: your defconfig was done at the time of Linux 5.0
and U-Boot 2019.01, but it seems like support for this board has still
not made its way to the upstream Linux kernel and upstream U-Boot. Why
so? Could you work with FriendlyArm, or yourself submit support for
this board to upstream Linux and U-Boot, so that ultimately, we can
drop the .dts files from Buildroot ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
