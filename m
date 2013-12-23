From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Dec 2013 12:17:52 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: new package
In-Reply-To: <20131223111146.062adc71@skate>
References: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20131223095040.GE11794@sapphire.tkos.co.il>
 <52B8083F.80005@free-electrons.com>
 <20131223095752.GF11794@sapphire.tkos.co.il>
 <20131223111146.062adc71@skate>
Message-ID: <20131223101751.GG11794@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Dec 23, 2013 at 11:11:46AM +0100, Thomas Petazzoni wrote:
> On Mon, 23 Dec 2013 11:57:52 +0200, Baruch Siach wrote:
> > > Hum, right, it got copied from bluez-utils, I'll remove it
> > 
> > Also, it seems that libglib2 doesn't need threads, only wchar.
> 
> libglib2 does need thread support:

You're right. I looked in an old branch. Sorry for the noise.

baruch

> config BR2_PACKAGE_LIBGLIB2
>         bool "libglib2"
>         select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
>         select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>         select BR2_PACKAGE_LIBFFI
>         select BR2_PACKAGE_PCRE_UCP if BR2_PACKAGE_PCRE
>         select BR2_PACKAGE_ZLIB
>         depends on BR2_USE_WCHAR # gettext
>         depends on BR2_TOOLCHAIN_HAS_THREADS

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
