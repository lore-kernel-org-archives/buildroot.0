From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 28 May 2014 20:28:52 +0300
Subject: [Buildroot] [PATCH v2 for-2014.05] manual: remove contributor
 list and add copyright
In-Reply-To: <d8e41c0960cd9064e59c.1401295880@argentina>
References: <d8e41c0960cd9064e59c.1401295880@argentina>
Message-ID: <20140528172852.GJ20069@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, May 28, 2014 at 06:51:20PM +0200, Thomas De Schampheleire wrote:
> As discussed on the mailing list [1], remove the limited explicit list of
> contributors in favor of the general mention of 'The Buildroot developers'.
> Add a copyright statement.
> Move the generation info to the front.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2014-May/097589.html
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> v2: remove accidental changes to manual.mk

Remove from the diffstat that is. The hunk itself is still there though.

>  docs/manual/manual.txt |  11 +++++------
>  1 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -61,9 +61,9 @@ manual-check-dependencies-$(3):
>  	$(Q)$(call MESSAGE,"Generating $(5) $(1)...")
>  	$(Q)mkdir -p $$(@D)/.build
>  	$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
> -	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
> +	$(Q)a2x $(6) --verbose -k -f $(2) -d book -L -r $(TOPDIR)/docs/images \
>  	        -D $$(@D) $$(@D)/.build/$(1).txt
> -	-$(Q)rm -rf $$(@D)/.build
> +	#-$(Q)rm -rf $$(@D)/.build

Here.

baruch

>  endef
>  
>  ################################################################################
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -4,16 +4,15 @@
>  = The Buildroot user manual
>  :toc:
>  
> -Buildroot usage and documentation by Thomas Petazzoni. Contributions
> -from Karsten Kruse, Ned Ludd, Martin Herren and others.
> +Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
> +{localtime} from git revision {sys:git rev-parse --short HEAD}
>  
> -The Buildroot manual is licensed under the GNU General Public License,
> -version 2. Refer to file
> +The Buildroot manual is written by the Buildroot developers. +
> +It is licensed under the GNU General Public License, version 2. Refer to file
>  http://git.buildroot.org/buildroot/tree/COPYING[COPYING] in the Buildroot
>  sources for the full text of this license.
>  
> -Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
> -{localtime} from git revision {sys:git rev-parse --short HEAD}
> +Copyright (C) 2004-2014 The Buildroot developers
>  
>  image::logo.png[]

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
