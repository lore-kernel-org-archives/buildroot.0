From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 00:01:55 +0200
Subject: [Buildroot] [PATCH 4/4] sunxi-cedar: add cedar hardware video
 decoding library
In-Reply-To: <1374277074-14455-5-git-send-email-spenser@gillilanding.com>
References: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
 <1374277074-14455-5-git-send-email-spenser@gillilanding.com>
Message-ID: <20130730000155.1be43710@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Fri, 19 Jul 2013 18:37:54 -0500, Spenser Gilliland wrote:

> +ifeq ($(BR2_ARM_EABIHF),y)
> +SUNXI_CEDAR_BIN_DIR = $(@D)/libcedarv/linux-armhf
> +else
> +SUNXI_CEDAR_BIN_DIR = $(@D)/libcedarv/linux-armel
> +endif

The package fails to build in the linux-armel case, because avheap.c
doesn't exist in this case:

  http://autobuild.buildroot.org/results/739/7395780dafedb6126dad7f9405609c2fe02104ec/build-end.log

Also for some reason, in another build it uses the host compiler
instead of the cross compiler:

  http://autobuild.buildroot.org/results/5b0/5b0e52f2fd59916e46572b0f34403972e77e8283/build-end.log

Could you have a look into these issues?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
