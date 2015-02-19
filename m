From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 20 Feb 2015 00:04:00 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: fix static build with gettext
In-Reply-To: <20150219225818.63fccb6f@free-electrons.com>
References: <be7f33ed40d541fb09ae8582b83f3b5c39d5dd27.1424175644.git.baruch@tkos.co.il>
 <20150219225818.63fccb6f@free-electrons.com>
Message-ID: <20150219220400.GP2937@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Feb 19, 2015 at 10:58:18PM +0100, Thomas Petazzoni wrote:
> On Tue, 17 Feb 2015 14:20:44 +0200, Baruch Siach wrote:
> > gettext needs -pthread. Incidentally this change was also made in the package
> > Makefile itself for a different reason.
> > 
> > Also, drop -lm to match upstream change.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/a53/a53f31355e955c734010922b47084605e13708ef/
> > http://autobuild.buildroot.net/results/43d/43deeeda31d9750b37e1f1058c3313a387843bee/
> > 
> > and more.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/btrfs-progs/btrfs-progs.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied, thanks!
> 
> > -BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lm -lz -llzo2 -L. -lintl"
> > +BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lz -llzo2 -L. -lintl -pthread"
> 
> This is really ugly, because we have to duplicate the lib_LIBS value
> from the package Makefile, and whenever it gets changed in the package
> Makefile, we need to remember to also change it here. Not great :-/

This is temporary. Upstream switched to autotools for the next version (now at 
v3.19-rc2). Once we upgrade the usual LIBS= trick would be enough, I believe.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
