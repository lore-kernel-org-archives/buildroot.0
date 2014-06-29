From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:30:16 +0200
Subject: [Buildroot] [PATCH 1/1] libssh2: fix library search path issues
 when zlib support enabled
In-Reply-To: <1403878684-11934-1-git-send-email-acoffignal@geral.com>
References: <1403878684-11934-1-git-send-email-acoffignal@geral.com>
Message-ID: <20140629163016.41256df2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Coffignal,

On Fri, 27 Jun 2014 16:18:04 +0200, Alexandre Coffignal wrote:
> 
> Signed-off-by: Alexandre Coffignal <acoffignal@geral.com>
> ---
>  package/libssh2/libssh2.mk |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index 19df9af..73aae8e 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -28,7 +28,8 @@ endif
>  # Add zlib support if enabled
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
>  LIBSSH2_DEPENDENCIES += zlib
> -LIBSSH2_CONF_OPT += --with-libz
> +LIBSSH2_CONF_OPT += --with-libz \
> +	--with-libz-prefix=$(STAGING_DIR)/usr
>  else
>  LIBSSH2_CONF_OPT += --without-libz
>  endif

Thanks for the patch. However, I was not able to reproduce the issue,
be it on a system with zlib-dev installed or not. Can you provide more
details about the issue you're seeing?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
