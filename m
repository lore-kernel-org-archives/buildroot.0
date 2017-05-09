From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 May 2017 17:24:11 +0200
Subject: [Buildroot] List of ARC toolchain issues
Message-ID: <20170509172411.7abd8421@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

In order to hopefully help in the resolution of ARC toolchain issues, I
compiled below the list of ARC toolchain issues that caused Buildroot
autobuilder failures recently:

 * util-linux

   libuuid/src/gen_uuid.c: In function '__uuid_generate_time':
   libuuid/src/gen_uuid.c:429:1: internal compiler error: in change_address_1, at emit-rtl.c:2126

   http://autobuild.buildroot.net/results/634/63430db3374840866f178fdbfe017ef68bc8701b/build-end.log

   Fails to build with the internal toolchain backend, building on
   ARC700. Interestingly, it seems it fails to build only when
   BR2_STATIC_LIBS=y.

   See http://autobuild.buildroot.net/?reason=util-linux-2.29.2&arch=arc

 * libcdio

   iso9660.c: In function 'strip_trail':
   iso9660.c:155:1: error: unrecognized supposed constant

   http://autobuild.buildroot.net/results/17b/17baccfb72de050aee9bc8ba2b46442afe45292d/build-end.log

   This is happening both with the internal toolchain backend (ARC700)
   and the pre-built external toolchain (ARC HS).

   http://autobuild.buildroot.net/?reason=libcdio-0.94&arch=arc

 * cups

   /tmp/ccC9w3Ls.s: Assembler messages:
   /tmp/ccC9w3Ls.s:114: Error: operand out of range (128 is not between -128 and 127)

   http://autobuild.buildroot.net/results/fe7/fe7fda3a1975571523558d02c8396deda7b65f9c/build-end.log

   This is happening with the internal toolchain backend (ARC700),
   though with a sample of only two build failures, it's hard to draw
   some conclusions.

   http://autobuild.buildroot.net/?reason=cups-2.2.3

 * quagga

   ospf_ri.c: In function 'ospf_router_info_lsa_refresh':
   ospf_ri.c:839:1: error: unrecognizable insn:
   [...]
   ospf_ri.c:839:1: internal compiler error: in extract_insn, at recog.c:2287

   http://autobuild.buildroot.net/results/e7d/e7dbac5addf0f873cef9354eec175a56c1cbcb31/build-end.log

   This is happening only with external toolchain backend (ARC HS).

   http://autobuild.buildroot.net/?reason=quagga-1.1.1&arch=arc

These are the four issues I could identify that seem to be relevant. Do
you think you could have a look into them?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
