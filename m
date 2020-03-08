From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 09:33:59 +0100
Subject: [Buildroot] [PATCH v1] package/libdrm: tests/amdgpu needs
 atomic_ops
In-Reply-To: <20200307113604.14754-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 7 Mar 2020 12:36:04 +0100")
References: <20200307113604.14754-1-ps.report@gmx.net>
Message-ID: <87imjfutxk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add patch to fix tests/amdpu dependency on atomic_ops.
 > Fixes:

 >   http://autobuild.buildroot.net/results/e29dae423f3f80d2c34dde9a125bd216a75ad1c0

 >   FAILED: tests/amdgpu/amdgpu_test
 >   .../host/bin/sparc-linux-gcc  -o tests/amdgpu/amdgpu_test 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/amdgpu_test.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/basic_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/bo_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/cs_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/vce_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/uvd_enc_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/vcn_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/deadlock_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/vm_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/ras_tests.c.o' 'tests/amdgpu/b9f2b1d@@amdgpu_test at exe/syncobj_tests.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group libdrm.so.2.4.0 amdgpu/libdrm_amdgpu.so.1.0.0 .../host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcunit.so -Wl,--end-group -pthread '-Wl,-rpath,$ORIGIN/../..:$ORIGIN/../../amdgpu' -Wl,-rpath-link,.../build/libdrm-2.4.100/build/ -Wl,-rpath-link,.../build/li
 >  bdrm-2.4.100/build/amdgpu
 >   .../host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: tests/amdgpu/b9f2b1d@@amdgpu_test at exe/bo_tests.c.o: undefined reference to symbol 'AO_fetch_compare_and_swap_emulation'
 >   .../host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: .../host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libatomic_ops.so.1: error adding symbols: DSO missing from command line

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed after adding the upstream reference.

Why are we building these test programs in the first place?

-- 
Bye, Peter Korsgaard
