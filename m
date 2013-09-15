From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:28:04 +0200
Subject: [Buildroot] [PATCHv2 12/14] gcc: provide option to enable
	mudflap support
In-Reply-To: <1378138000-12739-13-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:38 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvt5ixln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The mudflap library is only useful if one uses the -fmudflap gcc
 Thomas> option, to do more checks on pointers/arrays. This commit adds an
 Thomas> option to enable/disable mudflap support at the gcc level. By default,
 Thomas> it is disabled, which saves a little bit of build time compared to the
 Thomas> default of gcc which consists in enabling mudflap support.

 Thomas> Since mudflap is now disabled by default, and ensured to be enabled on

.. and ensure to NEVER be enabled on

 Thomas> some platforms where it is not available, some gcc.mk code that was

I dropped 'some'.

 Thomas> +
 Thomas> +config BR2_GCC_ENABLE_LIBMUDFLAP
 Thomas> +	bool "Enable libmudflap support"
 Thomas> +	# There are architectures, or specific configurations for
 Thomas> +	# which mudflap is not supported.
 Thomas> +	depends on !BR2_avr32 && !BR2_bfin && !BR2_ARM_INSTRUCTIONS_THUMB &&!BR2_powerpc_SPE

Space missing before !BR2_powerpc_SPE

Committed with this fixed, thanks.

-- 
Bye, Peter Korsgaard
