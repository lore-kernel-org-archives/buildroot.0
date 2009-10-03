From: Teng Chee Wan Philip <tcheewan@ntu.edu.sg>
Date: Sat, 3 Oct 2009 21:48:02 +0800
Subject: [Buildroot] Conflicting types for getline
In-Reply-To: <7085C89ACBD47E4B947F91A84B9EA9240C1CF914C3@EXCHANGE31.staff.main.ntu.edu.sg>
References: <7085C89ACBD47E4B947F91A84B9EA9240C1CF914C3@EXCHANGE31.staff.main.ntu.edu.sg>
Message-ID: <7085C89ACBD47E4B947F91A84B9EA9240C1CF914C4@EXCHANGE31.staff.main.ntu.edu.sg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I encountered an error running make for buildroot.  Any ideas?  Thanks in advance.

Attached is the make output.

regards,
Philip

===================================================================

$ make
make: Warning: File `.config.cmd' has modification time 2.1e+04 s in the future

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/lib/ccache/gcc'
C compiler version '4.4.0':                     Ok
C++ compiler '/usr/lib/ccache/g++'
C++ compiler version '4.4.0':                   Ok
awk installed:                                  Ok
bash installed:                                 Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/buildroot-config
mkdir -p /home/philipteng/buildroot-2009.08/project_build_i386/uclibc
cp -dpRf package/config/buildroot-config /home/philipteng/buildroot-2009.08/project_build_i386/uclibc/buildroot-config
(cd /home/philipteng/buildroot-2009.08/toolchain_build_i386/linux-2.6.28.4; \
         /usr/bin/make -j1 ARCH=i386 \
                HOSTCC="/usr/lib/ccache/gcc" HOSTCFLAGS="" \
                HOSTCXX="/usr/lib/ccache/g++" \
                INSTALL_HDR_PATH=/home/philipteng/buildroot-2009.08/toolchain_build_i386/linux headers_install; \
        )
make[1]: Entering directory `/home/philipteng/buildroot-2009.08/toolchain_build_i386/linux-2.6.28.4'
  CHK     include/linux/version.h
  HOSTCC  scripts/unifdef
scripts/unifdef.c:209: error: conflicting types for ?getline?
/usr/include/stdio.h:653: note: previous declaration of ?getline? was here
make[2]: *** [scripts/unifdef] Error 1
make[1]: *** [__headers] Error 2
make[1]: Leaving directory `/home/philipteng/buildroot-2009.08/toolchain_build_i386/linux-2.6.28.4'
make: *** [/home/philipteng/buildroot-2009.08/toolchain_build_i386/linux/.configured] Error 2
