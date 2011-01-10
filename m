From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Jan 2011 14:11:55 +0100
Subject: [Buildroot] [PATCH 2/5] pciutils: SHARED make opt goes for
	install too
In-Reply-To: <1294339321-5659-2-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Thu, 6 Jan 2011 15:41:58 -0300")
References: <1294339321-5659-1-git-send-email-gustavo@zacarias.com.ar>
	<1294339321-5659-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bp3ogaxw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> If we don't pass SHARED when installing we miss the shared library
 Gustavo> symlinks (libpci.so & libpci.so.3) thus breaking stuff.

Really? It works here:

>>> pciutils 3.1.7 Installing to target
..
/usr/bin/make -j2 BUILDDIR=/home/peko/source/buildroot/output3/build/pciutils-3.1.7 -C /home/peko/source/buildroot/output3/build/pciutils-3.1.7 PREFIX=/home/peko/source/buildroot/output3/target/usr install-lib
/usr/bin/make -C lib all
make[3]: Nothing to be done for `all'.
install -d -m 755 /home/peko/source/buildroot/output3/target/usr/include/pci /home/peko/source/buildroot/output3/target/usr/lib /home/peko/source/buildroot/output3/target/usr/lib/pkgconfig
install -c -m 644 lib/config.h lib/header.h lib/pci.h lib/types.h /home/peko/source/buildroot/output3/target/usr/include/pci
install -c -m 644 lib/libpci.so.3.1.7 /home/peko/source/buildroot/output3/target/usr/lib
install -c -m 644 lib/libpci.pc /home/peko/source/buildroot/output3/target/usr/lib/pkgconfig

-- 
Bye, Peter Korsgaard
