From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 24 Aug 2017 20:47:39 +0800
Subject: [Buildroot] simicsfs 1.18 does not build with kernel 4.12.2
Message-ID: <CAEUhbmWTZY-zU6c_yEFpp+HR2xuGj5FiZjGVDumSrAuAg+kG5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using buildroot 2017.08-rc3 to build a rootfs for minnowboard
max. What I did is:

$ make minnowboard_max_defconfig
$ make menuconfig

Select "Target packages" -> "File system and flash utilities" -> simicsfs

$ make

The error message is:

buildroot/output/build/simicsfs-1.18/./hostfs_file.c:67:43: error:
?struct file? has no member named ?f_dentry?; did you mean ?f_owner??
  DPRINT1("hostfs: hostfs_read %ld\n", file->f_dentry->d_inode->i_ino);

buildroot/output/build/simicsfs-1.18/./hostfs_file.c:151:2: error:
unknown field ?aio_read? specified in initializer
  .aio_read = hostfs_aio_read,

buildroot/output/build/simicsfs-1.18/./hostfs_file.c:152:2: error:
unknown field ?aio_write? specified in initializer
  .aio_write = hostfs_aio_write,

buildroot/output/build/simicsfs-1.18/./hostfs_inode.c:174:10: error:
implicit declaration of function ?inode_change_ok?
[-Werror=implicit-function-declaration]
  error = inode_change_ok(inode, iattr);

buildroot/output/build/simicsfs-1.18/./hostfs_inode.c:248:25: error:
?PAGE_CACHE_SHIFT? undeclared (first use in this function)
  pgoff_t index = pos >> PAGE_CACHE_SHIFT;

<snip>

Although the README in the simicsfs 1.18 package says: Linux kernel
2.6.12 and later only. I believe this package does not build for
latest kernel like v4.12.2.

Regards,
Bin
