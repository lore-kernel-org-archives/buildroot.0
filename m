From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 16:38:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/gupnp-dlna: disable
 introspection
In-Reply-To: <20200315150257.2807446-1-fontaine.fabrice@gmail.com>
References: <20200315150257.2807446-1-fontaine.fabrice@gmail.com>
Message-ID: <20200315153840.GF19677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-03-15 16:02 +0100, Fabrice Fontaine spake thusly:
> Build will fail if gobject-introspection is built before gupnp-dlna:
>   GISCAN   GUPnPDLNAGst-2.0.gir
> Couldn't find include 'Gst-1.0.gir' (search path: '['/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '.', '/home/buildroot/autobuild/run/instance-1/output-1/host/share', 'gir-1.0', '/home/buildroot/autobuild/run/instance-1/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/829a84b37db7d9141785bfe2eec2dd0e6d3310f1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

However, these patches are just workarounds; it would be nice to
eventually br able to enable introspection. This means it would be nice
that we can help Adam to try and fix the remaining GOI issues; I just
respun the GOI series:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=164476

Regards,
Yann E. MORIN.

> ---
>  package/gupnp-dlna/gupnp-dlna.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
> index 6f9ff8a58c..85d30b7cd2 100644
> --- a/package/gupnp-dlna/gupnp-dlna.mk
> +++ b/package/gupnp-dlna/gupnp-dlna.mk
> @@ -15,7 +15,9 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
>  GUPNP_DLNA_INSTALL_STAGING = YES
>  GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
>  
> -GUPNP_DLNA_CONF_OPTS = --disable-legacy-gstreamer-metadata-backend
> +GUPNP_DLNA_CONF_OPTS = \
> +	--disable-introspection \
> +	--disable-legacy-gstreamer-metadata-backend
>  
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
>  GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
