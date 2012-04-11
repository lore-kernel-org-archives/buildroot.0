From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Apr 2012 12:17:41 +0200
Subject: [Buildroot] [PATCH] Add lcdproc config options,
 for driver selection
In-Reply-To: <1334138568-28717-1-git-send-email-spdawson@gmail.com>
References: <1334138568-28717-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120411121741.173594a3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

Le Wed, 11 Apr 2012 11:02:48 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/lcdproc/Config.in  |  246 ++++++++++++++++++++++++++++++++++++++++++++
>  package/lcdproc/lcdproc.mk |  151 +++++++++++++++++++++++++++-
>  2 files changed, 396 insertions(+), 1 deletions(-)

Thanks for this patch. I am wondering whether we should have such a
long list of drivers as a menu, or whether we should just provide an
option to give a comma-separated list of drivers. Something like the
following choice:

 [ ] Build all drivers
 [ ] Build custom list of drivers

When the second choice is enabled, then it shows:

 () List of drivers to build

But I don't feel really strongly about this, so please wait for
comments from other Buildroot developers before working on such change.

> +LCDPROC_CONF_OPT = --enable-drivers=$(shell echo $(LCDPROC_DRIVERS) | sed -e 's/ /,/g')

This can be done in pure make:

LCDPROC_CONF_OPT = --enable-drivers=$(subst $(space),$(comma),$(LCDPROC_DRIVERS))

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
