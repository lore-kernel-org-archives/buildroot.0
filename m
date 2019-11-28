From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 16:58:16 +0100
Subject: [Buildroot] [PATCH 2/3] package/nodejs: use --with-arm-fpu
 option on ARM
In-Reply-To: <20191127203648.291701-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 27 Nov 2019 21:36:47 +0100")
References: <20191127203648.291701-1-thomas.petazzoni@bootlin.com>
 <20191127203648.291701-3-thomas.petazzoni@bootlin.com>
Message-ID: <87mucggfhj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > nodejs can use some FPU instructions on ARM, but it needs to know that
 > thanks to the --with-arm-fpu option. Without this, it may use the
 > wrong FPU setting, such as use VFPv3 even if only a VFPv3-D16 is
 > available. This has been reported as bug #12166, where the compiled
 > node binary had some floating point instructions using floating point
 > registers above 16 on a VFPv3-D16 system.

 > This commit makes sure we pass the appropriate --with-arm-fpu value
 > when it makes sense. Note that NodeJS only has explicit support for a
 > subset of the FPUs, for the ones that are not explicitly supported, we
 > simply pass no --with-arm-fpu value.

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=12166

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
