From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 8 Mar 2015 13:48:42 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/avrdude: depends on libftdi1
 instead of libftdi
In-Reply-To: <1425813964-5295-4-git-send-email-s.martin49@gmail.com>
References: <1425813964-5295-1-git-send-email-s.martin49@gmail.com>
 <1425813964-5295-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20150308114842.GB2518@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Sun, Mar 08, 2015 at 12:26:03PM +0100, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1->v2:
> - rebase
> ---
>  package/avrdude/avrdude.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index 03d6490..a4e0ebd 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -17,8 +17,8 @@ AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
>  AVRDUDE_LICENSE = GPLv2+
>  AVRDUDE_LICENSE_FILES = avrdude/COPYING
>  
> -ifeq ($(BR2_PACKAGE_LIBFTDI),y)
> -AVRDUDE_DEPENDENCIES += libftdi
> +ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
> +AVRDUDE_DEPENDENCIES += libftdi1

How do you tell avrdude to link with libftdi1 and not libftdi when both are 
built? The same question goes for openocd.

>  endif
>  
>  # if /etc/avrdude.conf exists, the installation process creates a

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
