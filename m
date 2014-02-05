From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 07:50:01 +0100
Subject: [Buildroot] [PATCH v2 1/7] xlib_libpthread-stubs: Rename
 package to libpthread-stubs
In-Reply-To: <BLU0-SMTP252A62005B331CE016C8EE7D9AA0@phx.gbl>
References: <1391537725-15894-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP252A62005B331CE016C8EE7D9AA0@phx.gbl>
Message-ID: <52F1DF19.6070200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bernd,

 Sorry I didn't review this earlier - but keep up the good work!

On 04/02/14 19:15, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
> ---
> v4: rebased v3
> v3: rebased v2
>     libdrm: rename to libpthread-stubs as well for bisectability
> v2: http://patchwork.ozlabs.org/patch/304117/ (Paul Cercueil)
> v1: http://patchwork.ozlabs.org/patch/278296/ (Spenser Gilliland)
> 
>  Config.in.legacy                                   |   15 ++++++++++++---
>  package/Config.in                                  |    1 +
>  package/libdrm/Config.in                           |    2 +-
>  package/libdrm/libdrm.mk                           |    2 +-
>  .../Config.in                                      |    2 +-
>  package/libpthread-stubs/libpthread-stubs.mk       |   20 ++++++++++++++++++++
>  package/x11r7/Config.in                            |    1 -
>  package/x11r7/libxcb/Config.in                     |    2 +-
>  package/x11r7/libxcb/libxcb.mk                     |    2 +-
>  .../xlib_libpthread-stubs/xlib_libpthread-stubs.mk |   20 --------------------
>  10 files changed, 38 insertions(+), 29 deletions(-)
>  rename package/{x11r7/xlib_libpthread-stubs => libpthread-stubs}/Config.in (88%)
>  create mode 100644 package/libpthread-stubs/libpthread-stubs.mk
>  delete mode 100644 package/x11r7/xlib_libpthread-stubs/xlib_libpthread-stubs.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 8918184..87c0b5f 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -464,11 +464,20 @@ config BR2_PACKAGE_XSERVER_tinyx
>  config BR2_PACKAGE_PTHREAD_STUBS
>  	bool "pthread-stubs option has been renamed"
>  	select BR2_LEGACY
> -	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
> -	depends on BR2_PACKAGE_XORG7
> +	select BR2_PACKAGE_LIBPTHREAD_STUBS
>  	help
>  	  For consistency reason, the pthread-stubs package has been
> -	  renamed to xlib_libpthread-stubs.
> +	  renamed to libpthread-stubs.

 Wow, so we rename this thing twice in just over a year... How good are
we! :-)

> +
> +config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS

 This should go in the 2014.02 section, otherwise it may be removed again
way too early.

 Otherwise looks good to me, so perhaps Peter can fix this up while
committing.

 Regards,
 Arnout

> +	bool "xlib-libpthread-stubs option has been renamed"
> +	depends on BR2_PACKAGE_XORG7
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_LIBPTHREAD_STUBS
> +	help
> +	  The pthread stubs do not depend on X11 nor Xlib. Thus the
> +	  package has been renamed
> +	  BR2_PACKAGE_LIBPTHREAD_STUBS
>  
>  ###############################################################################
>  comment "Legacy options removed in 2012.08"
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
