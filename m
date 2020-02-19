From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Feb 2020 00:43:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: bump to 1.38
In-Reply-To: <20200219231616.19489-1-petr.vorel@gmail.com>
References: <20200219231616.19489-1-petr.vorel@gmail.com>
Message-ID: <20200220004323.17052b16@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Feb 2020 00:16:16 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> NOTE: andes-nds32 it's due problems with libffi and it's not caused by this update.
> Any idea, how to disable andes-nds32?
> 
> configure: error: "libffi has not been ported to nds32le-buildroot-linux-gnu."
> make: *** [package/pkg-generic.mk:264: /home/pvorel/br-test-pkg/andes-nds32/build/libffi-3.3/.stamp_configured] Error 1

You don't have to worry about this: any configuration on NDS32 that has
BR2_PACKAGE_LIBFFI=y is rejected and not tested by the autobuilders.

Ideally, we should have a BR2_PACKAGE_LIBFFI_ARCH_SUPPORTS option, but
libffi has so many reverse dependencies that nobody ever did the effort
to add this option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
