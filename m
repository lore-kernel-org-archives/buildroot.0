From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Dec 2010 19:01:48 -0300
Subject: [Buildroot] oprofile "requires" gmp???
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBBAB@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com><20101223082740.3a8e44c4@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com><20101224090517.0c935c19@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com><4D18D7B3.3020900@zacarias.com.ar>
	<4D18D873.9010502@zacarias.com.ar><9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com><4D19E079.9030704@zacarias.com.ar><9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBB45@EXV1.corp.adtran.com>
	<878vz8jnf7.fsf@macbook.be.48ers.dk>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBBAB@EXV1.corp.adtran.com>
Message-ID: <4D1BAFCC.3040302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/29/2010 06:54 PM, ANDY KENNEDY wrote:

> /root/src/PRODUCTION/newbuildroo/buildroot-gz/output/host/usr/lib/gcc/mi
> ps-unknown-linux-uclibc/4.5.2/../../../../mips-unknown-linux-uclibc/bin/
> ld: BFD (GNU Binutils) 2.21 assertion fail elfxx-mips.c:3157
> /root/src/PRODUCTION/newbuildroo/buildroot-gz/output/host/usr/lib/gcc/mi
> ps-unknown-linux-uclibc/4.5.2/../../../../mips-unknown-linux-uclibc/bin/
> ld: BFD (GNU Binutils) 2.21 assertion fail elfxx-mips.c:3161
> libpthread/nptl/libpthread_so.a(sem_unlink.oS): In function
> `sem_unlink':
> (.text+0x10): relocation truncated to fit: R_MIPS_CALL16 against
> `__pthread_once'
> collect2: ld returned 1 exit status
> make[1]: *** [lib/libpthread.so] Error 1
> make[1]: Leaving directory
> `/root/src/PRODUCTION/newbuildroo/buildroot-gz/output/toolchain/uClibc-0
> .9.32-rc1'
> make: ***
> [/root/src/PRODUCTION/newbuildroo/buildroot-gz/output/toolchain/uClibc-0
> .9.32-rc1/lib/libc.a] Error 2

Tweak your uclibc config file and do UCLIBC_EXTRA_CFLAGS="-mxgot" and
watch the problem dissapear :-)
I'm still pondering if we should provide an option to tweak uclibc build
cflags, on one side it's nice to debug this issues, on the other it's a
sharp knife - it all boils down on usage.
