From: Wang, Baojun <wangbj@lzu.edu.cn>
Date: Mon, 25 Jun 2007 13:15:54 +0800
Subject: [Buildroot] buildroot latest svn build failed for target alpha
Message-ID: <382810339.25605@eyou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot toolchain, using gcc-4.1.2, uclibc-0.9.29 with linux 
threads(stable/old):

Remove thread_db header since thread debug support is disabled.
rm -f /opt/crosstools/alpha-linux-uclibc-gcc-4.1.2/include/thread_db.h
chown -R `id | sed 's/^uid=\([0-9]*\).*gid=\([0-9]*\).*$/\1:
\2/'` /opt/crosstools/alpha-linux-uclibc-gcc-4.1.2/include
install -d /opt/crosstools/alpha-linux-uclibc-gcc-4.1.2/lib
install -m 644 lib/*.[ao] /opt/crosstools/alpha-linux-uclibc-gcc-4.1.2/lib/
make[1]: Leaving directory 
`/home/wangbj/build/buildroot-alpha/toolchain_build_alpha/uClibc-0.9.29'
# Install the kernel headers to the staging dir if necessary
if 
[ ! -f /opt/crosstools/alpha-linux-uclibc-gcc-4.1.2/usr/include/linux/version.h ] ; 
then \
                
cp -pLR /home/wangbj/build/buildroot-alpha/toolchain_build_alpha/linux/include/* /opt/crosstools/alpha-linux-uclibc-gcc-4.1.2/usr/include/ ; 
\
        fi
# Build the host utils.  Need to add an install target...
make 
MAKE="make -j1" -C /home/wangbj/build/buildroot-alpha/toolchain_build_alpha/uClibc-0.9.29/utils 
\
                PREFIX=/opt/crosstools/alpha-linux-uclibc-gcc-4.1.2 \
                HOSTCC="/usr/bin/gcc" \
                hostutils
make[1]: Entering directory 
`/home/wangbj/build/buildroot-alpha/toolchain_build_alpha/uClibc-0.9.29/utils'
/usr/bin/gcc ../utils/readelf.c  -o ../utils/readelf.host  -Wl,-s  -O2 -Wall -include ../include/elf.h
make[1]: Leaving directory 
`/home/wangbj/build/buildroot-alpha/toolchain_build_alpha/uClibc-0.9.29/utils'
install -c /home/wangbj/build/buildroot-alpha/toolchain_build_alpha/uClibc-0.9.29/utils/ldd.host /opt/crosstools/alpha-linux-uclibc-gcc-4.1.2/usr/bin/ldd
install: cannot stat 
`/home/wangbj/build/buildroot-alpha/toolchain_build_alpha/uClibc-0.9.29/utils/ldd.host': 
No such file or directory
make: *** [/opt/crosstools/alpha-linux-uclibc-gcc-4.1.2/usr/lib/libc.a] Error 
1


-- 
Wang, Baojun                                        Lanzhou University
Distributed & Embedded System Lab              http://dslab.lzu.edu.cn
School of Information Science and Engeneering        wangbj at lzu.edu.cn
Tianshui South Road 222. Lanzhou 730000                     .P.R.China
Tel:+86-931-8912025                                Fax:+86-931-8912022
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070625/ccbe46b0/attachment.pgp 
