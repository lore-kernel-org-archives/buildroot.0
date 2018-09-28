From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:48:45 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] moarvm: fix build on powerpc64 / powerpc64le
In-Reply-To: <20180904221807.16291-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 5 Sep 2018 00:18:07 +0200")
References: <20180904221807.16291-1-fontaine.fabrice@gmail.com>
Message-ID: <87o9ch7poy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build fails with:
 >  In file included from dyncall_callback.c:35:0:
 > dyncall_callback_ppc64.c: In function 'dcbNewCallback':
 > dyncall_callback_ppc64.c:42:13: warning: implicit declaration of function 'dcAllocWX' [-Wimplicit-function-declaration]
 >    int err = dcAllocWX(sizeof(DCCallback), (void**) &pcb);
 >              ^~~~~~~~~
 > dyncall_callback_ppc64.c: In function 'dcbFreeCallback':
 > dyncall_callback_ppc64.c:53:3: warning: implicit declaration of function 'dcFreeWX' [-Wimplicit-function-declaration]
 >    dcFreeWX(pcb, sizeof(DCCallback));
 >    ^~~~~~~~
 > dyncall_callback_ppc64.S: Assembler messages:
 > dyncall_callback_ppc64.S:180: Error: operand out of range (3 is not between 0 and 1)

 > So select BR2_PACKAGE_LIBFFI for BR2_powerpc64 and BR2_powerpc64le as it
 > is already done for MIPS

 > Fixes:
 >  - http://autobuild.buildroot.org/results/97b53a74d9847c07f26178daeb1daff3b6c24813
 >  - http://autobuild.buildroot.org/results/c35ac4bbc5fb04aabf5a719eddeedf55f7f1f4eb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Fix error in Config.in (use || instead of |)

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
