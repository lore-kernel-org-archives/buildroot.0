From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 22:51:32 +0200
Subject: [Buildroot] [PATCH v2 4/7] arch: toolchain: Introduce binary
 format FLAT types.
In-Reply-To: <1364550643-11793-4-git-send-email-sonic.adi@gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-4-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130407225132.38a9471c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 29 Mar 2013 17:50:40 +0800, Sonic Zhang wrote:

> +# Set up flat binary type
> +choice
> +	prompt "FLAT Binary type"
> +	depends on BR2_BINFMT_FLAT
> +	default BR2_BINFMT_FLAT_ONE
> +config BR2_BINFMT_FLAT_ONE
> +	bool "One binary"
> +config BR2_BINFMT_FLAT_SEP_DATA
> +	bool "Separate data and code"

	depends on BR2_bfin || BR2_m68k

I know I've suggested on PATCH 3/7 to make FLAT depend on bfin, so
technically this isn't needed. But since -msep-data is really an option
that is only available on bfin and m68k, while the flat format can be
used potentially on other architectures, I'd prefer to make this
architecture dependency explicit here as well.

> +config BR2_BINFMT_FLAT_SHARED
> +	bool "Shared binary"

	depends on BR2_bfin || BR2_m68k

Same reason: -mid-shared-library is only available for Blackfin and
m68k.

> +endchoice

I would have originally thought of putting those choices directly
within the list of BR2_BINFMT_* (i.e have a list containing elf, fdpic,
flat-one, flat-sep-data, flat-shared). But maybe it makes more sense
the way you did, some I'm fine with that.

Having some help text for each choice would be nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
