From: Pascal K <pascalkrauth@gmail.com>
Date: Tue, 23 May 2017 08:35:52 +0000
Subject: [Buildroot] Building Network Manager fails at configure due to uuid
 package requirements error
Message-ID: <CADj18OV=YojdFc_mYeHjf0zuQzec3e=ivO=B78=m9T1NVqeEnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

I use buildroot-2016-08 with a out-of-tree out of source build environment
structure.
I tried to build the network-manager package (i think 1.0.14 and now I
switched to 1.4.2) both builds fail at configure due to the uuid Package
requirements.

So I would like to use the hint in the build process which points to set
the environment variables, but where do I set them for my type of build
(and where to point them to)?
Why does this error even appear (the libuuid is configured)?

Here some console output:
$make
...
build/buildroot-config/conf --silentoldconfig Config.in
>>> network-manager 1.4.2 Configuring
...
checking for LIBNL... yes
checking for UUID... no
configure: error: Package requirements (uuid) were not met:

Package uuid was not found in the pkg-config search path.
Perhaps you should add the directory containing `uuid.pc'
to the PKG_CONFIG_PATH environment variable
Package 'uuid', required by 'world', not found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables UUID_CFLAGS
and UUID_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

Parts of my config, which I thought should do the trick with the uuid:
BR2_PACKAGE_UTIL_LINUX=y
BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y
# BR2_PACKAGE_UTIL_LINUX_LIBMOUNT is not set
# BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS is not set
BR2_PACKAGE_UTIL_LINUX_LIBUUID=y

Best regards,
Pascal
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170523/3fb5fd65/attachment.html>
