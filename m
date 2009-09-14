From: Florian Schimmer <slaanch@gmx.de>
Date: Mon, 14 Sep 2009 23:39:07 +0200
Subject: [Buildroot] using crosstool-ng with glibc and buildroot
Message-ID: <20090914213907.326740@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, 

I'm not able to use the builds of crosstool-ng in buildroot as an external toolchain. 

Buildroot Error: 
Checking external toolchain settings
Cannot find cross-compiler /home/flo/x-tools/x86_64-unknown-linux-gnu/x86_64-unknown-linux-gnu/bin/-gcc
make: *** [/home/xx/xx/buildroot/buildroot-2009.08/build_x86_64/stamps/ext-toolchain-installed] Error 1

Buildroots want's a prefix like x86_64, but crosstools-ng builds a gcc without prefix 

if i add a symlink to gcc with the prefix, i get this output: 
Incorrect selection of the C library
make: *** [/home/flo/Arbeit/buildroot/buildroot-2009.08/build_x86_64/stamps/ext-toolchain-installed] Error 255

Buildroot doesn't find the library.

ext-tool.mk : 
if ! test -f $${SYSROOT_DIR}/lib/ld-linux.so.* ; then \
		echo "Incorrect selection of the C library"; \
		exit -1; \
	fi; \

but crosstools output for ld is:
/lib/ld.so.1 and /lib/ld-2.9.so

what can i do? 

thx
flo


-- 
GRATIS f?r alle GMX-Mitglieder: Die maxdome Movie-FLAT!
Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome01
