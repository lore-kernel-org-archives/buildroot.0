From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 Oct 2015 23:46:08 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/kodi-pvr-stalker: Needs
 jsoncpp
In-Reply-To: <XnsA526E49B29BD5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1443730437-12443-1-git-send-email-bernd.kuhls@t-online.de>
 <20151001202438.GE3337@tarshish>
 <XnsA526E49B29BD5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20151001204608.GB13467@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Thu, Oct 01, 2015 at 10:28:23PM +0200, Bernd Kuhls wrote:
> Baruch Siach <baruch@tkos.co.il> wrote in 
> news:20151001202438.GE3337 at tarshish:
> > On Thu, Oct 01, 2015 at 10:13:57PM +0200, Bernd Kuhls wrote:
> >> diff --git a/package/kodi-pvr-stalker/Config.in 
> >> b/package/kodi-pvr-stalker/Config.in
> >> index b327fd8..0e6143a 100644
> >> --- a/package/kodi-pvr-stalker/Config.in
> >> +++ b/package/kodi-pvr-stalker/Config.in
> >> @@ -1,7 +1,12 @@
> >>  config BR2_PACKAGE_KODI_PVR_STALKER
> >>       bool "kodi-pvr-stalker"
> >> +     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
> > 
> > Also BR2_INSTALL_LIBSTDCPP.
> 
> imho this is not necessary, BR2_PACKAGE_KODI_PVR_STALKER can only be selected 
> if BR2_PACKAGE_KODI is true and BR2_PACKAGE_KODI already depends on BR2
> _INSTALL_LIBSTDCPP.

In that case the comment doesn't even show when the toolchain lacks C++ 
support, so I guess you can just omit C++ from the toolchain requirements 
comment.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
