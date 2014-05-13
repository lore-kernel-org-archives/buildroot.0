From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 13 May 2014 22:35:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-12
References: <20140513063008.8B2BB100F96@stock.ovh.net>
 <20140513102429.2a1ff222@free-electrons.com>
 <a15a4bx642.ln2@ID-313208.user.individual.net>
Message-ID: <aaca4bxrjh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <berndkuhls@hotmail.com> wrote in
news:a15a4bx642.ln2 at ID-313208.user.individual.net: 

> Depending on the value of BR2_PACKAGE_XORG7 either libGAL-fb.so or
> libGAL- x11.so is linked to libGAL.so, see gpu-viv-bin-mx6q.mk.

Hi,

now I could reproduce the pango build error.

During "make" all libGAL.so links pointed at libGAL-fb.so on 8:04pm this 
evening, target/usr/lib/libGAL.so still points to this file.

The link host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libGAL.so was 
changed to libGAL-x11.so on 9:37pm by netsnmp calling ldconfig:

[...]
installing libnetsnmp.la in /home/fli4l/br2/output/host/usr/arm-buildroot-
linux-gnueabi/sysroot/usr/lib
ldconfig: /home/fli4l/br2/output/host/usr/arm-buildroot-linux-
gnueabi/sysroot/usr/lib/libOpenVG.so is not a symbolic link
[...]

The problem is fixed by http://patchwork.ozlabs.org/patch/348518/

Regards, Bernd
