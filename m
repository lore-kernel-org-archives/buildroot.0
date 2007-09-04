From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 04 Sep 2007 19:42:44 +0200
Subject: [Buildroot] buggy Initramfs in linux
Message-ID: <1188927764.11158.5.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the initramfs support is not selected in the config system,
and the .config file copied into the linux directory
contains the initramfs info then the target/linux/Makefile.in
will not remove it, causing a failed build


target/linux/Makefile.in should remove:

CONFIG_INITRAMFS_SOURCE
INITRAMFS_ROOT_.ID
CONFIG_INITRAMFS_ROOT_UID=0
CONFIG_INITRAMFS_ROOT_GID=0

etc.
if initramfs is not selected in menuconfig.

-- 
Best Regards,
Ulf Samuelsson
