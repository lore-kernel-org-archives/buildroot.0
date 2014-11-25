From: Spielmann Werner <Werner.Spielmann@SWAROVSKI.COM>
Date: Tue, 25 Nov 2014 14:38:42 +0000
Subject: [Buildroot] buildroot-20141121 -> building RTAI => syntax error
 near unexpected token
Message-ID: <2e63bbce0d1b4475b10927b4b08aeb5c@dsw332.wattens.swarovski.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hallo,



here I'm back with new troubles...   ;-)



Please is there anybody out there who can give me a hint?



I want to build the system on an Ubuntu 14.04/32 bit system - but building rtai there is aproblem I don't understand.

It seems the sed-action failed.



I use buildroot-20141121. Some definitions from my .config:



BR2_ARCH="i686"

BR2_x86_i686=y

BR2_DEFAULT_KERNEL_VERSION="2.6.32.11"

BR2_DEFAULT_KERNEL_HEADERS="2.6.32.11"

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y

BR2_GCC_VERSION="4.5.4"

BR2_LINUX_KERNEL_VERSION="2.6.32.11"

BR2_LINUX_KERNEL_DEFCONFIG="i386"

BR2_LINUX_KERNEL_EXT_RTAI=y



This is the problem:



> make

[...]

make[4]: Nothing to be done for `install-data-am'.

make[4]: Leaving directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1/addons'

make[3]: Leaving directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1/addons'

make[2]: Leaving directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1/addons'

Making install in rtai-py

make[2]: Entering directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1/rtai-py'

make[3]: Entering directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1/rtai-py'

/bin/sh ../base/config/autoconf/mkinstalldirs /home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/rtai-py

make[3]: Nothing to be done for `install-data-am'.

make[3]: Leaving directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1/rtai-py'

make[2]: Leaving directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1/rtai-py'

make[2]: Entering directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1'

make[3]: Entering directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1'

/bin/sh ./base/config/autoconf/mkinstalldirs /home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/share/rtai

/usr/bin/install -c -m 644 .rtai_config /home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/share/rtai/config-rtai-3.8.1

if test -f Module.symvers ; then \

            /usr/bin/install -c -m 644 Module.symvers /home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot/lib/modules/2.6.32.11/rtai/Module.symvers ; \

        fi

make[3]: Leaving directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1'

make[2]: Leaving directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1'

make[1]: Leaving directory `/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1'

find /home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib* -name "*.la" | xargs --no-run-if-empty /bin/sed -i -e "s:/home/spiewe/svnws/buildroot-2014.11.21/output:@BASE_DIR@:g" -e "s:/home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot:@STAGING_DIR@:g" -e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" -e "s:@STAGING_DIR@:/home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot:g" -e "s:@BASE_DIR@:/home/spiewe/svnws/buildroot-2014.11.21/output:g"

(SED) 's%^staging=.*%staging=/home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot%' /home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/bin/rtai-config

/bin/sh: -c: line 0: syntax error near unexpected token `'s%^staging=.*%staging=/home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot%''

/bin/sh: -c: line 0: `(SED) 's%^staging=.*%staging=/home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot%' /home/spiewe/svnws/buildroot-2014.11.21/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/bin/rtai-config'

make: *** [/home/spiewe/svnws/buildroot-2014.11.21/output/build/rtai-3.8.1/.stamp_staging_installed] Error 1





Any ideas?



Thanks!



Werner



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141125/c8246b72/attachment.html>
