From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sun, 7 Jan 2018 20:07:24 +0100
Subject: [Buildroot] [PATCH v2 15/15] configs: nitrogen*: bump u-boot
 version to 2017.07
In-Reply-To: <20180107155519.33de28e7@windsurf>
References: <20180105143947.26934-1-gary.bisson@boundarydevices.com>
 <20180105143947.26934-16-gary.bisson@boundarydevices.com>
 <20180107155519.33de28e7@windsurf>
Message-ID: <CAAMH-yv1gsYbyvsfMSBWTytEeGCL39Wvjs76Xq1PZGvGk8wGBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jan 7, 2018 at 3:55 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Fri,  5 Jan 2018 15:39:47 +0100, Gary Bisson wrote:
>
> >  board/boundarydevices/common/boot.cmd      | 155 +++++++++++++++++++++++++++++
> >  board/boundarydevices/common/post-build.sh |   7 +-
> >  board/boundarydevices/common/upgrade.cmd   | 154 ++++++++++++++++++++++++++++
>
> Note: I start to find it annoying that we have 300+ lines of U-Boot
> script code specific to the Boundary Devices board. I assume this stuff
> is also duplicated in Yocto ? Shouldn't this be added to some common
> repository ?

I understand although as it is said in the commit log, the previous
scripts will be removed in a future release.

As for where those scripts are located, we actually have them in our
U-Boot repo now:
https://github.com/boundarydevices/u-boot-imx6/tree/boundary-v2017.07/board/boundary/bootscripts

That is how it is used in Yocto. I don't mind using it from U-Boot
directly, but what's the best way to do so? Is there a bootloader
equivalent to LINUX_DIR so I can easily point to the bootloader
source?

Also, would you guys be ok with a
BR2_TARGET_UBOOT_BOOT_SCRIPT_INSTALL_TARGET option? That would reduce
the post-build script for several configs which copies it manually to
TARGET_DIR/boot/ right now.

Regards,
Gary
