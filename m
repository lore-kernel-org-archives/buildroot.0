From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:05:27 +0200
Subject: [Buildroot] [PATCH] imx7dsabresd: Add initial support
In-Reply-To: <1463163552-12956-1-git-send-email-festevam@gmail.com>
References: <1463163552-12956-1-git-send-email-festevam@gmail.com>
Message-ID: <20160513220527.037e3728@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 15:19:12 -0300, Fabio Estevam wrote:
> Add support for NXP imx7 sabresd board.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

I've tweaked the commit title to be:

  configs: new configuration for NXP i.MX7 SabreSD


> +#!/usr/bin/env bash
> +
> +GENIMAGE_CFG="board/freescale/imx7dsdb/genimage.cfg"

I've replaced this with:

BOARD_DIR="$(dirname $0)"
GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"

which we use in various post-image.sh scripts.


> +Create a bootable SD card
> +==============================

A few too many = signs here, so I've fixed that up.

And applied your patch to our next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
