From: =?UTF-8?B?0JLQu9Cw0LQg0JrQsNGA0LXQu9C40L0=?= <karelinvld@gmail.com>
Date: Wed, 31 Mar 2021 17:01:41 +0300
Subject: [Buildroot] Problems with integration of package
Message-ID: <CAMwF3yws+TqD31uXGrFEvWUWmX02rQchksaUqmHhfv6qk0-QKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I try to integrate a package openscada, but have some problems with
installing it.

I wrote Config.in and .mk file in dir package. Build is OK. But when
package begins to install I had next error.

/usr/bin/mkdir -p
'/home/vlad/work/stm/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib'
 /bin/bash ../libtool   --mode=install /usr/bin/install -c   liboscada.la
'/home/vlad/work/stm/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib'
 /usr/bin/mkdir -p
'/home/vlad/work/stm/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/openscada'
fopen: No such file or directory

I undestand, that problem is with paths.

I tried to add next lines to .mk

OPENSCADA_INSTALL_STAGING = YES
OPENSCADA_INSTALL_TARGET  = YES
 OPENSCADA_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR)
 OPENSCADA_INSTALL_TARGET_OPTS  = DESTDIR=$(TARGET_DIR)

After that, make package is OK. But I don't see binary in target/usr/bin
directory and libtool doing nothing.

The build system of package is autotools.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210331/f6d46be7/attachment.html>
