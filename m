From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Apr 2016 00:16:29 +0200
Subject: [Buildroot] [PATCH v12 29/31] package/flite: bump version to
 2.0.0
In-Reply-To: <1460281299-2385-30-git-send-email-bernd.kuhls@t-online.de>
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
 <1460281299-2385-30-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <570EC53D.5020606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/10/16 11:41, Bernd Kuhls wrote:
> Freeswitch contains mod_flite which needs flite >= 2.0.0 detected by
> pkgconf, its support was added by the freeswitch project so we switch
> to the freeswitch support deps repo:
> https://freeswitch.org/stash/projects/SD

  So, we would be switching to a fork? I don't like that very much... I tend to 
prefer sticking with the upstream flite-2.0.0 release, and add patches if 
needed. However, a quick look shows that the differences are pretty large, so 
it's probably not an option. But then, switching to a fork is even less 
attractive... But then again, the real upstream is not very active, while the 
freeswitch fork is really active.

  Either way, it's ugly :-(

  If it's really just about the pkg-config support, can't we just add a .pc file 
ourselves? After bumping to the upstream flite-2.0.0 of course.

>
> Removed 0001-now-honor-DESTDIR-env.-var.patch, not needed anymore.
> Rebased and renumbered the remaining patches.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   ...lsa-static.patch => 0001-fix-alsa-static.patch} |  4 +--
>   .../flite/0001-now-honor-DESTDIR-env.-var.patch    | 30 ----------------------
>   ...eck.patch => 0002-fix-alsa-version-check.patch} |  4 +--
>   package/flite/flite.hash                           |  2 --
>   package/flite/flite.mk                             | 24 +++--------------
>   5 files changed, 8 insertions(+), 56 deletions(-)
>   rename package/flite/{0002-fix-alsa-static.patch => 0001-fix-alsa-static.patch} (77%)
>   delete mode 100644 package/flite/0001-now-honor-DESTDIR-env.-var.patch
>   rename package/flite/{0003-fix-alsa-version-check.patch => 0002-fix-alsa-version-check.patch} (90%)
>   delete mode 100644 package/flite/flite.hash
>
> diff --git a/package/flite/0002-fix-alsa-static.patch b/package/flite/0001-fix-alsa-static.patch
> similarity index 77%
> rename from package/flite/0002-fix-alsa-static.patch
> rename to package/flite/0001-fix-alsa-static.patch
> index 12adb9e..de088ad 100644
> --- a/package/flite/0002-fix-alsa-static.patch
> +++ b/package/flite/0001-fix-alsa-static.patch
> @@ -3,8 +3,8 @@ Use pkg-config to determine alsa link flags. This fixes static linking.
>   Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>
>   diff -Nuar flite-1.4-release.orig/configure.in flite-1.4-release/configure.in
> ---- flite-1.4-release.orig/flite-1.4-release/configure.in	2009-08-14 23:46:38.000000000 +0300
> -+++ flite-1.4-release/flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
> +--- flite-1.4-release/configure.in	2009-08-14 23:46:38.000000000 +0300
> ++++ flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300

  It's a bit weird to still have flite-1.4 when the version is actually 2.0... 
Perhaps convert to git patches?

>   @@ -275,7 +275,10 @@
>                    #endif],
>                  [AUDIODRIVER="alsa"

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
