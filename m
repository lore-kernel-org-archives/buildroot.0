From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 08:58:06 +0100
Subject: [Buildroot] [PATCH v2 1/1] unbound: new package
In-Reply-To: <16896612-b4ff-96a3-e72c-e086c4bebd13@petroprogram.com> ("Stefan
 =?utf-8?Q?Fr=C3=B6berg=22's?= message of "Mon, 29 Jan 2018 02:58:46 +0200")
References: <20180113222651.22755-1-stefan.froberg@petroprogram.com>
 <uagqiexfnk.ln2@ID-313208.user.individual.net>
 <6b37de5d-dd14-17a8-44a8-bd9b078c2920@petroprogram.com>
 <jtksiex3i1.ln2@ID-313208.user.individual.net>
 <1a1a4349-bb17-6657-1d60-2e8c7891b0e9@petroprogram.com>
 <8i82jex0fn.ln2@ID-313208.user.individual.net>
 <2cacb101-8c6b-7eab-8c5f-0f67e32bf183@petroprogram.com>
 <87wp02dk9e.fsf@dell.be.48ers.dk>
 <16896612-b4ff-96a3-e72c-e086c4bebd13@petroprogram.com>
Message-ID: <87607l9jw1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:

 > Results:
 > armv5-ctng-linux-gnueabi [ 1/47]: FAILED (cannot execute cross-compiler)
 > armv7-ctng-linux-gnueabihf [ 2/47]: FAILED (cannot execute cross-compiler)

Huh? Are you missing some 32bit libraries?

 > br-arm-cortex-m4-full [ 8/47]: FAILED (need openssl 0.9.7 or higher)
 > br-arm-full-static [11/47]: FAILED (need openssl 0.9.7 or higher)

Presumably needs do depend on openssl?

 > br-bfin-full [12/47]: FAILED (undefined pthread_spin_init,
 > pthread_spin_lock etc..)
 > br-m68k-5208-full [15/47]: FAILED (undefined pthread_spin_init,
 > pthread_spin_lock etc..)
 > br-m68k-68040-full [16/47]: FAILED (undefined pthread_spin_init,
 > pthread_spin_lock etc..)
 > br-microblazeel-full [17/47]: FAILED (undefined pthread_spin_init,
 > pthread_spin_lock etc..)
 > br-openrisc-uclibc [23/47]: FAILED (undefined pthread_spin_init,
 > pthread_spin_lock etc..)

Needs threads support.

 > i686-ctng-linux-gnu [34/47]: FAILED (cannot execute cross-compiler)
 > mips64el-ctng_n32-linux-gnu [37/47]: FAILED (cannot execute cross-compiler)
 > mips64el-ctng_n64-linux-gnu [38/47]: FAILED (cannot execute cross-compiler)
 > powerpc-ctng_e500v2-linux-gnuspe [39/47]: FAILED (cannot execute
 > cross-compiler)
 > sourcery-arm-armv4t [40/47]: FAILED (need 32-bit support library)
 > sourcery-arm [41/47]: FAILED (need 32-bit support library)
 > sourcery-arm-thumb2 [42/47]: FAILED (need 32-bit support library)
 > sourcery-mips64 [43/47]: FAILED (need 32-bit support library)
 > sourcery-mips [44/47]: FAILED (need 32-bit support library)
 > sourcery-nios2 [45/47]: FAILED (need 32-bit support library)
 > sourcery-x86-64 [46/47]: FAILED (need 32-bit support library)
 > x86_64-ctng_locales-linux-gnu [47/47]: FAILED (cannot execute
 > cross-compiler)

Again 32bit libraries?

 > So only br-bfin-full, br-m68k-5208-full, br-m68k-68040-full,
 > br-microblazeel-full, br-openrisc-uclibc
 > I could only try to patch.

 > So what is the proper way of checking if external toolchain has thread
 > support ?
 > BR2_TOOLCHAIN_HAS_THREADS checks only internal toolchain right?

No, BR2_TOOLCHAIN_HAS_THREADS applies to all toolchain types.

-- 
Bye, Peter Korsgaard
