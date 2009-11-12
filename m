From: Gordon Smith <spider.karma+busybox.net@gmail.com>
Date: Wed, 11 Nov 2009 17:23:46 -0700
Subject: [Buildroot] Advice needed on package/customize
Message-ID: <2df568dc0911111623q6581f6d2ye2ef6416e79acd81@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello -

I've recently used package/customize to successfully overlay files
into an initramfs kernel image.
However, for two from-scratch buildroot builds in a row,
package/customize has copied ZERO files to the kernel image.

A simple case:

In .config:
    BR2_PACKAGE_CUSTOMIZE=y

In package/customize/source:
    $ ls -lA package/customize/source
    total 4
    -rw-r--r-- 1 gsmith gsmith 0 2009-09-01 02:44 .empty
    -rw-r--r-- 1 gsmith gsmith 7 2009-11-11 16:57 hello.txt

After "make", there is no hello.txt in the kernel image or in
rootfs.i686.initramfs_list.

buildroot version is 2009.08

I'm fairly new to buildroot so any suggestions are welcome.
Thanks
