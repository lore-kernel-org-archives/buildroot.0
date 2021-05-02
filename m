From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 May 2021 22:29:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/sox: fix static build with
 magic and bzip2
In-Reply-To: <20210323065050.2172418-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 23 Mar 2021 07:50:50 +0100")
References: <20210323065050.2172418-1-fontaine.fabrice@gmail.com>
Message-ID: <8735v4517w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Update patch added by commit 183d583fb5f19eb11637873d73e13fe14536efa6 to
 > use pkg-config instead of linking with zlib to fix the following static
 > build failure with a bzip2-enabled libmagic:

 > /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/9.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/lib/libmagic.a(compress.o): in function `uncompressbuf':
 > compress.c:(.text+0x422): undefined reference to `BZ2_bzDecompressInit'
 > /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/9.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: compress.c:(.text+0x422): undefined reference to `BZ2_bzDecompressInit'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4c511c02e4c63b35ecf77a2658f88e8a0d9dbb4d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
