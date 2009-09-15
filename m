From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Sep 2009 06:58:16 +0200
Subject: [Buildroot] using crosstool-ng with glibc and buildroot
In-Reply-To: <20090914213907.326740@gmx.net>
References: <20090914213907.326740@gmx.net>
Message-ID: <20090915065816.235240d0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 14 Sep 2009 23:39:07 +0200,
"Florian Schimmer" <slaanch@gmx.de> a ?crit :

> Checking external toolchain settings
> Cannot find
> cross-compiler /home/flo/x-tools/x86_64-unknown-linux-gnu/x86_64-unknown-linux-gnu/bin/-gcc
> make: ***
> [/home/xx/xx/buildroot/buildroot-2009.08/build_x86_64/stamps/ext-toolchain-installed]
> Error 1

Instead of pointing Buildroot
to /home/flo/x-tools/x86_64-unknown-linux-gnu/x86_64-unknown-linux-gnu/,
could you point it to /home/flo/x-tools/x86_64-unknown-linux-gnu/ ? The
bin/ directory in this directory should contain the cross-compiling
tools with prefix.

> ext-tool.mk : 
> if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* ; then \
> 		echo "Incorrect selection of the C library"; \
> 		exit -1; \
> 	fi; \
> 
> but crosstools output for ld is:
> /lib/ld.so.1 and /lib/ld-2.9.so

Can you give me the full list of libraries in $${SYSROOT_DIR}/lib/ ?
Here, on an ARM toolchain, I have a lib/ld-linux.so.3 symbolic link.
Maybe it's different per architecture, in which case I could relax the
test.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
