From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jul 2013 09:11:45 +0200
Subject: [Buildroot] [PATCH v2 1/2] linux: install firmware to staging.
In-Reply-To: <1373391595-19359-1-git-send-email-spenser@gillilanding.com>
References: <1373391595-19359-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130710091145.7b8529d1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Tue,  9 Jul 2013 12:39:54 -0500, Spenser Gilliland wrote:
> Install firmware to staging when the hidden option
> BR2_LINUX_KERNEL_INSTALL_FIRMWARE is selected.  This allows parts of the
> firmware provided by the linux kernel to be installed in the target.
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Yann E. Morin <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

As discussed on IRC, I'm not really happy with the idea that one
package (linux) installs things in staging, and then another package
(beagle-capes) takes what the linux package has installed in staging,
and copies it to the target. Normally, it's the responsibility of a
given to package to install its stuff to the final destination.
Possibly with sub-options in this package to find out what should
actually be installed.

So normally, the situation you have should be solved with a Linux
Kernel package sub-option to select the list of in-kernel firmwares to
install.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
