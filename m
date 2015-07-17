From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Jul 2015 13:00:41 +0300
Subject: [Buildroot] [PATCH 2/2] wpa_supplicant: Have Hotspot 2.0 depend
 on nl80211
In-Reply-To: <20150717094532.0e40060c@free-electrons.com>
References: <20150713112947.7e14fd64@free-electrons.com>
 <1437051754-24060-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1437051754-24060-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <20150717064101.GE3147@tarshish>
 <20150717094532.0e40060c@free-electrons.com>
Message-ID: <20150717100040.GG3147@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Jul 17, 2015 at 09:45:32AM +0200, Thomas Petazzoni wrote:
> On Fri, 17 Jul 2015 09:41:01 +0300, Baruch Siach wrote:
> > >  package/wpa_supplicant/Config.in | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> > > index 1824f95..c163bbc 100644
> > > --- a/package/wpa_supplicant/Config.in
> > > +++ b/package/wpa_supplicant/Config.in
> > > @@ -40,6 +40,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_EAP
> > >  
> > >  config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
> > >  	bool "Enable HS20"
> > > +	depends on BR2_PACKAGE_WPA_SUPPLICANT_NL80211
> > 
> > Please add the BR2_PACKAGE_LIBNL dependency here as well.
> 
> Not needed since it's a "depends on", so
> BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT will anyway only be visible if
> BR2_PACKAGE_WPA_SUPPLICANT_NL80211 is enabled, and if
> BR2_PACKAGE_WPA_SUPPLICANT_NL80211 is enabled, then it has selected
> BR2_PACKAGE_LIBNL.
> 
> Am I missing something?

Right. The dependency of hotspot on libnl is no apparent at all, though. IMO, 
having here

   select BR2_PACKAGE_WPA_SUPPLICANT_NL80211
   depends on BR2_TOOLCHAIN_HAS_THREADS # libnl

and maybe also a dependency comment, would be better.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
