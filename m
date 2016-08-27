From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 16:16:01 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
 kconfig snippet
In-Reply-To: <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827161601.2fd0e8f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:26 +0200, Yann E. MORIN wrote:

> +.PHONY: $(BUILD_DIR)/.br2-external.in

Why is a real file that exists on the filesystem a phony target?

> +# Ensure the kconfig snippet is generated (for MANUAL_GEN_LISTS, below):
> +MANUAL_DEPENDENCIES += prepare-kconfig

It's a bit crazy the complexity that we have just to allow our manual
to have the list of all packages in Buildroot. I'm not even sure this
section of the manual is that useful, to be honest. But oh well, that's
supported today, so we have to continue support it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
