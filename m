From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 11 Aug 2014 18:03:16 -0400
Subject: [Buildroot] [git commit] package/fbv: Fix static linking
	against libpng
In-Reply-To: <20140811213123.B361B9D41E@busybox.osuosl.org>
References: <20140811213123.B361B9D41E@busybox.osuosl.org>
Message-ID: <CANxTyt5JN2JSp23zc=2XvNZastVtnBsG0KM-u-XTfsUi88xgfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Mon, Aug 11, 2014 at 5:30 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=a3ff0ad550ba1bfd88e66ac8209446577e889849
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Fixes
> http://autobuild.buildroot.net/results/9ca/9cacec257f979745a7d4a43224b243ee4e16f9ac/
> http://autobuild.buildroot.net/results/996/996e42396546555e9fcf0c7135aac610ccca4eee/
> http://autobuild.buildroot.net/results/c91/c918046900045c34c73e16578026cce3e6bcccf8/
>
> [Peter: adjust description, pass --static to pkg-config, only use for static linking]
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/fbv/fbv.mk |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
> index 6f41d9f..cc1dc7b 100644
> --- a/package/fbv/fbv.mk
> +++ b/package/fbv/fbv.mk
> @@ -15,6 +15,12 @@ FBV_DEPENDENCIES = # empty
>  FBV_CONFIGURE_OPTS = # empty
>  ifeq ($(BR2_PACKAGE_FBV_PNG),y)
>  FBV_DEPENDENCIES += libpng
> +
> +# libpng in turn depends on other libraries
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +FBV_CONFIGURE_OPTS += "--libs=$(shell $(PKGg_CONFIG_HOST_BINARY) --libs libpng --static)"

Er, extra "g" in "PKGg_CONFIG_HOST_BINARY" ?

Danomi -
