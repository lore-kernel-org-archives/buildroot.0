From: Mark Constable <markc@renta.net>
Date: Wed, 21 Oct 2009 13:21:50 +1000
Subject: [Buildroot] x86_64-linux-uclibc-gcc not found
Message-ID: <4ADE7E4E.1020606@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is using 2009-08 instead of Git, same problem for a x86_64 target.

Minimal selections and a make O=/home/br200908

#
# configuration written to .config
#
make[1]: Leaving directory `/home/br200908/toolchain/uClibc-0.9.30.1'
touch /home/br200908/toolchain/uClibc-0.9.30.1/.config
set -x && /usr/bin/make -j1 -C /home/br200908/toolchain/uClibc-0.9.30.1 \
                ARCH="x86_64" \
                PREFIX=/home/br200908/toolchain/uClibc_dev/ \
                DEVEL_PREFIX=/usr/ \
                RUNTIME_PREFIX=/home/br200908/toolchain/uClibc_dev/ \
                HOSTCC="/usr/bin/gcc" headers \
                install_headers
+ /usr/bin/make -j1 -C /home/br200908/toolchain/uClibc-0.9.30.1 ARCH=x86_64 PREFIX=/home/br200908/toolchain/uClibc_dev/ DEVEL_PREFIX=/usr/ RUNTIME_PREFIX=/home/br200908/toolchain/uClibc_dev/ HOSTCC=/usr/bin/gcc headers install_headers
/bin/sh: /home/br200908/staging/usr/bin/x86_64-linux-uclibc-gcc: No such file or directory
make[1]: /home/br200908/staging/usr/bin/x86_64-linux-uclibc-gcc: Command not found
make[1]: Entering directory `/home/br200908/toolchain/uClibc-0.9.30.1'
make[1]: /home/br200908/staging/usr/bin/x86_64-linux-uclibc-gcc: Command not found
( cd extra/locale/; wget --passive-ftp http://www.uclibc.org/downloads/uClibc-locale-20081111-64-el.tgz )
--2009-10-21 05:22:25--  http://www.uclibc.org/downloads/uClibc-locale-20081111-64-el.tgz
Resolving www.uclibc.org... 140.211.167.224
Connecting to www.uclibc.org|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2009-10-21 05:22:27 ERROR 404: Not Found.

make[1]: *** [extra/locale/uClibc-locale-20081111-64-el.tgz] Error 8
make[1]: Leaving directory `/home/br200908/toolchain/uClibc-0.9.30.1'
make: *** [/home/br200908/toolchain/uClibc-0.9.30.1/.configured] Error 2

--markc
