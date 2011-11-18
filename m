From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Nov 2011 19:20:27 +0100
Subject: [Buildroot] [PATCH] Add Armadeus systems APF9328 support.
In-Reply-To: <4EC690A5.301@free.fr> (Julien Boibessot's message of "Fri, 18
 Nov 2011 18:06:45 +0100")
References: <1321525301-13110-1-git-send-email-julien.boibessot@free.fr>
 <20111117205745.00cfdac6@skate> <4EC690A5.301@free.fr>
Message-ID: <87sjlls36c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Boibessot <julien.boibessot@free.fr> writes:

Hi,

 >> Since two kernel patches are needed, you should have a defconfig that
 >> explicitly tells which kernel version it wants:
 >> 
 >> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 >> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1"

 Julien> ok but if I set BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1.1",
 Julien> it is not saved by "make savedefconfig". Seems like there is a
 Julien> "bug" in BR when custom kernel version == default one

Well, it's how savedefconfig behaves in the kernel. Just edit the file
manually afterwards - That way it will still work when we change the
default kernel version to be 3.2.

-- 
Bye, Peter Korsgaard
