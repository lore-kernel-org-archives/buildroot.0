From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 18:27:11 +0200
Subject: [Buildroot] [PATCH for 2014.05] manual: remove contributor list
 and add copyright
In-Reply-To: <65f6151a027a1048a118.1401292259@argentina>
References: <65f6151a027a1048a118.1401292259@argentina>
Message-ID: <20140528162711.GG3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-28 17:50 +0200, Thomas De Schampheleire spake thusly:
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

Why --verbose?

>  	        -D $$(@D) $$(@D)/.build/$(1).txt
> -	-$(Q)rm -rf $$(@D)/.build
> +	#-$(Q)rm -rf $$(@D)/.build

Debug stuff left over?

Regards,
Yann E. MORIN.

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
>  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
