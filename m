From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 14:45:57 +0200
Subject: [Buildroot] [PATCH v2 02/12] package/atop: fix BUG_85180 build
 timeout
In-Reply-To: <20190521133932.81841-3-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 21 May 2019 15:39:22 +0200")
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
 <20190521133932.81841-3-giulio.benetti@micronovasrl.com>
Message-ID: <87zhmulw56.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > With Microblaze Gcc version < 8.x build hangs on compiling last files
 > before linking. This is due to bug 85180:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
 > Bug shows up building atop with optimization but not when building with
 > -O0.

 > If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
 > CFLAGS.

 > Fixes:
 > http://autobuild.buildroot.net/results/94a/94aa00f776b8a3491ac0b3212c95f5e666c5a29a/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > ---
 > V1 -> V2:
 > * use -O0 instead of -g1

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
