From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 15:08:57 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add option to
 enable/disable ipv6 support
In-Reply-To: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
References: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>
Message-ID: <5602B279.8020506@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Wetzel,

On 09/23/2015 02:16 PM, Andreas Wetzel wrote:
> Added configuration option BR2_PACKAGE_LIBWEBSOCKETS_IPV6 that
> adds -DLWS_IPV6=ON/OFF to LIBWEBSOCKETS_CONF_OPTS.
> 
> Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
> ---
>  package/libwebsockets/Config.in        | 7 +++++++
>  package/libwebsockets/libwebsockets.mk | 8 +++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
> index 2b350bf..e3c7eea 100644
> --- a/package/libwebsockets/Config.in
> +++ b/package/libwebsockets/Config.in
> @@ -8,3 +8,10 @@ config BR2_PACKAGE_LIBWEBSOCKETS
>  	  in both directions.
>  
>  	  http://libwebsockets.org/
> +
> +if BR2_PACKAGE_LIBWEBSOCKETS
> +
> +config BR2_PACKAGE_LIBWEBSOCKETS_IPV6
> +    bool "Compile with support for ipv6"

please use tabs for indentation, not spaces.

Regards,

Vincent.

> +
> +endif
> diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
> index 2f83748..f4a3db2 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -11,7 +11,7 @@ LIBWEBSOCKETS_LICENSE = LGPLv2.1 with exceptions
>  LIBWEBSOCKETS_LICENSE_FILES = LICENSE
>  LIBWEBSOCKETS_DEPENDENCIES = zlib
>  LIBWEBSOCKETS_INSTALL_STAGING = YES
> -LIBWEBSOCKETS_CONF_OPTS = -DLWS_WITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
> +LIBWEBSOCKETS_CONF_OPTS = -DLWS_WITHOUT_TESTAPPS=ON
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
> @@ -20,4 +20,10 @@ else
>  LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_IPV6),y)
> +LIBWEBSOCKETS_CONF_OPTS += -DLWS_IPV6=ON
> +else
> +LIBWEBSOCKETS_CONF_OPTS += -DLWS_IPV6=OFF
> +endif
> +
>  $(eval $(cmake-package))
> 
