From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Apr 2012 13:40:35 +0200
Subject: [Buildroot] [PATCH] Add lcdproc config options,
 for driver selection
In-Reply-To: <1334143890-11880-1-git-send-email-spdawson@gmail.com>
References: <1334143890-11880-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120411134035.28ead13f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 11 Apr 2012 12:31:30 +0100,
spdawson at gmail.com a ?crit :

> Add a configuration menu item to specify a list of lcdproc drivers to
> be built. The list defaults to 'all'.

Ok, I told you to wait for others comments on whether we should have
the full list (as you did initially) or this solution. I didn't want to
waste your time on this. Some comments below, though.

> +config BR2_PACKAGE_LCDPROC_DRIVERS
> +	string "List of drivers to build"
> +	default "all"
> +	help
> +	  Specify a comma-separated list of lcdproc drivers to be built
> +	depends on BR2_PACKAGE_LCDPROC

The depends on should be before the help text. It's not mandatory by
the kconfig syntax, but that's the way we use kconfig everywhere in
Buildroot.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
