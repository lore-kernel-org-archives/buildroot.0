From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 17:55:02 +0200
Subject: [Buildroot] [PATCH 2/2] package/libmediaart: Fix default symbol
 for media art backend
In-Reply-To: <20180509155146.25410-2-petr.vorel@gmail.com>
References: <20180509155146.25410-1-petr.vorel@gmail.com>
 <20180509155146.25410-2-petr.vorel@gmail.com>
Message-ID: <20180509175502.5210ec13@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 May 2018 17:51:46 +0200, Petr Vorel wrote:
> Symbol BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE does not exist it was meant
> to be BR2_PACKAGE_MEDIAART_BACKEND_NONE.
> 
> Fixes: c443830a57 libmediaart: new package
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Error found while working with updated kconfig, which offers this
> feature.

Meh, in fact the real bug is that all those options should be prefixed
by BR2_PACKAGE_LIBMEDIAART and not BR2_PACKAGE_MEDIAART.

Could you fix that instead ? Config.in.legacy handling will however not
be possible, because those options are part of a Kconfig choice, and
you can't select an item of a choice.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
