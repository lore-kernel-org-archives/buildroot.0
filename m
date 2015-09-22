From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Sep 2015 09:55:23 +0300
Subject: [Buildroot] Default configuration for Ka-Ro TX25 module
In-Reply-To: <6bee8e0798ac4666bc051d88f2064b30@IHM-PORT-E13M01.prdhosting.local>
References: <6bee8e0798ac4666bc051d88f2064b30@IHM-PORT-E13M01.prdhosting.local>
Message-ID: <20150922065523.GD2242@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Mon, Sep 21, 2015 at 11:08:22PM +0000, Matthew Kerr wrote:
> 1)      Are you aware of a default configuration which has been created for 
> the TX25 module? Or is there something similar that I should start with?

Buildroot has no specific configuration for the TX25 module.

> 2)      Is it possible to use the Ka-Ro supplied kernel source (and 
> patches/upgrades)? Should I use it or should I just let Buildroot do its 
> thing and see what happens?

You can tell Buildroot to build a kernel from vendor supplied source tree. 
Just select one of the "Custom" options, or "Local directory" in the "Kernel 
version" configuration choice.

Alternatively, you may build the kernel on your own as before, and use 
Buildroot just for the rootfs.

In any case Buildroot can't automatically build a kernel for you, since it 
lacks the required information.

> 3)      Can I do anything with the Ka-Ro supplied rootfs or should I just 
> let Buildroot generate this for me?

Buildroot supports helper mechanisms to ease local customization of generated 
rootfs, like rootfs overlay, and post build script. See 
http://nightly.buildroot.org/manual.html#customize for more details.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
