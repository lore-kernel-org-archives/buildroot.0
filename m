From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 7 Mar 2008 08:47:05 +0100
Subject: [Buildroot] Huge update
References: <46a136670803061710ka7f2c40u223e1348b1a04d21@mail.gmail.com>
Message-ID: <008a01c88027$7736d060$040514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John.
Your U-Boot patches unfortunately breaks the AT91 build.
AT91 is not well supported in the main U-Boot trunk.
The U-Boot build in target/device/Atmel/u-boot will therefore download
a prepatched version of u-boot (instead of adding 100s of kB in form
of patches).

Upgrading to mainstream u-boot will therefore ensure that almost
none of the AT91 processors will build.
Also the configuration items for u-boot are irrelevant for mainstream.

I have disabled your u-boot, but the files remain.
Please create a separate u-boot directory outside the Atmel directory and

1) ensure that you do not have any conflicts with the prepatched version
2) AT91 u-boot can selected inside the AT91 target configuration.
3) AVR32 should use the generic u-boot.

once fixed, resubmit.


It will be more complex in the future, since the AT91CAP9
will probably have good u-boot support in the near future,
so ideally the user should have a choice between
building the generic and the prepatched version.

Personally I think that putting the bootloader configuration
inside the root fs build is wrong.
Makes more sense to me to have it in the target.

Don't be dismayed by this, keep the patches coming.

Best Regards
Ulf Samuelsson
