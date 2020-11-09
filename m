From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 17:03:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/guile: disable jit on ARM with
 gcc < 5
In-Reply-To: <20201107160122.428274-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 7 Nov 2020 17:01:22 +0100")
References: <20201107160122.428274-1-fontaine.fabrice@gmail.com>
Message-ID: <87pn4mtt4f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > jit is enabled by default since version 3.0.0 on x86-64, i686, ARMv7 and
 > AArch64 targets however it raises the following build failure on ARM
 > with gcc 4.8:

 > jit.c:232:1: error: initializer element is not constant
 >  static const jit_gpr_t THREAD = JIT_V0;
 >  ^

 > This build failure was also reported with ARM on gcc 4.9:
 > https://www.mail-archive.com/guile-user at gnu.org/msg11497.html

 > So just disable jit with ARM and gcc < 5

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ba051bb00a6cad3cfd5ffeb197de20ea0eaef33e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
