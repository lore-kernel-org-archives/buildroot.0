From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 May 2013 09:18:39 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-05-13
In-Reply-To: <20130514063004.8012052C105@lolut.humanoidz.org> (Thomas
 Petazzoni's message of "Tue, 14 May 2013 08:30:03 +0200 (CEST)")
References: <20130514063004.8012052C105@lolut.humanoidz.org>
Message-ID: <87vc6mrpv4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Build statistics for 2013-05-13
 Thomas> ===============================

 Thomas>         success : 89 
 Thomas>        failures : 35 
 Thomas>        timeouts : 35 
 Thomas>           TOTAL : 124

What are the timeouts?


 Thomas> Classification of failures by reason
 Thomas> ====================================

 Thomas>                   ne10-88c18f0 | 3 
 Thomas>                  cairo-1.12.10 | 3 
 Thomas>           host-protobuf-c-0.15 | 2 
 Thomas>                  binutils-2.21 | 2 
 Thomas>                  rt-tests-0.83 | 2 
 Thomas>                  pixman-0.28.2 | 2 
 Thomas>                czmq-cb9839cf90 | 1 
 Thomas>                 libtirpc-0.2.2 | 1 
 Thomas>                     systemd-44 | 1 
 Thomas>                libglib2-2.30.3 | 1 
 Thomas>    host-lttng-babeltrace-1.0.2 | 1 
 Thomas>                 directfb-1.6.3 | 1 
 Thomas>                 mongrel2-1.8.0 | 1 
 Thomas>                aircrack-ng-1.1 | 1 
 Thomas>                     acl-2.2.51 | 1 
 Thomas>              util-linux-2.22.2 | 1 
 Thomas>               matchbox-lib-1.9 | 1 
 Thomas>                       qt-4.8.4 | 1 
 Thomas>                 lmbench-3.0-a9 | 1 
 Thomas>                linux-pam-1.1.4 | 1 
 Thomas>                wvstreams-4.6.1 | 1 
 Thomas>                madplay-0.15.2b | 1 
 Thomas>                  libiconv-1.14 | 1 
 Thomas>                   libv4l-0.8.9 | 1 
 Thomas> media-ctl-ac40b79f002a2315f... | 1 
 Thomas>          host-gutenprint-5.2.9 | 1 
 Thomas>                 libsigsegv-2.6 | 1 

Nice overview!

 Thomas> Detail of failures
 Thomas> ===================

 Thomas>       bfin |                     acl-2.2.51 | NOK |
 Thomas>       http://autobuild.buildroot.net/results/246c3ce58eb904854e616894e737d77483ad0250/

Not clear from the log. Would need to check config.log


 Thomas>    powerpc |                aircrack-ng-1.1 | NOK |
 Thomas>    http://autobuild.buildroot.net/results/2441d8b62323a00f32f2edb7cb781dda71ff7f68/

aircrack forgets to link with -ldl -pthread when linking statically.


 Thomas>        arm |                  binutils-2.21 | NOK |
 Thomas>        http://autobuild.buildroot.net/results/41bd79dc40f0f83f67d50dc9ed835edb22dd4543/

static/shared mismatch (2x)

 Thomas>        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d491de5a774592929a59f3bfd0b1fd8cbc089ac0/

cairo needs threads support (3x)

 Thomas>       bfin |                czmq-cb9839cf90 | NOK | http://autobuild.buildroot.net/results/d3460c3140140cbec366cc2b58090cd244f96aa1/

The bfin toolchain doesn't have UCLIBC_SUPPORT_AI_ADDRCONFIG enabled.

 Thomas>   mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ef8407863212d695e91ba0884c93420c7f77e144/

Mips64 issue?

 Thomas>        arm |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/ae14a7246ba6bb112615dc43e54385b315f2fa81/

More host/cups confusion in host-gutenprint? Strangely enough it doesn't
happen on my builders.

 Thomas>    powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/11fdc108f78c47f236d06aea3a002a1307617fde/

Missing include?

 Thomas>       i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/3b7e7760cdd1c2ffa8845cd90f3c4424ae255010/

Not clear from the log

 Thomas>       bfin |                libglib2-2.30.3 | NOK | http://autobuild.buildroot.net/results/e9d4d442cbe41233815b774b9f0c94d213877e50/
 
libglib2 needs mmu.

Thomas>       bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/830f6378ea74293f519459b6407522fd5af3d6de/

bfin/libtool/shared lib issue?

 Thomas>     x86_64 |                 libsigsegv-2.6 | NOK | http://autobuild.buildroot.net/results/c82c53723cd8e606f64fd7d7eb8d9bcea80c8ac5/

Oddly enough, my firefox doesn't think the build-end.log is text/plain,
so it wants to download it, but checking with curl the headers look
fine.

Seems some symbols collide with uClibc symbols.

 Thomas> microblaze |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/0f020b47444586d5a74ec5f79f773b9f74eb900f/

toolchain doesn't have SOCK_CLOEXEC

 Thomas>    aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/9c12812cb01762b19410fa4f2fb79a83db55bc83/

No SYS_open syscall on aarch64?

 Thomas> microblaze |                linux-pam-1.1.4 | NOK | http://autobuild.buildroot.net/results/63e8895a6001b89b38c5da7d29ddacc9a688cf0a/

Toolchain error. Perhaps fixable with -fPIC?

 Thomas>     xtensa |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/62695acc3d70a67a49f65716494770f24b0eb5eb/

Toolchain error.

 Thomas>        arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/81cc2a3d834a83a991b45dcdfa6cc0457d9ebf59/

libintl issue?

 Thomas>       i686 |               matchbox-lib-1.9 | NOK | http://autobuild.buildroot.net/results/48d37a98ded3b45d6f9acb071d8a0a74b63ab538/

Not clear from log.

 Thomas>        arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/a44012641afadb3c636aa650361e42b53d0f2a2b/

Too old kernel headers.

 Thomas>       i686 |                 mongrel2-1.8.0 | NOK | http://autobuild.buildroot.net/results/1a451cf09271fdf9922154da70cc6586a24e2639/

uClibc doesn't have getcontext().

 Thomas>        arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/87b1fb0dce2f1dce78671fb9fcd08c9315a55537/

Not clear from log.

 Thomas>       mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/97263b933a360b79972b28912636458cf275660e/


mips/toolchain issue?

 Thomas>        arm |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/4cc7b7e5e6c10ee6a706dfe658a3ed341b6d7ebd/

qt needs threads.

 Thomas>        arc |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/bfbd82224a80f4446c5f9c1a37b95e910c9f181a/

arc/pthread issue?

 Thomas>     mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/f90803bdc165c23567047e67f2b84eb8ae57f578/

mips/C library issue?

 Thomas>     x86_64 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/e82365e0b7ccde24ec2a30cfb3de80562fdedc0d/

Toolchain doesn't have MSG_CMSG_CLOEXEC

 Thomas>      avr32 |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/2518936360ebed7cc3a26ffd09fe31d5d60b4fe1/

Toolchain doesn't have fallocate. Fallocate suboption should probably
depend on !avr32

 Thomas>     x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/748ff548189648607ae13e454fee710709718400/

wvstreams missing -fPIC.

Patches are always welcome ;)

-- 
Bye, Peter Korsgaard
