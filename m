From: Koen Martens <gmc@sonologic.nl>
Date: Tue, 28 Jul 2020 08:41:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: add openssl optional
 dependency
In-Reply-To: <20200727124145.1825309-1-fontaine.fabrice@gmail.com>
References: <20200727124145.1825309-1-fontaine.fabrice@gmail.com>
Message-ID: <20200728064137.GA31488@sunra>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm still waiting for this to be approved/merged:

https://patchwork.ozlabs.org/project/buildroot/patch/20200516075313.GB31946 at coltrane/

Pending that, I'm not touching the package.

Cheers,

Koen

On Mon, Jul 27, 2020 at 02:41:45PM +0200, Fabrice Fontaine wrote:
> openssl is an optional dependency that is enabled by default since
> version 0.7.0 and
> https://github.com/capnproto/capnproto/commit/23db5e3fd91104a0b2881d8f8ab3c10bf9dd8e75
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/capnproto/capnproto.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
> index 34fb885914..2afeb8ffa3 100644
> --- a/package/capnproto/capnproto.mk
> +++ b/package/capnproto/capnproto.mk
> @@ -21,5 +21,12 @@ endif
>  # The actual source to be compiled is within a 'c++' subdirectory
>  CAPNPROTO_SUBDIR = c++
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +CAPNPROTO_CONF_OPTS += --with-openssl
> +CAPNPROTO_DEPENDENCIES += openssl
> +else
> +CAPNPROTO_CONF_OPTS += --without-openssl
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.27.0
> 
