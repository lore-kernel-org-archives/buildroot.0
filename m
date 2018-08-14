From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 14 Aug 2018 10:39:01 +0100
Subject: [Buildroot] Setting Defaults for RISCV64 Architecture
Message-ID: <862bfe2f-fc60-ead9-2b63-b6a0f23c59cd@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I am working on adding RISCV64 support to Buildroot and was wondering
how best to set some of the defaults when the riscv64 architecture is
selected.

The two issues that I currently have are that the version of binutils
needs to be 2.30 (or greater) and that the kernel needs to be a custom
version from the riscv git repo (the 4.17 mainline kernel doesn't appear
to have full riscv support).

In both of these cases I could either:

a) Add some architecture specific options to the 'Config.in' files, i.e.
packages/binutils/Config.in.host and linux/Config.in, to select the
appropriate default versions/values .
or
b)? Set the appropriate variables in a board or architecture specific
'_defconfig' file, e.g.
??? ??? BR2_BINUTILS_VERSION_2_30_X=y
??? ??? BR2_LINUX_KERNEL=y
??? ??? BR2_LINUX_KERNEL_CUSTOM_GIT=y
??? ???
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
??? ??? BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="riscv-linux-4.15"

I think that I prefer option a) as option b) would require a specific
config to be selected every time rather than just working by default
when you set the Target Architecture.

Any thoughts or comments regarding the most appropriate approach would
be much appreciated.

Many thanks

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pEpkey.asc
Type: application/pgp-keys
Size: 3139 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180814/c3d35b4b/attachment.key>
