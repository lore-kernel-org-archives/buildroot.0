From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Nov 2013 11:02:15 +0200
Subject: [Buildroot] [PATCH v2] libnspr: Add dependency on !BR2_xtensa
In-Reply-To: <20131127092720.77f97fd0@skate>
References: <d1411c9410eaa1ebe9389cb5c20f4209b96a041f.1385530164.git.baruch@tkos.co.il>
 <20131127092720.77f97fd0@skate>
Message-ID: <20131127090215.GX32436@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 27, 2013 at 09:27:20AM +0100, Thomas Petazzoni wrote:
> On Wed, 27 Nov 2013 07:29:24 +0200, Baruch Siach wrote:
> > From: Chris Zankel <chris@zankel.net>
> > 
> > Xtensa is not yet supported in libnspr. Also add dependencies to
> > libnss, which requires libnspr, and ecryptfs-utils, which requires
> > libnss.
> > 
> > Fixes
> > http://autobuild.buildroot.net/results/14b/14ba6426edbffa100de924aa69157b3f59368ff2/
> > 
> > [baruch: fix summary, add autobuild referench, add comment dependency]
> > 
> > Signed-off-by: Chris Zankel <chris@zankel.net>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Thanks! However, I wonder if it's not actually easier to include a
> patch to libnspr to add Xtensa support. See
> http://patchwork.ozlabs.org/patch/291080/ for a patch that adds NIOS2
> support, for example.

That would obviously be better, but I can't properly test a patch adding 
libnspr xtensa support at the moment. Note that xtensa has BE and LE variants, 
so it's a little more involved that the nios patch.

> That being said, I'm fine with having libnspr disabled on Xtensa, as I
> don't believe that many people will care about
> libnspr/libnss/ecryptfs-utils.

It seems like blackfin needs the same treatment 
(http://autobuild.buildroot.net/results/dd353703ed94cec48cd126d80cd2f1b039811be4/).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
