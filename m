From: don <don_reid@comcast.net>
Date: Sun, 25 Feb 2007 13:14:13 -0800
Subject: [Buildroot] Linux version or Variable conflict.
Message-ID: <20070225211413.GA5886@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a new directory with the latest svn files (At revision 17976).

There seems to be some confict with the Linux version or with variable
names.

The file toolchain/kernel-headers/kernel-headers-new.mk wants 2.6.12,
and target/device/Via/epia-mii/linux.mk wants 2.6.11.5.

Also the file target/linux26.mk has

	LINUX_DIR=$(LINUX26_DIR)

I am getting this result from the make target "linux" which is in
target/device/Via/epia-mii/linux.mk.


******************************************************************************
wget --passive-ftp -P /home/don/Robots/Bot1/EPIA/buildroot/dl
http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.11.5.tar.bz2
--11:30:32--
http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.11.5.tar.bz2
           =>
`/home/don/Robots/Bot1/EPIA/buildroot/dl/linux-2.6.11.5.tar.bz2'
Resolving www.kernel.org... 204.152.191.37, 204.152.191.5
Connecting to www.kernel.org|204.152.191.37|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 37,088,482 (35M) [application/x-bzip2]

100%[====================================>] 37,088,482   754.57K/s
ETA 00:00

11:31:12 (926.65 KB/s) -
`/home/don/Robots/Bot1/EPIA/buildroot/dl/linux-2.6.11.5.tar.bz2' saved
[37088482/37088482]

mkdir -p /home/don/Robots/Bot1/EPIA/buildroot/toolchain_build_i486
(cd /home/don/Robots/Bot1/EPIA/buildroot/toolchain_build_i486; ln -sf
/home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.12 linux)
bzcat /home/don/Robots/Bot1/EPIA/buildroot/dl/linux-2.6.11.5.tar.bz2 |
tar -C /home/don/Robots/Bot1/EPIA/buildroot/build_i486   -xf -
mkdir -p package/linux/kernel-patches
toolchain/patch-kernel.sh
/home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.12
package/linux/kernel-patches
Aborting.
'/home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.12' is not a
directory.
make: ***
[/home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.11.5/.unpacked]
Error 1
******************************************************************************

-- 
Don
