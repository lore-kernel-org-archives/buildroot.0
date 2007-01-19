From: Goetz Bock <bock@blacknet.de>
Date: Fri, 19 Jan 2007 14:31:53 +0100
Subject: [Buildroot] Building x86_64 failes
Message-ID: <20070119133153.GH14371@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear list,

after I've successfully build buildroot for i586 on my
amd64/debian/sarge box, I wanted to build the same rootfs for amd64.

So I copied the existing buildroot, removed build_i586 and
toolchain_build_i586, ran make clean and make menuconfig to
reconfigureit for x86_64.

But building the toolchain failes with:

/build/buildroot.amd64/toolchain_build_x86_64/gcc-4.1.1/gcc/config/i386/linux-unwind.h:
In function 'x86_fallback_frame_state':
/build/buildroot.amd64/toolchain_build_x86_64/gcc-4.1.1/gcc/config/i386/linux-unwind.h:152:
error: 'struct sigcontext' has no member named 'esp'
.
. [ more missing e?? members ]
.

It does not matter what version of binutils/gcc I use, it's always the
same error.
(I've tried binutuils: 2.16.1, 2.17, 2.17.50.0.7, 2.17.50.0.9 and gcc
4.0.3, 4.1.1, 4.2)

The i386 realy irritates me, and I've no idea where it comes from.

Any pionters?
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
