From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 17:58:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/reaver: fix static build on m68k
In-Reply-To: <20190222111105.5313-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 22 Feb 2019 12:11:05 +0100")
References: <20190222111105.5313-1-fontaine.fabrice@gmail.com>
Message-ID: <8736ofkbfk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/935c038b921ffa0f185571de41223e4c201e964b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  .../0001-wps_attr_parse.c-fix-build-on-m68k.patch  | 39 ++++++++++++++++++++++
 >  1 file changed, 39 insertions(+)
 >  create mode 100644 package/reaver/0001-wps_attr_parse.c-fix-build-on-m68k.patch

 > diff --git
 > a/package/reaver/0001-wps_attr_parse.c-fix-build-on-m68k.patch
 > b/package/reaver/0001-wps_attr_parse.c-fix-build-on-m68k.patch
 > new file mode 100644
 > index 0000000000..e6e0726955
 > --- /dev/null
 > +++ b/package/reaver/0001-wps_attr_parse.c-fix-build-on-m68k.patch
 > @@ -0,0 +1,39 @@
 > +From ea649501249acdc4d0cf8a3d5cc203694e2f3f07 Mon Sep 17 00:00:00 2001
 > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > +Date: Fri, 22 Feb 2019 11:49:35 +0100
 > +Subject: [PATCH] wps_attr_parse.c: fix build on m68k
 > +
 > +Static build on m68k fails on:
 > +/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/m68k-linux-gcc
 > -DCONF_DIR='"/var/lib/reaver"' -Wall -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-dwarf2-cfi-asm
 > -Wl,-elf2flt -static -Wno-unused-but-set-variable -Wno-unused-variable
 > -Wno-unused-function -Wno-pointer-sign -Ilibwps -I. -Ilwe
 > -DCONFIG_IPV6 -I. -Iutils -c -o wps/wps_dev_attr.o wps/wps_dev_attr.c
 > +/tmp/ccC02tia.s: Assembler messages:
 > +/tmp/ccC02tia.s:899: Error: value -216 out of range
 > +/tmp/ccC02tia.s:899: Error: value of -216 too large for field of 1 bytes at 1977
 > +make[1]: *** [wps/wps_attr_parse.o] Error 1
 > +
 > +To fix this issue, statically cast end - pos to u8

How is end - pos guaranteed to fit in u8?

-- 
Bye, Peter Korsgaard
