From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Mar 2018 08:57:21 +0100
Subject: [Buildroot] [PATCH 11/23] configs/imx6-sabresd: needs
 host-openssl for the Linux kernel build
In-Reply-To: <CAOMZO5CgKRFwU_NDc6VmLYUwHiBrFvVjpoBn1Cram_vD9+Lu1g@mail.gmail.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
 <20180304213137.24681-12-thomas.petazzoni@bootlin.com>
 <CAOMZO5CgKRFwU_NDc6VmLYUwHiBrFvVjpoBn1Cram_vD9+Lu1g@mail.gmail.com>
Message-ID: <20180305085721.73a15209@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Mar 2018 20:24:52 -0300, Fabio Estevam wrote:

> It seems that all kernels >= 4.15 need to have
> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL selected, right?

No, as explained in PATCH 1 of the series, it depends on your kernel
configuration. If you have wireless enabled, a chain of dependency
results in the need for host-openssl. If you don't have wireless
enabled, you don't necessarily need host-openssl.

Patch 4 in the series shows for example how the host-openssl dependency
can be avoided for a Linux 4.15 configuration, by simply disabling
wireless support (which isn't terribly useful for a Qemu emulation).

> Can we have this selection made on a common place?

I'm afraid we can't, without enforcing this dependency for a number of
users who don't need it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
