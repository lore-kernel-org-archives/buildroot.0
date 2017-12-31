From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 Dec 2017 14:26:18 +0200
Subject: [Buildroot] [PATCH] eeprog: fix homepage link
In-Reply-To: <20171231124812.2e20d6e0@windsurf>
References: <5d4e572b6a29cdf484a8df1562993d68206022dd.1514719506.git.baruch@tkos.co.il>
 <20171231124812.2e20d6e0@windsurf>
Message-ID: <20171231122618.ezq72ybk2rem2wvv@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Dec 31, 2017 at 12:48:12PM +0100, Thomas Petazzoni wrote:
> On Sun, 31 Dec 2017 13:25:06 +0200, Baruch Siach wrote:
> > The current link leads to a 400 Bad Request error page.
> > 
> > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/eeprog/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to master, thanks. However, do we still need this package, now
> that i2c-tools also builds/installs eeprog ?

Probably not. Event worse. When both i2c-tools and eeprog are enabled, the 
target /usr/bin/eeprog depends on the build order. Has the autobuilder caught 
this file overwrite?

Are you OK with dropping eeprog? Matt?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
