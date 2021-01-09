From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Jan 2021 23:00:21 +0100
Subject: [Buildroot] [PATCH v3] package/xorcurses: new package
In-Reply-To: <20200430065445.3482-1-huth@tuxfamily.org>
References: <20200430065445.3482-1-huth@tuxfamily.org>
Message-ID: <20210109230021.59c87f8b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 30 Apr 2020 08:54:45 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> XorCurses is a remake of the 8-bit game 'Xor' by Astral Software.
> Your task is to roam around a series of mazes where you have to collect
> all blue masks before finding the exit. You have two 'shields' (players)
> and you can use either one at any time and switch between them. While
> the first level is simply a matter of navigation, the following levels
> introduce further objects like bombs and teleports, which have to be
> used right to solve the puzzles.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>

I have finally applied your package, with some changes, see below.

> diff --git a/package/xorcurses/Config.in b/package/xorcurses/Config.in
> new file mode 100644
> index 0000000000..f0b1a7898c
> --- /dev/null
> +++ b/package/xorcurses/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_XORCURSES
> +	bool "xorcurses"
> +	select BR2_PACKAGE_NCURSES
> +	help
> +	  XorCurses is a game remake of the 8-bit game 'Xor'. Your task
> +	  is to roam around a series of mazes where you have to collect
> +	  all blue masks before finding the exit. Note that the game
> +	  needs a terminal with colors, i.e. make sure that the TERM
> +	  environment variable is set to "linux" ("vt100" won't work).
> +
> +	  http://jwm-art.net/?p=XorCurses

This web site no longer exists, so I replaced it with a link to the
project github repo.

> diff --git a/package/xorcurses/xorcurses.hash b/package/xorcurses/xorcurses.hash
> new file mode 100644
> index 0000000000..38c1c001c1
> --- /dev/null
> +++ b/package/xorcurses/xorcurses.hash
> @@ -0,0 +1,5 @@
> +# Locally calculated
> +sha512 1782ebf6ae8798b32e0a8e5e20e6d0b44eb619f6e7f015735c6e86205bd545da108c36bff1c9cfc9e9b44dee8f90bacb9df70436991f57f51c2c87e94b3a4725  XorCurses-0.2.2.tar.bz2
> +
> +# License information is only mentioned in the README file
> +sha512 1878313f74d10e97aea8560ca9b28981b7ccf83ade81275eb982684cea006bc55776b6d029d1eca7a7ae20756aed0cfb4f63424634e0b5ad15d052dca3d2eee9  README

We normally sha256, so I changed that.

> diff --git a/package/xorcurses/xorcurses.mk b/package/xorcurses/xorcurses.mk
> new file mode 100644
> index 0000000000..b6f4ce96f6
> --- /dev/null
> +++ b/package/xorcurses/xorcurses.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# XorCurses

Lowercase "xorcurses"

> +#
> +################################################################################
> +
> +XORCURSES_VERSION = 0.2.2
> +XORCURSES_SOURCE = XorCurses-$(XORCURSES_VERSION).tar.bz2

Changed to use the Github repo, in its latest commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
