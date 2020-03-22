From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 21:49:49 +0100
Subject: [Buildroot] [PATCH 1/1] package: add rtty
In-Reply-To: <20200310150606.28261-1-zhaojh329@gmail.com>
References: <20200310150606.28261-1-zhaojh329@gmail.com>
Message-ID: <20200322214949.676fe7e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Mar 2020 23:06:06 +0800
Jianhui Zhao <zhaojh329@gmail.com> wrote:

> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>

Thanks for your contribution. I have applied your patch, after doing a
number of changes. See below.

> ---
>  package/Config.in      |  1 +
>  package/rtty/Config.in |  7 +++++++
>  package/rtty/rtty.hash |  2 ++
>  package/rtty/rtty.mk   | 15 +++++++++++++++
>  4 files changed, 25 insertions(+)

You forgot to add an entry to the DEVELOPERS files, so I did that.

> diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
> new file mode 100644
> index 0000000000..239dc59f78
> --- /dev/null
> +++ b/package/rtty/rtty.hash
> @@ -0,0 +1,2 @@
> +sha256  6faafe75d82edbcfe154da5f1ffc0ddfd14dd88a2315f19aeed7f2631df96f41  rtty-7.1.2.tar.gz
> +sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENCE

The license file is named LICENSE (with an S) not LICENCE (with a C).

> +RTTY_VERSION = 7.1.2
> +LIBCURL_SOURCE = rtty-$(RTTY_VERSION).tar.gz

Wrong prefix, this variable was not needed anyway, so I dropped it.

> +RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
> +RTTY_LICENSE = MIT
> +RTTY_LICENSE_FILES = LICENSE
> +
> +RTTY_DEPENDENCIES = libev

As suggested by Romain Naour, I've added -DRTTY_SSL_SUPPORT=OFF, and
then did a follow-up commit to add optional support for SSL.

You will receive e-mail notifications if there are build failures for
the rtty package. If there are build failures, it would be nice if you
could investigate them, and provide fixes.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
