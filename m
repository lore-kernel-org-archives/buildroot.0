From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 27 Jun 2014 11:37:30 +0100
Subject: [Buildroot] How to control kernel header version?
Message-ID: <CAHvj1qaaXv6dGD6do7oED=uNKMpwZMFwOOdyjhGHC0J8KxykiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I wanted to ask how I can control kernel header version? I've tried various
configs but so far I can't prevent buildroot using the latest "stable"
version of kernel headers.


My kernel config is:

# Kernel headers
#BR2_LINUX_KERNEL_SAME_AS_HEADERS=y

# Kernel
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_VERSION="master"
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/torvalds/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3493860c76eb4e5b222f1016d1458615afac9fc4"
BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
BR2_LINUX_KERNEL_APPENDED_UIMAGE=n
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_APPENDED_DTB=n
BR2_LINUX_KERNEL_USE_INTREE_DTS=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-pcduino3.dts"


I think the current master is 3.16.0-rc3 .... but I keep seeing buildroot
downloading linux-headers-3.15.1 (current stable)

Is there a way to force using the headers from the the same source as
"KERNEL_CUSTOM_REPO" ?



Thanks
Bruce
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140627/940b8c2b/attachment.html>
