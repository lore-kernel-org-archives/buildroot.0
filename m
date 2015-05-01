From: Carlos Soto <csotoalonso@gmail.com>
Date: Fri, 1 May 2015 22:41:19 +0200
Subject: [Buildroot] Libtool problem building mesa3d-demos
Message-ID: <CAD7j7Q96pGF1qedawQw4-FHSyC15EyXH1DBu=MNkvFQg_Ys-dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm using buildroot to create a rootfs for iMX6-quad. I'm using an external
toolchain created with crosstool-ng (arm-cortexa9_neon-linux-gnueabihf).
When building mesa3d-demos, there is an error creating libutil.la:

libtool:   error:
'/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf/lib/gcc/arm-cortexa9_neon-linux-gnueabihf/4.9.1/../../../../arm-cortexa9_neon-linux-gnueabihf/lib/libstdc++.la'
is not a valid libtool archive

Of corse, this path is not right, it seems to be joining two different
paths.

I've tracked the source of the problem, and it seems to be related with the
libtool used by buildroot. I've modified the resulting Makefiles to use the
host libtool, and the problem disappears:

LIBTOOL = $(SHELL) $(top_builddir)/libtool to
LIBTOOL = $(SHELL) /usr/bin/libtool

Any thoughts about what it's going wrong?

Regards,
Carlos
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150501/fa9acd1f/attachment.html>
