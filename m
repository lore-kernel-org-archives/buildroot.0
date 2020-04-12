From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 22:42:57 +0200
Subject: [Buildroot] [PATCH 1/1] mbuffer: new package
In-Reply-To: <20200211134652.2909-1-gliga.mircea@gmail.com>
References: <20200211134652.2909-1-gliga.mircea@gmail.com>
Message-ID: <20200412224257.4ca7f569@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mircea,

On Tue, 11 Feb 2020 15:46:52 +0200
Mircea Gliga <gliga.mircea@gmail.com> wrote:

> Signed-off-by: Mircea Gliga <gliga.mircea@gmail.com>

Sorry for the long delay. I have now applied your patch, with a few
changes.

First, I changed the commit title to "package/mbuffer: new package", to
follow our convention.

>  package/Config.in            |  1 +
>  package/mbuffer/Config.in    |  8 ++++++++
>  package/mbuffer/mbuffer.hash |  5 +++++
>  package/mbuffer/mbuffer.mk   | 19 +++++++++++++++++++

I've added an entry for this package in the DEVELOPERS file.

> diff --git a/package/mbuffer/Config.in b/package/mbuffer/Config.in
> new file mode 100644
> index 0000000000..5c733c0ec5
> --- /dev/null
> +++ b/package/mbuffer/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_MBUFFER
> +	bool "mbuffer"
> +	depends on !BR2_STATIC_LIBS

I've added a comment that explains why we have this dependency:

	depends on !BR2_STATIC_LIBS # dlopen()

> +	help
> +	  mbuffer is a tool for buffering data streams with a large set
> +	  of unique features.
> +
> +	  http://www.maier-komor.de/mbuffer.html

And here I've added a Config.in comment that shows up in
BR2_STATIC_LIBS configurations, so that users now why mbuffer is not
available.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
