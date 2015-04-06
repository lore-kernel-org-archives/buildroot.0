From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 07 Apr 2015 01:18:26 +0200
Subject: [Buildroot] [PATCH 3/4] package/autoconf-archive: bump to
 version v2015.02.24
In-Reply-To: <1428339450-2158-3-git-send-email-romain.naour@openwide.fr>
References: <1428339450-2158-1-git-send-email-romain.naour@openwide.fr>
 <1428339450-2158-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <55231442.9010306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/15 18:57, Romain Naour wrote:
> Fix the AX_CXX_COMPILE_STDCXX_11 macro which was broken in the
> previous release.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I checked that libsigrok (which really depends on this package) still works,
but of course there could be other hidden dependencies like thrift.

 Regards,
 Arnout

> ---
> This will break packages that really depends on C++11 (like thrift).
> ---
>  package/autoconf-archive/autoconf-archive.hash | 2 +-
>  package/autoconf-archive/autoconf-archive.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
> index 9f975d5..c310f5a 100644
> --- a/package/autoconf-archive/autoconf-archive.hash
> +++ b/package/autoconf-archive/autoconf-archive.hash
> @@ -1,2 +1,2 @@
>  # Computed locally
> -sha256 dfd460d23a9690322dee29a355ea285b5774f37383d3741cf77a4ad6a11a7e81  autoconf-archive-2015.02.04.tar.xz
> +sha256 69715bdd078f552ca85e498a94543e11cb8bcdf0359e659b84d84d19372b0dc5  autoconf-archive-2015.02.24.tar.xz
> diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
> index 4479348..bd3b0c8 100644
> --- a/package/autoconf-archive/autoconf-archive.mk
> +++ b/package/autoconf-archive/autoconf-archive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -AUTOCONF_ARCHIVE_VERSION = 2015.02.04
> +AUTOCONF_ARCHIVE_VERSION = 2015.02.24
>  AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
>  AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
>  AUTOCONF_ARCHIVE_LICENSE = GPLv3+ with exception
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
