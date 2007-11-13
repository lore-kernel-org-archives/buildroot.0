From: Ed Stafford <ed.stafford@gmail.com>
Date: Tue, 13 Nov 2007 16:02:09 -0600
Subject: [Buildroot] Buildroot fails to build
Message-ID: <41370a610711131402y3fe24e85we6c6fd9bafba3897@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been trying for a while now to get buildroot to actually build on
2 different systems.  The first is a SunBlade 100 (sparc64) with an
i686 cross-compiler.  The second is a Pentium-D system.  The buildroot
I'm trying to create is for an i386/Geode system..  No matter how I
try, though, it does not build successfully.  I've been using the
daily snapshots and here's the error I'm getting on both machines (for
about the last month's worth of snapshots):


Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
LD_LIBRARY_PATH sane:                           Ok
which installed:                                Ok
sed works:                                      Ok (/usr/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/local/bin/gcc'
C compiler version '4.2.1':                     Ok
C++ compiler '/usr/local/bin/g++'
C++ compiler version '4.2.1':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/estaffor/buildroot/project_build_/uclibc/buildroot-config
mkdir -p /home/estaffor/buildroot/project_build_/uclibc
cp -dpRf package/config/buildroot-config
/home/estaffor/buildroot/project_build_/uclibc/buildroot-config
mkdir -p /home/estaffor/buildroot/project_build_/uclibc/root/etc
echo "" > /home/estaffor/buildroot/project_build_/uclibc/root/etc/issue
echo "" >> /home/estaffor/buildroot/project_build_/uclibc/root/etc/issue
echo "AZ Linux" >> /home/estaffor/buildroot/project_build_/uclibc/root/etc/issue
mkdir -p /home/estaffor/buildroot/project_build_/uclibc/root/etc
echo "uclibc" > /home/estaffor/buildroot/project_build_/uclibc/root/etc/hostname
wget --passive-ftp  -P /home/estaffor/buildroot/dl
http://www.kernel.org/pub/linux/kernel/v2.6//linux-2.6.22.10.tar.bz2
--15:13:04--  http://www.kernel.org/pub/linux/kernel/v2.6//linux-2.6.22.10.tar.bz2
           => `/home/estaffor/buildroot/dl/linux-2.6.22.10.tar.bz2'
Resolving proxy.autozone.com... 192.168.2.12
Connecting to proxy.autozone.com|192.168.2.12|:8080... connected.
Proxy request sent, awaiting response... 200 OK
Length: 45,099,502 (43M) [application/x-bzip2]

100%[=================================================================================>]
45,099,502   582.03K/s    ETA 00:00

15:14:06 (723.68 KB/s) -
`/home/estaffor/buildroot/dl/linux-2.6.22.10.tar.bz2' saved
[45099502/45099502]

*** Using kernel-headers generated from kernel source
rm -rf /home/estaffor/buildroot/toolchain_build_/linux
[ -d /home/estaffor/buildroot/toolchain_build_ ] || /usr/bin/install
-d /home/estaffor/buildroot/toolchain_build_
bzcat /home/estaffor/buildroot/dl/linux-2.6.22.10.tar.bz2 | tar -C
/home/estaffor/buildroot/toolchain_build_   -xf -
touch /home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10/.unpacked
toolchain/patch-kernel.sh
/home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10
toolchain/kernel-headers \
                linux-2.6.22.10-\*.patch{,.gz,.bz2}
touch /home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10/.patched
(cd /home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10; \
         /usr/bin/make -j1 ARCH= \
                HOSTCC="/usr/local/bin/gcc" HOSTCFLAGS="" \
                HOSTCXX="/usr/local/bin/g++" \

INSTALL_HDR_PATH=/home/estaffor/buildroot/toolchain_build_/linux
headers_install; \
        )
make[1]: Entering directory
`/home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10'
Makefile:491: /home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10/arch//Makefile:
No such file or directory
make[1]: *** No rule to make target
`/home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10/arch//Makefile'.
 Stop.
make[1]: Leaving directory
`/home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10'
make: *** [/home/estaffor/buildroot/toolchain_build_/linux/.configured] Error 2

Let me know if you guys have any ideas.. I'm kinda stumped.
