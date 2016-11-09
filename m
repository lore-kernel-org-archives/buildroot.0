From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 21:41:20 +0100
Subject: [Buildroot] [PATCH] htop: enable unicode if possible
In-Reply-To: <20161109092739.4595-1-jezz@sysmic.org>
References: <20161109092739.4595-1-jezz@sysmic.org>
Message-ID: <20161109214120.49af0145@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Nov 2016 10:27:39 +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/htop/htop.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/htop/htop.mk b/package/htop/htop.mk
> index 7409a78..e1a658b 100644
> --- a/package/htop/htop.mk
> +++ b/package/htop/htop.mk
> @@ -7,7 +7,9 @@
>  HTOP_VERSION = 2.0.2
>  HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
>  HTOP_DEPENDENCIES = ncurses
> +ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),)
>  HTOP_CONF_OPTS = --disable-unicode
> +endif

We want something more explicit, like:

ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
HTOP_CONF_OPTS += --enable-unicode
else
HTOP_CONF_OPTS += --disable-unicode
endif

Could you try this, in both situations, and see if it works as expected?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
