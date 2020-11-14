From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:20:49 +0100
Subject: [Buildroot] [PATCH]
 toolchain/toolchain-external/toolchain-external-arm-arm: add dependency on
 NEON
In-Reply-To: <20201114104807.511480-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 14 Nov 2020 11:48:07 +0100")
References: <20201114104807.511480-1-thomas.petazzoni@bootlin.com>
Message-ID: <878sb49iry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > While testing Buildroot on a Cortex-A5 that doesn't provide NEON, we
 > found out that a system generated with the ARM toolchain from Arm
 > didn't boot. It turns out that this ARM toolchain is built with:

 >   --with-arch=armv7-a --with-fpu=neon --with-float=hard --with-mode=thumb

 > So, it uses NEON as its FPU, which means it can only work on CPU cores
 > that have NEON support. This commit adds the appropriate dependency to
 > the toolchain-external-arm-arm package, and adjusts the Config.in help
 > text accordingly.

 > While at it, it also drops the part of the Config.in help text that
 > says the code is tuned for Cortex-A9, as it is not the case: it was
 > the case for the Linaro toolchain (built with --with-tune=cortex-a9),
 > but not for the ARM toolchain, for which no specific --with-tune is
 > passed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
 > Cc: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
