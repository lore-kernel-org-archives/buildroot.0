From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 22:33:28 +0200
Subject: [Buildroot] [PATCH v2 3/6] arch: allow GCC target options to be
 optionally overwritten
In-Reply-To: <20180912102256.3164-4-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
 <20180912102256.3164-4-mark.corbin@embecosm.com>
Message-ID: <20180923223328.74910bb4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 11:22:53 +0100, Mark Corbin wrote:

>  include system/system.mk
>  include package/Makefile.in
> -# arch/arch.mk.* must be after package/Makefile.in because it may need to
> +# arch/arch.mk must be after package/Makefile.in because it may need to
>  # complement variables defined therein, like BR_NO_CHECK_HASH_FOR.
> --include $(sort $(wildcard arch/arch.mk.*))
> +-include $(sort $(wildcard arch/arch.mk))

This sort + wildcard + conditional include was no longer needed, since
we include a single file, and we know this file exists, so I've
simplified this line to:

include arch/arch.mk

and then I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
