From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Jun 2014 13:39:31 +0300
Subject: [Buildroot] Drivers for Realtek WLAN dongles
In-Reply-To: <20140630121735.41fa221b@free-electrons.com>
References: <53B12F66.7010508@relinux.de>
 <20140630121735.41fa221b@free-electrons.com>
Message-ID: <20140630103931.GF4425@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jun 30, 2014 at 12:17:35PM +0200, Thomas Petazzoni wrote:
> On Mon, 30 Jun 2014 11:35:34 +0200, Stephan Hoffmann wrote:
> > did anyone download and compile drivers from realtek's website using
> > buildroot?
> > 
> > While
> > http://www.armadeus.com/wiki/index.php?title=USB_to_WiFi_adapter#Chipset_RTL8188CUS
> > gives a recipe to do this by hand I need an integration in buildroot for
> > my current project.
> > 
> > I searched the web but did not find anything, but maybe someone has a
> > not yet published solution. If not I will start my own patchset for this.
> 
> Are you sure you need an out-of-tree driver for this? I see the
> mainline rtlwifi driver supports a number of rtl8188cus dongles. Which
> specific model do you have? Which USB vendor/product ID?

Some mainline Realtek WiFi drivers do not support AP mode properly, 
unfortunately. See 
http://lists.shmoo.com/pipermail/hostap/2014-June/030533.html. So there is a 
use case for out of tree drivers like https://github.com/robertalks/rt8192cu.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
