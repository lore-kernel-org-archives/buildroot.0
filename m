From: Mark Constable <markc@renta.net>
Date: Fri, 23 Oct 2009 19:57:16 +1000
Subject: [Buildroot] No gcc 4.4.2
Message-ID: <4AE17DFC.5020605@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FWIW I tried to ignorantly force the use of gcc 4.4.2 but it seems
there needs to be deeper changes than what I am capable of...

/bin/sh: line 0: cd: /home/sources/buildroot/output/target/usr/lib/gcc-lib/i686-linux-uclibc/4.4.2: No such file or directory
make: [/home/sources/buildroot/output/target/usr/bin/gcc] Error 1 (ignored)
(cd /home/sources/buildroot/output/target/usr/lib && /home/sources/buildroot/output/staging/usr/bin/i686-linux-uclibc-strip --remove-section=.comment --remove-section=.note libstdc++.so.*.*.* > /dev/null 2>&1)
(cd /home/sources/buildroot/output/target/lib && /home/sources/buildroot/output/staging/usr/bin/i686-linux-uclibc-strip --remove-section=.comment --remove-section=.note libgcc_s*.so.*.*.* > /dev/null 2>&1)
make: [/home/sources/buildroot/output/target/usr/bin/gcc] Error 1 (ignored)
#
rm -f /home/sources/buildroot/output/target/usr/lib/*.la*
#rm -rf /home/sources/buildroot/output/target/share/locale /home/sources/buildroot/output/target/usr/info \
        #       /home/sources/buildroot/output/target/usr/man /home/sources/buildroot/output/target/usr/share/doc
# Work around problem of missing syslimits.h
if [ ! -f /home/sources/buildroot/output/target/usr/lib/gcc-lib/i686-linux-uclibc/4.4.2/include/syslimits.h ]; then \
                echo "warning: working around missing syslimits.h"; \
                cp -f /home/sources/buildroot/output/staging/lib/gcc-lib/i686-linux-uclibc/4.4.2/include/syslimits.h \
                        /home/sources/buildroot/output/target/usr/lib/gcc-lib/i686-linux-uclibc/4.4.2/include/; \
        fi
warning: working around missing syslimits.h
cp: cannot stat `/home/sources/buildroot/output/staging/lib/gcc-lib/i686-linux-uclibc/4.4.2/include/syslimits.h': No such file or directory
make: *** [/home/sources/buildroot/output/target/usr/bin/gcc] Error 1


--markc
