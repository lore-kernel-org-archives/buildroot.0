From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 Dec 2017 15:11:08 +0200
Subject: [Buildroot] [PATCH] eeprog: fix homepage link
In-Reply-To: <20171231135433.1d0b98a9@windsurf>
References: <5d4e572b6a29cdf484a8df1562993d68206022dd.1514719506.git.baruch@tkos.co.il>
 <20171231124812.2e20d6e0@windsurf>
 <20171231122618.ezq72ybk2rem2wvv@sapphire.tkos.co.il>
 <20171231135433.1d0b98a9@windsurf>
Message-ID: <20171231131108.3ulaftfta3ohm3pk@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Dec 31, 2017 at 01:54:33PM +0100, Thomas Petazzoni wrote:
> On Sun, 31 Dec 2017 14:26:18 +0200, Baruch Siach wrote:
> > > Applied to master, thanks. However, do we still need this package, now
> > > that i2c-tools also builds/installs eeprog ?  
> > 
> > Probably not.
> 
> Do they provide the same features ?

They are both based on the same code. It looks like i2c-tools adopted eeprog 
after the last eeprog release in February 2004.

> > Event worse. When both i2c-tools and eeprog are enabled, the target 
> > /usr/bin/eeprog depends on the build order. Has the autobuilder caught 
> > this file overwrite?
> 
> It will, be currently such errors are not errors, but warnings: they
> don't make the build fail. Yann recently posted a patch that would
> allow to turn such warnings into errors, but there are so many of such
> overwrites today that enabling such an option in the autobuilders would
> turn almost all results to NOK.
> 
> > Are you OK with dropping eeprog? Matt?
> 
> I don't use eeprog, so I don't really care. But if the standalone
> eeprog and the one on i2c-tools are equivalent, I think it makes sense
> to keep the one from i2c-tools.

OK. Let's give Matt some time to recover from the holidays and respond before 
I send a patch to remove the eeprog package.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
