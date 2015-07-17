From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2015 09:45:32 +0200
Subject: [Buildroot] [PATCH 2/2] wpa_supplicant: Have Hotspot 2.0 depend
 on nl80211
In-Reply-To: <20150717064101.GE3147@tarshish>
References: <20150713112947.7e14fd64@free-electrons.com>
 <1437051754-24060-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1437051754-24060-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <20150717064101.GE3147@tarshish>
Message-ID: <20150717094532.0e40060c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 17 Jul 2015 09:41:01 +0300, Baruch Siach wrote:

> >  package/wpa_supplicant/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> > index 1824f95..c163bbc 100644
> > --- a/package/wpa_supplicant/Config.in
> > +++ b/package/wpa_supplicant/Config.in
> > @@ -40,6 +40,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_EAP
> >  
> >  config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
> >  	bool "Enable HS20"
> > +	depends on BR2_PACKAGE_WPA_SUPPLICANT_NL80211
> 
> Please add the BR2_PACKAGE_LIBNL dependency here as well.

Not needed since it's a "depends on", so
BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT will anyway only be visible if
BR2_PACKAGE_WPA_SUPPLICANT_NL80211 is enabled, and if
BR2_PACKAGE_WPA_SUPPLICANT_NL80211 is enabled, then it has selected
BR2_PACKAGE_LIBNL.

Am I missing something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
