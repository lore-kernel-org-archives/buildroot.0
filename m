From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 12 Mar 2020 10:31:10 -0700
Subject: [Buildroot] [PATCH 1/1] package/gupnp: disable introspection
In-Reply-To: <20200311193410.69589-1-fontaine.fabrice@gmail.com>
References: <20200311193410.69589-1-fontaine.fabrice@gmail.com>
Message-ID: <CAFSsvmq1PdEHT-zNqMG_nh2VnUJdQEVBYny6H9pR12FTaDU0nw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frabrice, all;


I disagree with this patch set.
I have a patch set that has been sitting for a few weeks now that
allows introspection to work with meson packages:
https://patchwork.ozlabs.org/project/buildroot/list/?series=161028

If we apply this patchset first, then we should set this package (and
it's dependencies) to check for goi and enable or disable
introspection conditionally.

On Wed, Mar 11, 2020 at 12:33 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Build fails if gobject-introspection is built before gupnp:
>
>  GISCAN   GUPnP-1.0.gir
> Couldn't find include 'GSSDP-1.0.gir' (search path: '['/nvmedata/autobuild/instance-0/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '..', '/nvmedata/autobuild/instance-0/output-1/host/share', 'gir-1.0', '/nvmedata/autobuild/instance-0/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')
>
> Fixes:
>  - http://autobuild.buildroot.org/results/ea91dab1d9a59c1aefa481c316115558a6f6e8f8
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gupnp/gupnp.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
> index 29305f0b4b..27486b09fa 100644
> --- a/package/gupnp/gupnp.mk
> +++ b/package/gupnp/gupnp.mk
> @@ -12,5 +12,6 @@ GUPNP_LICENSE = LGPL-2.0+
>  GUPNP_LICENSE_FILES = COPYING
>  GUPNP_INSTALL_STAGING = YES
>  GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
> +GUPNP_CONF_OPTS = --disable-introspection
>
>  $(eval $(autotools-package))
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
