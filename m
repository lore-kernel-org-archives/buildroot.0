From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jul 2014 12:57:08 +0200
Subject: [Buildroot] [PATCH] libnss: don't use target CFLAGS with host
	toolchain
In-Reply-To: <5585048eb205b5d13b8ddc27a12a329aaa956408.1404185816.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 1 Jul 2014 06:36:56 +0300")
References: <5585048eb205b5d13b8ddc27a12a329aaa956408.1404185816.git.baruch@tkos.co.il>
Message-ID: <87mwctiby3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The OPTIMIZER variable is used to construct CFLAGS for host toolchain.
 > This breaks the build since we set it to TARGET_CFLAGS, and these may not be
 > supported by host toolchain. Augment the cross-compile patch to handle
 > OPTIMIZER so that we can initialize it to TARGET_OPTIMIZER, and override it
 > when used with host toolchain.

 > Fixes:
 > http://autobuild.buildroot.net/results/3f1/3f1afc1b58cb6fe53c438b55f169e2a78238806d/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
