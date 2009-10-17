From: Mark Constable <markc@renta.net>
Date: Sun, 18 Oct 2009 02:54:13 +1000
Subject: [Buildroot] Missing x86_64-linux-uclibc-gcc and
	uClibc-locale-20081111-64-el.tgz
Message-ID: <4AD9F6B5.8060300@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FWIW...

rm -rf /home/buildroot/output/build/buildroot-config
mkdir -p /home/buildroot/output/build
cp -dpRf package/config/buildroot-config /home/buildroot/output/build/buildroot-config
set -x && /usr/bin/make -j1 -C /home/buildroot/output/toolchain/uClibc-0.9.30.1 \
                ARCH="x86_64" \
                PREFIX=/home/buildroot/output/toolchain/uClibc_dev/ \
                DEVEL_PREFIX=/usr/ \
                RUNTIME_PREFIX=/home/buildroot/output/toolchain/uClibc_dev/ \
                HOSTCC="/usr/bin/gcc" headers \
                install_headers
+ /usr/bin/make -j1 -C /home/buildroot/output/toolchain/uClibc-0.9.30.1 ARCH=x86_64 PREFIX=/home/buildroot/output/toolchain/uClibc_dev/ DEVEL_PREFIX=/usr/ RUNTIME_PREFIX=/home/buildroot/output/toolchain/uClibc_dev/ HOSTCC=/usr/bin/gcc headers install_headers
/bin/sh: /home/buildroot/output/staging/usr/bin/x86_64-linux-uclibc-gcc: No such file or directory
make[1]: /home/buildroot/output/staging/usr/bin/x86_64-linux-uclibc-gcc: Command not found
make[1]: Entering directory `/home/buildroot/output/toolchain/uClibc-0.9.30.1'
make[1]: /home/buildroot/output/staging/usr/bin/x86_64-linux-uclibc-gcc: Command not found
( cd extra/locale/; wget --passive-ftp http://www.uclibc.org/downloads/uClibc-locale-20081111-64-el.tgz )
--2009-10-18 02:50:52--  http://www.uclibc.org/downloads/ 
Resolving www.uclibc.org... 140.211.167.224
Connecting to www.uclibc.org|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2009-10-18 02:50:53 ERROR 404: Not Found.

make[1]: *** [extra/locale/uClibc-locale-20081111-64-el.tgz] Error 8
make[1]: Leaving directory `/home/buildroot/output/toolchain/uClibc-0.9.30.1'
make: *** [/home/buildroot/output/toolchain/uClibc-0.9.30.1/.configured] Error 2

--markc
