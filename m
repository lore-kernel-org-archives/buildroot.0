From: Jan Schunke <schunke@shf.de>
Date: Fri, 05 Apr 2013 14:20:57 +0200
Subject: [Buildroot] boost library fails with
Message-ID: <515EC1A9.6080905@shf.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am using buildroot 2012.11 trying to compile the boost libraries in
but I get:


gcc.compile.c++ bin.v2/libs/iostreams/build/gcc-4.6.3/release/zlib.o

    "/home/schunke/projects/buildroot_for_shf1x104/host/usr/bin/ccache"
"/home/schunke/projects/buildroot_for_shf1x104/host/usr/bin/powerpc-buildroot-linux-gnu-g++"
 -ftemplate-depth-128 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -pipe -msoft-float -Os  -O3 -finline-functions
-Wno-inline -Wall -fPIC  -DBOOST_ALL_NO_LIB=1
-DBOOST_IOSTREAMS_DYN_LINK=1 -DBOOST_IOSTREAMS_USE_DEPRECATED -DNDEBUG
-I"." -c -o "bin.v2/libs/iostreams/build/gcc-4.6.3/release/zlib.o"
"libs/iostreams/src/zlib.cpp"

libs/iostreams/src/zlib.cpp:20:76: fatal error: zlib.h: No such file or
directory
compilation terminated.

I have checked that I have enabled

Package Selection for the target ---> Libraries  --->Compression and
decompression  ---> -*- zlib

Attached you find my defconfig.

Is there anything else I am missing.

Thanks in advance for any hints

Jan





-- 
*******************************************************
Jan-Hendrik Schunke
Entwickler / Developer
SHF Communication Technologies AG
Wilhelm-v.-Siemens-Str. 23 D; 12277 Berlin, Germany
E-Mail: schunke at shf.de
Phone:  +49-(0)30- 77 20 51-0 direct: -45
Fax:    +49-(0)30- 75 31 07 8
Web:    www.shf.de
*******************************************************
Sitz der Gesellschaft/Registered Office: Berlin;
Registergericht/Register Court: AG Berlin-Charlottenburg HRB 72633;
Vorstand/Executive Board: Dr. Frank Hieronymi, Dr. Lars Klapproth;
Aufsichtsratsvorsitzender/Chairman of the Supervisory Board: Dr. Walter
L. Rust.

Diese E-Mail enth?lt vertrauliche und/oder rechtlich gesch?tzte
Informationen und ist ausschlie?lich f?r den bezeichneten Adressaten
oder dessen Vertreter bestimmt. Wenn Sie nicht der richtige Adressat
sind oder diese E-Mail irrt?mlich erhalten haben, informieren Sie bitte
sofort den Absender und vernichten Sie diese Mail. Jede Form der
Kenntnisnahme, Ver?ffentlichung, Vervielf?ltigung oder Weitergabe durch
andere Empf?nger ist unzul?ssig.

This e-mail may contain confidential and/or privileged information and
is intended solely for the addressee or a representative there of. If
you are not the intended recipient (or have received this e-mail in
error) please notify the sender immediately and destroy this e-mail.
Access to, publishing and copying of the information by a third party is
unauthorised.


-------------- next part --------------
BR2_powerpc=y
BR2_powerpc_440=y
BR2_CCACHE=y
BR2_TOOLCHAIN_CTNG=y
BR2_TOOLCHAIN_CTNG_eglibc=y
BR2_TOOLCHAIN_CTNG_CONFIG="toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibcSHF"
BR2_TOOLCHAIN_CTNG_CXX=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_SERVER=y
BR2_PACKAGE_GDB_HOST=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-pipe -msoft-float"
BR2_ECLIPSE_REGISTER=y
BR2_TARGET_GENERIC_HOSTNAME="shf200g"
BR2_TARGET_GENERIC_ISSUE="Welcome to shf200g"
BR2_ROOTFS_DEVICE_TABLE="board/shf/shf1x104/system/device_table.txt"
BR2_ROOTFS_STATIC_DEVICE_TABLE="board/shf/shf1x104/system/device_table_dev.txt"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/shf/shf1x104/rootfs_post_build.sh"
BR2_PACKAGE_BUSYBOX_CONFIG="board/shf/shf1x104/busybox-1.20.1.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_GNUTLS=y
BR2_PACKAGE_LIBNSS=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_SERIALIZATION=y
BR2_PACKAGE_LIBFFI=y
BR2_PACKAGE_NCURSES_TARGET_PANEL=y
BR2_PACKAGE_NCURSES_TARGET_FORM=y
BR2_PACKAGE_NCURSES_TARGET_MENU=y
BR2_PACKAGE_PCRE=y
BR2_PACKAGE_READLINE=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_CPIO_GZIP=y
