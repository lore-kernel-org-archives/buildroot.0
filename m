From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jan 2012 02:59:15 +0100
Subject: [Buildroot] [git commit] flex: unbreak host build after
	auto-host-deps change
In-Reply-To: <20120118150407.CB51890385@busybox.osuosl.org>
References: <20120118150407.CB51890385@busybox.osuosl.org>
Message-ID: <201201210259.16285.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 18 January 2012 16:02:55 Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=f009b7b93eb0bb4d766f1b0da78ba9d1bdd94bd3
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  package/flex/flex.mk |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/package/flex/flex.mk b/package/flex/flex.mk
> index df1b420..041aba8 100644
> --- a/package/flex/flex.mk
> +++ b/package/flex/flex.mk
> @@ -14,6 +14,8 @@ FLEX_INSTALL_STAGING = YES
>  FLEX_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
>  	$(if $(BR2_PACKAGE_LIBINTL),libintl)
> +# we don't have a host-gettext/libintl
> +HOST_FLEX_DEPENDENCIES =

 Maybe it would be worthwhile to instead globally remove 
host-gettext/libintl/busybox/util-linux/$(PKG) from the auto-generated 
dependencies, just like we do for automake etc.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
