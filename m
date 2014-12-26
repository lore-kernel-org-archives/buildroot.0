From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 26 Dec 2014 06:40:06 +0200
Subject: [Buildroot] [PATCH 1/2] libvncserver: bump version to 0.9.10
In-Reply-To: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
References: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20141226044006.GT6400@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Floris,

On Fri, Dec 26, 2014 at 01:46:14AM +0100, Floris Bos wrote:
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  .../libvncserver-0001-CVE-2014-6051-6052.patch     |  85 ------------
>  .../libvncserver-0002-CVE-2014-6053.patch          |  21 ---
>  .../libvncserver-0003-CVE-2014-6054.patch          |  87 ------------
>  .../libvncserver-0004-CVE-2014-6055.patch          | 150 ---------------------
>  package/libvncserver/libvncserver.mk               |   5 +-
>  5 files changed, 3 insertions(+), 345 deletions(-)
>  delete mode 100644 package/libvncserver/libvncserver-0001-CVE-2014-6051-6052.patch
>  delete mode 100644 package/libvncserver/libvncserver-0002-CVE-2014-6053.patch
>  delete mode 100644 package/libvncserver/libvncserver-0003-CVE-2014-6054.patch
>  delete mode 100644 package/libvncserver/libvncserver-0004-CVE-2014-6055.patch

[snip]

> diff --git a/package/libvncserver/libvncserver.mk 
> b/package/libvncserver/libvncserver.mk
> index 99d757b..b26d5b9 100644
> --- a/package/libvncserver/libvncserver.mk
> +++ b/package/libvncserver/libvncserver.mk
> @@ -4,13 +4,14 @@
>  #
>  ################################################################################
>  
> -LIBVNCSERVER_VERSION = 0.9.9
> +LIBVNCSERVER_VERSION = 0.9.10
>  LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
> -LIBVNCSERVER_SITE = http://downloads.sourceforge.net/project/libvncserver/libvncserver/$(LIBVNCSERVER_VERSION)
> +LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
>  LIBVNCSERVER_LICENSE = GPLv2+
>  LIBVNCSERVER_LICENSE_FILES = COPYING
>  LIBVNCSERVER_INSTALL_STAGING = YES
>  LIBVNCSERVER_CONFIG_SCRIPTS = libvncserver-config
> +LIBVNCSERVER_AUTORECONF = YES

Why is this needed? Please explain in a comment.

baruch

>  # only used for examples
>  LIBVNCSERVER_CONF_OPTS += --with-sdl-config=/bin/false

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
