From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 15:30:03 +0200
Subject: [Buildroot] Freeze on "Starting Kernel"
In-Reply-To: <008f01d68b49$dc0bc280$94234780$@gmail.com>
References: <008f01d68b49$dc0bc280$94234780$@gmail.com>
Message-ID: <20200915153003.09abae86@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rob,

On Tue, 15 Sep 2020 12:20:38 +0200
<rob.r374@gmail.com> wrote:

> As a Buildroot newbie I'm experimenting with different setups, packages and
> customizations.
> 
> My system frequently freezes at the point, where it seems to jump to code
> from certain image 
> 
> - it says >Starting Kernel< and then nothing happens. 
> 
> For instance I add few additional packages to the buildroot build and then
> suddenly, kernel doesn't start.

Adding just a few more user-space packages should definitely not cause
this, *except* if you're using an initramfs filesystem and your kernel
image has grown too large.

> Can I somehow setup things to get any useful feedback about what is wrong in
> such situation ?

If you're on ARM32, you can enable CONFIG_DEBUG_LL and CONFIG_EARLYPRINTK
in your kernel configuration, specify a debug UART in the kernel
configuration, and pass "earlyprintk" on the kernel command line.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
