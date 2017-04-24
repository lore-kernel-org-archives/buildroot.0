From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:31:25 +0200
Subject: [Buildroot] [git commit] package/libunwind: disable for x86
	with uClibc toolchain
In-Reply-To: <20170417130858.BC09A826C1@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 17 Apr 2017 15:08:22 +0200")
References: <20170417130858.BC09A826C1@busybox.osuosl.org>
Message-ID: <8737cxvbzm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c5b56b0a20b2be24878d8bae66fbe665e8fea698
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > libunwind use sigreturn() while building for x86 [1] but this function
 > is not available with uClibc-ng.

 > This throw a warning during libunwind build:
 > In file included from x86/Los-linux.c:4:0:
 > x86/Gos-linux.c: In function ??_ULx86_local_resume??:
 > x86/Gos-linux.c:298:7: warning: implicit declaration of function ??sigreturn?? [-Wimplicit-function-declaration]
 >        sigreturn (sc);
 >        ^

 > But any program trying to link against libunwind-generic.so fail to build:
 > [...]usr/lib/libunwind-generic.so: undefined reference to `sigreturn'
 > collect2: error: ld returned 1 exit status

 > Disable libunwind for x86 target when uClibc-ng is used.

 > Fixes:
 > http://autobuild.buildroot.net/results/54a/54afac8148cff5f3c17e83f80917fd9006948fe0//build-end.log

 > [1] http://git.savannah.gnu.org/gitweb/?p=libunwind.git;a=blob;f=src/x86/Gos-linux.c;h=17aebc2974af50eb0bf8292689b2ed22a4c97866;hb=HEAD#l299

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
