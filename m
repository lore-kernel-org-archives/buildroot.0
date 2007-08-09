From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 09 Aug 2007 22:13:13 +0300
Subject: [Buildroot] at91rm9200df/busybox-1.6.1.config: No such file or
	directory
Message-ID: <46BB6749.3020301@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Ulf, possibly for your attention:
busybox-1.6.1.config missing when trying to build for at91rm9200df:

bzcat /downloads/busybox-1.6.1.tar.bz2 | tar -C /root/buildroot/project_build_arm/uclibc   -xf -
tar: Read 5632 bytes from -
# Allow busybox patches.
toolchain/patch-kernel.sh /root/buildroot/project_build_arm/uclibc/busybox-1.6.1 package/busybox busybox-1.6.1-\*.patch
touch /root/buildroot/project_build_arm/uclibc/busybox-1.6.1/.unpacked
cp -f  target/device/Atmel/at91rm9200df/busybox-1.6.1.config /root/buildroot/project_build_arm/uclibc/busybox-1.6.1/.config
cp: cannot stat `target/device/Atmel/at91rm9200df/busybox-1.6.1.config': No such file or directory
make: *** [/root/buildroot/project_build_arm/uclibc/busybox-1.6.1/.configured] Error 1

The patch in the attachment fixes the problem.

Best regards,
Ivan


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: patch.diff
Url: http://busybox.net/lists/buildroot/attachments/20070809/c4788e73/attachment-0001.diff 
