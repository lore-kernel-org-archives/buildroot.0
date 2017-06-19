From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 19 Jun 2017 16:34:44 +0300
Subject: [Buildroot] [PATCH 1/1] fcgiwrap: Disable -Werror in CFLAGS set
 by configure.
In-Reply-To: <20170619132513.11518-1-thomas.claveirole@green-communications.fr>
References: <20170619132513.11518-1-thomas.claveirole@green-communications.fr>
Message-ID: <20170619133444.a6rx5nlqupwcsm6j@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jun 19, 2017 at 03:25:13PM +0200, Thomas Claveirole wrote:
> fcgiwrap's configure script appends -Werror to AM_CFLAGS, then use it
> to build the package.  This is an issue when Buildroot supports a new
> compiler version and this version makes some warnings appear.
> Luckily, one can provide CFLAGS=-Wno-error to the configure script so
> it appends -Wno-error to AM_CFLAGS.

Please add a reference to the autobuild failure:

http://autobuild.buildroot.net/results/8e0/8e04bf5a85ecd7f120bc9dedeedc891def6c46c1/

baruch

> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/fcgiwrap/fcgiwrap.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
> index dd74c1ef72..c080a1ae49 100644
> --- a/package/fcgiwrap/fcgiwrap.mk
> +++ b/package/fcgiwrap/fcgiwrap.mk
> @@ -10,6 +10,7 @@ FCGIWRAP_DEPENDENCIES = host-pkgconf libfcgi
>  FCGIWRAP_LICENSE = MIT
>  FCGIWRAP_LICENSE_FILES = COPYING
>  FCGIWRAP_AUTORECONF = YES
> +FCGIWRAP_CONF_OPTS += CFLAGS=-Wno-error
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  FCGIWRAP_DEPENDENCIES += systemd

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
