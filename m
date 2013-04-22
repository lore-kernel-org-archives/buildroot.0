From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Apr 2013 17:48:12 +0200
Subject: [Buildroot] [PATCH 2/7] arc: Add option for ARC-specific
 download site
In-Reply-To: <1366630651-6857-3-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-3-git-send-email-mjonker@synopsys.com>
Message-ID: <20130422174812.621ec3c4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Mon, 22 Apr 2013 13:37:26 +0200, Mischa Jonker wrote:

> +config BR2_ARC_SITE
> +	string "Download site for ARC specific packages"
> +	default "http://www.synopsys.com/apps/arc-developer/"
> +	depends on BR2_arc || BR2_arceb
> +	help
> +	  This download site is used for packages that require specific
> +	  support for ARC, while this support is not yet pushed to the
> +	  respective open source project.

Is there some realistic case for which this URL would need to be
changed by the user? I think I'd prefer to hardcode the URL in the
binutils/gcc/uClibc recipes, just like we do a special casing for
AVR32, unless of course there is some compelling reason for making this
configurable.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
