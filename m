From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 14 Nov 2011 14:04:09 +0200
Subject: [Buildroot] [git commit] libxcb: don't build doxygen
 documentation
In-Reply-To: <20111114114010.05E838E1B9@busybox.osuosl.org>
References: <20111114114010.05E838E1B9@busybox.osuosl.org>
Message-ID: <20111114120409.GB13389@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Nov 14, 2011 at 11:52:48AM +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=3acf323e9e92042b34f98065b65cee16f214aa54
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> In most situations we don't care about documentation, and newer doxygen
> versions (1.7.x) seems to have issues with it, breaking the build.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  package/x11r7/libxcb/libxcb.mk |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
> index 8fb3dd3..cf01534 100644
> --- a/package/x11r7/libxcb/libxcb.mk
> +++ b/package/x11r7/libxcb/libxcb.mk
> @@ -15,11 +15,14 @@ LIBXCB_DEPENDENCIES = \
>  LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
>  LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
>  	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> +HOST_LIBXCB_CONF_OPT = --disable-build-docs
>  
>  HOST_LIBXCB_DEPENDENCIES = \
>  	host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp \
>  	host-xlib_libXau host-python
>  
> +HOST_LIBXCB_CONF_OPT = --disable-build-docs

Do we really need this line twice?

baruch

> +
>  $(eval $(call AUTOTARGETS))
>  $(eval $(call AUTOTARGETS,host))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
