From: Graham <gnewton@peavey-eu.com>
Date: Thu, 12 Apr 2012 12:33:43 +0000 (UTC)
Subject: [Buildroot] Using Kernel git tree tries to extract non extractable
	file
Message-ID: <loom.20120412T112933-744@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is probably a newbie question.  However I would like some guidance.
I would like to use the new feature of being able to download the kernel source 
from a git repository.
We have our own local git repository for our kernel sources.
Running make downloads the source fine but then what appears to happen is the 
source is somehow renamed as a tar.gz file on which extraction is attempted and 
fails. This is supposition as the git source tree disappears from the dl 
directory and a very short .tar.gz appears. 

I would have thought that as git provides a source tree "as is" there is no need 
to uncompress.
I have provided the output, contents of dl directory and a portion of the 
.config file below. (Removed ">>>" so as not to be accused of top posting!)
Thanks
Graham

Output :
linux 2.6.34 Downloading
Initialized empty Git repository in /home/gnewton/buildroot-2012.02/dl/linux-
2.6.34/
remote: Counting objects: 1901116, done.
remote: Compressing objects: 100% (315962/315962), done.
remote: Total 1901116 (delta 1568013), reused 1900830 (delta 1567732)
Receiving objects: 100% (1901116/1901116), 443.51 MiB | 19.29 MiB/s, done.
Resolving deltas: 100% (1568013/1568013), done.
fatal: Not a valid object name
linux 2.6.34 Extracting
gzip -d -c /home/gnewton/buildroot-2012.02/dl/linux-2.6.34.tar.gz | tar --strip-
components=1 -C /home/gnewton/buildroot-2012.02/output/build/linux-2.6.34  -xf -
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
make: *** [/home/gnewton/buildroot-2012.02/output/build/linux-
2.6.34/.stamp_extracted] Error 2
gnewton at EY-UBDx86-WS02:~/buildroot-2012.02$ 

dl directory contents:

gnewton at EY-UBDx86-WS02:~/buildroot-2012.02$ ls -l dl
total 33116
-rw-r--r-- 1 gnewton gnewton  7009201 2011-02-13 20:50 bash-4.2.tar.gz
-rw-r--r-- 1 gnewton gnewton  2167516 2012-02-04 19:37 busybox-1.19.4.tar.bz2
-rw-r--r-- 1 gnewton gnewton   395829 2009-11-23 08:05 fakeroot_1.9.5.tar.gz
-rw-r--r-- 1 gnewton gnewton 20614020 2012-01-24 10:06 gdb-7.4.tar.bz2
-rw-r--r-- 1 gnewton gnewton  1073084 2011-11-16 13:21 grep-2.10.tar.xz
-rw-r--r-- 1 gnewton gnewton       20 2012-04-12 13:24 linux-2.6.34.tar.gz
-rw-r--r-- 1 gnewton gnewton  2445052 2008-11-03 01:11 ncurses-5.7.tar.gz
-rw-r--r-- 1 gnewton gnewton    56473 2009-01-16 12:31 netkit-base-0.17.tar.gz
-rw-r--r-- 1 gnewton gnewton   133749 2009-01-16 12:31 netkit-telnet-0.17.tar.gz


.config contents:

#
# Kernel
#
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_3_2 is not set
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="gitolite at ey-ubsx64-svr02:LinuxKernel"
BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="2.6.34"
BR2_LINUX_KERNEL_VERSION="2.6.34"
BR2_LINUX_KERNEL_PATCH=""
BR2_LINUX_KERNEL_USE_DEFCONFIG=y
# BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG is not set
BR2_LINUX_KERNEL_DEFCONFIG="ti8168_evm"
BR2_LINUX_KERNEL_UIMAGE=y
# BR2_LINUX_KERNEL_ZIMAGE is not set
# BR2_LINUX_KERNEL_VMLINUX is not set
# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
BR2_LINUX_KERNEL_INSTALL_TARGET=y
