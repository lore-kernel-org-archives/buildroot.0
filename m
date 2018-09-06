From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 09:44:51 +0200
Subject: [Buildroot] [PATCH v5 1/3] Makefile: add tainting support
In-Reply-To: <1536186133-9933-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
 <1536186133-9933-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20180906094451.44df8776@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Sep 2018 00:22:11 +0200, Angelo Compagnucci wrote:
> Packages who harms the build reproducibility or licensing can declare
> FOO_TAINTS variable. If a package taints the build it will be added
> to a list of tainting packages. The build ends with a warning if the
> tainting packages list is not empty. Moreover, legal info will show
> a warning in presence of a tainting package.
> 
> Tainting of host packages is not supported right now.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Why two SoBs ? Just one matching the From: is good enough.

> +ifdef $(2)_TAINTS
> +ifeq ($$($$($(2)_KCONFIG_VAR)),y)
> +BR2_TAINTED_BY+=$$($(2)_RAWNAME)

Spaces around +=

No need to resend just for that. Just explain why you have two SoB, if
I can keep just one, I can fix that up when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
