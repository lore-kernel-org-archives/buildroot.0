From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 21:51:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/glibmm: bump to version 2.66.0
In-Reply-To: <20210314180520.850073-1-fontaine.fabrice@gmail.com>
References: <20210314180520.850073-1-fontaine.fabrice@gmail.com>
Message-ID: <20210314205121.GO2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-14 19:05 +0100, Fabrice Fontaine spake thusly:
> - Switch to meson-package as configure is not shiiped in the official

*shipped

And I incorrectly fixed that typo when pushing. Damned...

>   tarball anymore and autoreconf fails due to missing MM_ARG_xxx macros
> - Disable examples (enabled by default)
> - Update indentation in hash file (two spaces)
> 
> https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.66.0/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, along with: freerdp, mutt, libplist, libmatroska,
and bluez5_utils. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/glibmm/glibmm.hash | 8 ++++----
>  package/glibmm/glibmm.mk   | 7 +++----
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/package/glibmm/glibmm.hash b/package/glibmm/glibmm.hash
> index 021b77ef0a..389ee5c369 100644
> --- a/package/glibmm/glibmm.hash
> +++ b/package/glibmm/glibmm.hash
> @@ -1,5 +1,5 @@
> -# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.62/glibmm-2.62.0.sha256sum
> -sha256	36659f13cc73282392d1305858f3bbca46fbd1ce2f078cc9db8b9f79b2e93cfe glibmm-2.62.0.tar.xz
> +# From http://ftp.gnome.org/pub/gnome/sources/glibmm/2.66/glibmm-2.66.0.sha256sum
> +sha256  9e1db7d43d2e2d4dfa2771354e21a69a6beec7c446b711619cf8c779e13a581e  glibmm-2.66.0.tar.xz
>  # License files, locally calculated
> -sha256	3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7 COPYING
> -sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6 COPYING.tools
> +sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
> index c31c794ca2..30fbe65f6e 100644
> --- a/package/glibmm/glibmm.mk
> +++ b/package/glibmm/glibmm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GLIBMM_VERSION_MAJOR = 2.62
> +GLIBMM_VERSION_MAJOR = 2.66
>  GLIBMM_VERSION = $(GLIBMM_VERSION_MAJOR).0
>  GLIBMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>  GLIBMM_LICENSE_FILES = COPYING COPYING.tools
> @@ -12,6 +12,7 @@ GLIBMM_SOURCE = glibmm-$(GLIBMM_VERSION).tar.xz
>  GLIBMM_SITE = http://ftp.gnome.org/pub/gnome/sources/glibmm/$(GLIBMM_VERSION_MAJOR)
>  GLIBMM_INSTALL_STAGING = YES
>  GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf
> +GLIBMM_CONF_OPTS = -Dbuild-examples=false
>  
>  GLIBMM_CXXFLAGS = $(TARGET_CXXFLAGS)
>  
> @@ -19,6 +20,4 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
>  GLIBMM_CXXFLAGS += -O0
>  endif
>  
> -GLIBMM_CONF_ENV += CXXFLAGS="$(GLIBMM_CXXFLAGS)"
> -
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> -- 
> 2.30.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
