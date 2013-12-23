From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Dec 2013 11:57:52 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: new package
In-Reply-To: <52B8083F.80005@free-electrons.com>
References: <1387791444-28056-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20131223095040.GE11794@sapphire.tkos.co.il>
 <52B8083F.80005@free-electrons.com>
Message-ID: <20131223095752.GF11794@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre,

On Mon, Dec 23, 2013 at 10:54:07AM +0100, Alexandre Belloni wrote:
> On 23/12/2013 10:50, Baruch Siach wrote: 
> >> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> >> new file mode 100644
> >> index 000000000000..f0a71125e2ad
> >> --- /dev/null
> >> +++ b/package/bluez5_utils/Config.in
> >> @@ -0,0 +1,16 @@
> >> +config BR2_PACKAGE_BLUEZ5_UTILS
> >> +	bool "bluez5-utils"
> >> +	depends on !BR2_avr32
> >> +	depends on BR2_USE_WCHAR # libglib2
> >> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
> > Why alsa-lib?
> 
> Hum, right, it got copied from bluez-utils, I'll remove it

Also, it seems that libglib2 doesn't need threads, only wchar.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
