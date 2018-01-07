From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 20:41:38 +0100
Subject: [Buildroot] [PATCH v2 15/15] configs: nitrogen*: bump u-boot
 version to 2017.07
In-Reply-To: <CAAMH-yv1gsYbyvsfMSBWTytEeGCL39Wvjs76Xq1PZGvGk8wGBA@mail.gmail.com>
References: <20180105143947.26934-1-gary.bisson@boundarydevices.com>
 <20180105143947.26934-16-gary.bisson@boundarydevices.com>
 <20180107155519.33de28e7@windsurf>
 <CAAMH-yv1gsYbyvsfMSBWTytEeGCL39Wvjs76Xq1PZGvGk8wGBA@mail.gmail.com>
Message-ID: <20180107204138.698cd177@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Jan 2018 20:07:24 +0100, Gary Bisson wrote:

> I understand although as it is said in the commit log, the previous
> scripts will be removed in a future release.

OK.

> As for where those scripts are located, we actually have them in our
> U-Boot repo now:
> https://github.com/boundarydevices/u-boot-imx6/tree/boundary-v2017.07/board/boundary/bootscripts
> 
> That is how it is used in Yocto. I don't mind using it from U-Boot
> directly, but what's the best way to do so? Is there a bootloader
> equivalent to LINUX_DIR so I can easily point to the bootloader
> source?

Well LINUX_DIR is a standard package variable. So for every package
<pkg>_DIR exists and points to its source directory :)

> Also, would you guys be ok with a
> BR2_TARGET_UBOOT_BOOT_SCRIPT_INSTALL_TARGET option? That would reduce
> the post-build script for several configs which copies it manually to
> TARGET_DIR/boot/ right now.

I'm not sure what would be the benefit here. You see to propose to
replace one post-build script by one post-uboot-install-script. What's
the benefit?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
