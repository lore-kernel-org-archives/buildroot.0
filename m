From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:08:06 +0100
Subject: [Buildroot] [PATCH 1/1] Config.in: disable PIC/PIE if the
 toolchain does not support PIE
In-Reply-To: <20191027220334.23505-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 27 Oct 2019 23:03:34 +0100")
References: <20191027220334.23505-1-fontaine.fabrice@gmail.com>
Message-ID: <87k18kwue1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > m68k does not seem to really support PIE as it raises the following
 > build failure with aer-inject:
 > /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/7.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o: in function `lib_main':
 > (.text+0x4): undefined reference to `__shared_flat_add_library'
 > /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/7.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: final link failed: bad value

 > We also have another build failure with uclibc on microblazeel:
 > /home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/8.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: final link failed: bad value
 > collect2: error: ld returned 1 exit status
 > Makefile.in:114: recipe for target '../utils/getconf' failed

 > So add a BR2_TOOLCHAIN_SUPPORTS_PIE dependency on BR2_PIC_PIE

 > Fixes:
 >  - http://autobuild.buildroot.net/results/4cdd6f0368cc9d3c6e88f01b1a8929eb0839b638
 >  - http://autobuild.buildroot.net/results/a82a484409149d7f9aff6140ddcb89f627f508c7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
