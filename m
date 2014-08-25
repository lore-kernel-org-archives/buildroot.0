From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Aug 2014 20:26:43 +0300
Subject: [Buildroot] Phidgets library and web server?
In-Reply-To: <alpine.DEB.2.02.1408241012500.2336@tavas.tkos.co.il>
References: <alpine.DEB.2.02.1408241012500.2336@tavas.tkos.co.il>
Message-ID: <20140825172643.GA29733@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Sun, Aug 24, 2014 at 10:40:39AM +0300, Jonathan Ben Avraham wrote:
> I have integrated the Phidgets (http://www.phidgets.com/)
> libphidget-2.1.8.20140319 and phidgetwebservice into my Buildroot tracking
> branch.
> 
> I have tested on x86 and i.MX287.
> 
> The Phidgets software license is LGLP Version 3. No publicly accessible
> repo, just tarball downloads.
> 
> Uses autoconf build system.
> 
> Requires glibc and libusb.
> 
> From the Phidgets site:
> 
> "Phidgets are a set of user friendly building blocks for low cost USB
> sensing and control from your PC."
> 
> My client is using Phidgets products on a custom i.MX287 board rather than a
> PC, for control of a home kitchen and restaurant appliance using GPIO's and
> ADC's. I personally have no commercial interest in Phidgets.
> 
> I can commit to maintaining for six months on arm, x86 and ppc.
> 
> My question to you is, is this the type of package that we want to add to
> Buildroot? Should I submit patches? Or is there a "contrib" dir where I
> could put the patches?

Just submit a patch.

One problem I see with libphidget is that there seems to be no way to download 
older versions. The only downloadable tarball is at 
http://www.phidgets.com/downloads/libraries/libphidget.tar.gz, which 
apparently points to the latest version. Having an automatically upgraded 
download source is strongly discouraged, as it makes the build produce 
different results at different times.

The preferred solution would be to have upstream provide access to immutable 
per-version tarballs.

An alternative solution might be to store the libphidget tarballs on the 
Buildroot backup download server (http://sources.buildroot.net).

Any other suggestions?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
