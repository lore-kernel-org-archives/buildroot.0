From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 05 Jan 2013 15:33:06 +0200
Subject: [Buildroot] [PATCH] xlib_libXft: fix xft-config
In-Reply-To: <87pq1kjzl8.fsf@dell.be.48ers.dk>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <1357250947-23296-8-git-send-email-stefan.froberg@petroprogram.com>
 <87pq1kjzl8.fsf@dell.be.48ers.dk>
Message-ID: <50E82B92.2050206@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter

5.1.2013 1:30, Peter Korsgaard kirjoitti:
>>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:
>  Stefan> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>  Stefan> ---
>  Stefan>  package/x11r7/xlib_libXft/xlib_libXft.mk |    7 +++++++
>  Stefan>  1 files changed, 7 insertions(+), 0 deletions(-)
>
>  Stefan> diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
>  Stefan> index eab75ef..70c64bc 100644
>  Stefan> --- a/package/x11r7/xlib_libXft/xlib_libXft.mk
>  Stefan> +++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
>  Stefan> @@ -11,4 +11,11 @@ XLIB_LIBXFT_AUTORECONF = YES
>  Stefan>  XLIB_LIBXFT_INSTALL_STAGING = YES
>  Stefan>  XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
>  
>  Stefan> +define XLIB_LIBXFT_STAGING_XLIB_LIBXFT_CONFIG_FIXUP
>  Stefan> +	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xft-config
>  Stefan> +	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xft-config
>  Stefan> +endef
>  Stefan> +
>  Stefan> +XLIB_LIBXFT_POST_INSTALL_STAGING_HOOKS += XLIB_LIBXFT_STAGING_XLIB_LIBXFT_CONFIG_FIXUP
>
> Ehh, are you using an old tree? There is no xft-config:
No, Im using 2012.08 now and just switched from 2012.05.

> http://autobuild.buildroot.net/results/e8c00cf5ec1e3829cd9013710bb1961d9c226c34/build-end.log
>
> Looking at it's changelog it seems to have been removed in 2010:
> commit f2bd643475a555949558ff6f889c575da33c28a4
> Author: Gaetan Nadon <memsize@videotron.ca>
> Date:   Tue Mar 30 14:01:31 2010 -0400
>
>     config: remove deprecated xft-config script and man page
>     
>     This was put in place early 2000 when pkg-config was not used.
>     
>     Reviewed-by: R?mi Cardona <remi@gentoo.org>
>     Signed-off-by: Gaetan Nadon <memsize@videotron.ca>
>
> We haven't updated the libXft package since April 2011, so it's been a
> while.
>
> I've reverted the commit for now.
>
Strange...
Ill do make clean && make and see if I still end up with having xft-config

Regards
Stefan
