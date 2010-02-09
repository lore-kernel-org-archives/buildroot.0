From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Feb 2010 12:31:58 +0100
Subject: [Buildroot] [PATCH 01/14] package: added PKG_CONF_ENV variables
 to host packages
In-Reply-To: <1265566076-10628-2-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
	<1265566076-10628-2-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100209123158.23b82013@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Feb 2010 19:07:43 +0100
llandwerlin at gmail.com wrote:

> From: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> ---
>  package/Makefile.autotools.in |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/package/Makefile.autotools.in
> b/package/Makefile.autotools.in index 96ea453..89b2382 100644
> --- a/package/Makefile.autotools.in
> +++ b/package/Makefile.autotools.in
> @@ -108,6 +108,7 @@ define $(2)_CONFIGURE_CMDS
>  	        $$(HOST_CONFIGURE_OPTS) \
>  		CFLAGS="$$(HOST_CFLAGS)" \
>  		LDFLAGS="$$(HOST_LDFLAGS)" \
> +                $$($$(PKG)_CONF_ENV) \
>  		./configure \
>  		--prefix="$$(HOST_DIR)/usr" \
>  		--sysconfdir="$$(HOST_DIR)/etc" \


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
