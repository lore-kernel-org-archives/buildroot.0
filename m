From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 11:56:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/monolite: bump to version
 1050001000
In-Reply-To: <1502439245-18039-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1502439245-18039-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <44cbe2b5-2d53-9c66-15a3-5e3fbfa3b219@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-08-17 10:14, Angelo Compagnucci wrote:
> The latest version of mono carries a bit of changes in the monolite
> package: the version string changes and from now on, monolite should
> be installed in a subdirectory with the exact version string as a name.

 And does this work independently of the version bump of mono itself? I.e., if
we apply just this patch, will mono still build?

 If not, then the two patches should be squashed. If you don't have time we can
do that while applying.

 Regards,
 Arnout

> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/monolite/monolite.hash | 2 +-
>  package/monolite/monolite.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
> index 09f9554..7638ce2 100644
> --- a/package/monolite/monolite.hash
> +++ b/package/monolite/monolite.hash
> @@ -1,2 +1,2 @@
>  # sha256 locally computed
> -sha256 2cdf6cff1d82d76412461a4c8a3616bb2aa1e835fb55479941662dec3799c924  monolite-156-latest.tar.gz
> +sha256 365dc589e6d336530ef8efaa491e932c15163f449632daef6c41bed770d9fe53  monolite-1050001000-latest.tar.gz
> diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
> index 73f2352..2cc08df 100644
> --- a/package/monolite/monolite.mk
> +++ b/package/monolite/monolite.mk
> @@ -4,14 +4,14 @@
>  #
>  ################################################################################
>  
> -MONOLITE_VERSION = 156
> +MONOLITE_VERSION = 1050001000
>  MONOLITE_SITE = http://download.mono-project.com/monolite/
>  MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
>  MONOLITE_LICENSE = LGPL-2.0 or commercial
>  
>  define HOST_MONOLITE_INSTALL_CMDS
> -	mkdir -p $(HOST_DIR)/usr/lib/monolite
> -	cp $(@D)/* $(HOST_DIR)/usr/lib/monolite
> +	mkdir -p $(HOST_DIR)/usr/lib/monolite/$(MONOLITE_VERSION)
> +	cp -r $(@D)/* $(HOST_DIR)/usr/lib/monolite/$(MONOLITE_VERSION)
>  endef
>  
>  $(eval $(host-generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
