From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 23:26:21 +0100
Subject: [Buildroot] [PATCHv2] toolchain-wrapper: Disable
 -ftree-loop-distribute-patterns when building for microblaze with gcc >= 10
In-Reply-To: <20201006202920.592493-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 6 Oct 2020 22:29:20 +0200")
References: <20201006202920.592493-1-romain.naour@gmail.com>
Message-ID: <87blgkfz3m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > GCC 10 now enable by default -ftree-loop-distribute-patterns at -O2 or -Os
 > optimization level instead of -O3, see commit [1].

 > Due to this change, the microblaze kernel doesn't boot (as reported by
 > toolchain-builder project).

 > The gcc docs between version 9 and 10 has been updated accordingly [2] [3]
 > but there no word about this change in the gcc 10 changelog [4].

 > Fixes microblazebe:
 > https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359536 (glibc)
 > https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359538 (musl)
 > https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359540 (uClubc-ng)

 > Fixes microblazeel:
 > https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359542 (glibc)
 > https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359544 (musl)
 > https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359546 (uClibc-ng)

 > This has been reported upsteam [5].

 > [1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5879ab5fafedc8f6f9bfe95a4cf8501b0df90edd
 > [2] https://gcc.gnu.org/onlinedocs/gcc-9.3.0/gcc/Optimize-Options.html#Optimize-Options
 > [3] https://gcc.gnu.org/onlinedocs/gcc-10.2.0/gcc/Optimize-Options.html#Optimize-Options
 > [4] https://gcc.gnu.org/gcc-10/changes.html
 > [5] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97208

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > It's not clear if building the kernel with gcc 9 and -O3 trigger this issue.
 > It has been noticed by the change from [1].

 > v2: move -fno-tree-loop-distribute-patterns to the toolchain-wrapper (Arnout).

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
