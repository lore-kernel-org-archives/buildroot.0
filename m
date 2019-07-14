From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 15:45:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/iputils: bump to version
 s20190709
In-Reply-To: <20190710204529.31496-1-petr.vorel@gmail.com>
References: <20190710204529.31496-1-petr.vorel@gmail.com>
Message-ID: <20190714154541.1c9e8d29@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Wed, 10 Jul 2019 22:45:29 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Remove all patches (accepted in this release).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * Use 20190709 as version (not s20190709, required by Arnout)

Unfortunately, this still wasn't correct, and with your patch, iputils
cannot be downloaded (unless it was previously downloaded, and
available in DL_DIR). See below.

> -IPUTILS_VERSION = 20190515
> -IPUTILS_SITE = $(call github,iputils,iputils,s$(IPUTILS_VERSION))
> +IPUTILS_VERSION = 20190709
> +IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))

Your change to _SITE is wrong: you need to keep the 's' prefix,
otherwise Buildroot tries to use the 20190709 Git tag, which doesn't
exist. We need to use the s20190709 Git tag.

So I've dropped the change to _SITE to keep the "s" prefix and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
