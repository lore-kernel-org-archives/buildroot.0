From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 11 Mar 2013 03:24:44 +0000 (UTC)
Subject: [Buildroot] [Bug 6080] Git fetch caching
In-Reply-To: <bug-6080-163@https.bugs.busybox.net/>
References: <bug-6080-163@https.bugs.busybox.net/>
Message-ID: <20130311032444.BAF3E9AFA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6080

--- Comment #2 from Andrew Cooks <acooks@gmail.com> 2013-03-11 03:25:27 UTC ---
OVERRIDE_SRCDIR is not sufficiently described in the manual, but I found a
description at http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf

It helps, but it's not exactly what I was looking for.

Consider this section from my config file:
--
#
# Kernel
#
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_3_6 is not set
# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="/home/andrew/devel/lk.git"
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="dma_maps-20130306"
BR2_LINUX_KERNEL_VERSION="dma_maps-20130306"
BR2_LINUX_KERNEL_PATCH=""
# BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/andrew/devel/lk.git/.config_mod_ahci"
BR2_LINUX_KERNEL_BZIMAGE=y
# BR2_LINUX_KERNEL_VMLINUX is not set
# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
# BR2_LINUX_KERNEL_DTS_SUPPORT is not set
# BR2_LINUX_KERNEL_INSTALL_TARGET is not set
--

It isn't clear to me whether using a local path for the CUSTOM_GIT_REPO_URL is
a recognised and valid use case. It works, but with nasty caching.

If you accept that it is a valid use case, I think it would be sensible to
detect the local path and use rsync without creating a tarball, similar to
'SITE METHOD = local'.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
