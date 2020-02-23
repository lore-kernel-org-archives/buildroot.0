From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 08:51:38 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/smartmontools: bump to
 version 7.1
In-Reply-To: <20200222220855.485064-1-fontaine.fabrice@gmail.com>
References: <20200222220855.485064-1-fontaine.fabrice@gmail.com>
Message-ID: <20200223075138.GD8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-22 23:08 +0100, Fabrice Fontaine spake thusly:
> - systemd optional dependency has been added in version 7.0
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/smartmontools/smartmontools.hash | 8 +++++---
>  package/smartmontools/smartmontools.mk   | 9 ++++++++-
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
> index ffa1e8f97e..bec007aabd 100644
> --- a/package/smartmontools/smartmontools.hash
> +++ b/package/smartmontools/smartmontools.hash
> @@ -1,5 +1,7 @@
> -# From http://sourceforge.net/projects/smartmontools/files/smartmontools/6.5/
> -md5	093aeec3f8f39fa9a37593c4012d3156	smartmontools-6.5.tar.gz
> -sha1	7e788b429534a4ae627858fbcc826b93402cee7e	smartmontools-6.5.tar.gz
> +# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.1/
> +md5  430cd5f64caa4524018b536e5ecd9c29  smartmontools-7.1.tar.gz
> +sha1  207dc2b50cab1c6fba7bc248665fbbe3189374e1  smartmontools-7.1.tar.gz
> +
>  # Locally computed
> +sha256  3f734d2c99deb1e4af62b25d944c6252de70ca64d766c4c7294545a2e659b846  smartmontools-7.1.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
> index bad7da2d16..77eedfabd8 100644
> --- a/package/smartmontools/smartmontools.mk
> +++ b/package/smartmontools/smartmontools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SMARTMONTOOLS_VERSION = 6.5
> +SMARTMONTOOLS_VERSION = 7.1
>  SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
>  SMARTMONTOOLS_LICENSE = GPL-2.0+
>  SMARTMONTOOLS_LICENSE_FILES = COPYING
> @@ -23,4 +23,11 @@ else
>  SMARTMONTOOLS_CONF_OPTS += --without-selinux
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +SMARTMONTOOLS_CONF_OPTS += --with-libsystemd
> +SMARTMONTOOLS_DEPENDENCIES += systemd
> +else
> +SMARTMONTOOLS_CONF_OPTS += --without-libsystemd
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.25.0
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
