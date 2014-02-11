From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Feb 2014 19:53:43 +0100
Subject: [Buildroot] [PATCH 3/3] gcc: xtensa: fix
	__builtin_frame_address use with shared libgcc
In-Reply-To: <55f56cc35e7fbbd83488b13936bcdcdde519119c.1392128329.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 11 Feb 2014 16:25:22 +0200")
References: <cover.1392128329.git.baruch@tkos.co.il>
 <55f56cc35e7fbbd83488b13936bcdcdde519119c.1392128329.git.baruch@tkos.co.il>
Message-ID: <87zjlxtr9k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The xtensa port uses __xtensa_libgcc_window_spill in libgcc to implement
 > __builtin_frame_address. This symbol is local/hidden in libgcc. This is not a
 > problem when linking against static libgcc. But g++ defaults to
 > -shared-libgcc, thus breaking link against C++ shared libraries that are using
 > __builtin_frame_address as follows:

 > ld: test: hidden symbol `__xtensa_libgcc_window_spill' in .../libgcc.a(lib2funcs.o) is referenced by DSO

 > Add upstream patches that make libgcc_s.so a linker script that links in
 > unresolved symbols from the static libgcc, similar to the ARM and PowerPC
 > ports.

 > Fixes:
 > http://autobuild.buildroot.net/results/e2d/e2d1a763fa86b8575e2e48e6d73c018175f43e7c/

Committed, thanks.

-- 
Bye, Peter Korsgaard
