From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 30 Aug 2013 13:49:08 +0200
Subject: [Buildroot] make uclibc-menuconfig fails when running for the first
	time if the ccache is enabled.
Message-ID: <8F9480037AD0403582DFEFB03EAE30DC@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
 Hi

make distclean
make anything_defconfig

make uclibc-menuconfig
Fails if the ccache is enabled in the config file.

  MKDIR include/config
make[2]: /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc: Command not found
make[2]: /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc: Command not found
make[2]: /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc: Command not found
  HOSTCC-o extra/config/conf.o
/bin/sh: /home/buildroot12git/output/host/usr/bin/ccache: No such file or directory
make[2]: *** [../../extra/config/conf.o] Error 127
make[1]: *** [extra/config/conf] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/build/uclibc-0.9.33.2'
make: *** [/home/buildroot12git/output/build/uclibc-0.9.33.2/.stamp_patched] Error 2




Sagaert Johan
