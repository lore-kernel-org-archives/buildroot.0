From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Sep 2012 23:48:19 +0200
Subject: [Buildroot] [git commit] xlib_libSM: only build documentation
 if needed
In-Reply-To: <20120926212531.70C0399722@busybox.osuosl.org>
References: <20120926212531.70C0399722@busybox.osuosl.org>
Message-ID: <5064C9A3.8040305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/09/12 22:51, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=812eae5ccf281f89efba6092cb432224c0f7e89c
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Documentation generation is slow, so only create it if requested.
>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>
> ---
>   package/x11r7/xlib_libSM/xlib_libSM.mk |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
> index a8d1eff..bdbda3f 100644
> --- a/package/x11r7/xlib_libSM/xlib_libSM.mk
> +++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
> @@ -11,4 +11,9 @@ XLIB_LIBSM_INSTALL_STAGING = YES
>   XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
>   XLIB_LIBSM_CONF_OPT = --without-libuuid
>
> +ifneq ($(BR2_HAVE_DOCUMENTATION),y)
> +# documentation generation is slow
> +XLIB_LIBSM_CONF_OPT += --disable-docs
> +endif
>

Roughly 45 packages have some form of --disable-doc, with variants

--disable-doc
--disable-docs
--disable-documentation

Maybe we should just add all three to the common configure options?

Regards,
Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
