From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Oct 2016 08:12:32 +0300
Subject: [Buildroot] [PATCH 2/2] libpcap: bump to version 1.8.1
In-Reply-To: <20161026233136.71e5ba28@free-electrons.com>
References: <806b12235b685b37dced54464cbd380abf091c33.1477501390.git.baruch@tkos.co.il>
 <0a7a49e96ee2626cb9d1909826751a50646630b2.1477501390.git.baruch@tkos.co.il>
 <20161026233136.71e5ba28@free-electrons.com>
Message-ID: <20161027051232.c3y33lfkcdk5qjg3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 26, 2016 at 11:31:36PM +0200, Thomas Petazzoni wrote:
> On Wed, 26 Oct 2016 20:03:10 +0300, Baruch Siach wrote:
> > Drop upstream patch.
> > 
> > Also remove ac_cv_linux_vers caching since this check was remove in upstream
> > commit f3e011b18c55ae.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  ....in-fix-detect-of-if_bonding.h-on-uclinux.patch | 30 ----------------------
> >  package/libpcap/libpcap.hash                       |  2 +-
> >  package/libpcap/libpcap.mk                         |  5 +---
> >  3 files changed, 2 insertions(+), 35 deletions(-)
> >  delete mode 100644 package/libpcap/0002-configure.in-fix-detect-of-if_bonding.h-on-uclinux.patch
> 
> This bump breaks the build of ngrep, see
> http://autobuild.buildroot.net/results/809/80982b07bddb8092accc643f2dc8105cd17ecb37/build-end.log.
> I've tested, and indeed after reverting the bump, ngrep builds fine.
> 
> Could you have a look?

Thanks for the head-up. I have posted a patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
