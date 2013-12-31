From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Dec 2013 13:11:38 +0200
Subject: [Buildroot] [PATCH 0/3] xtensa build fixes using
 -mtext-section-literal
In-Reply-To: <20131231115822.309acf3b@skate>
References: <cover.1388480526.git.baruch@tkos.co.il>
 <20131231115822.309acf3b@skate>
Message-ID: <20131231111138.GK8137@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Dec 31, 2013 at 11:58:22AM +0100, Thomas Petazzoni wrote:
> On Tue, 31 Dec 2013 11:07:28 +0200, Baruch Siach wrote:
> > These fixes are all similar. As the helpful linker error message says, xtensa 
> > needs -mtext-section-literal when building too large 
> > objects/libraries/binaries. So just do as we are told to.
> > 
> > Baruch Siach (3):
> >   php: fix build for xtensa
> >   lmbench: fix build for xtensa
> >   civetweb: fix build for xtensa
> > 
> >  package/civetweb/civetweb.mk | 3 +++
> >  package/lmbench/lmbench.mk   | 4 ++++
> >  package/php/php.mk           | 4 ++++
> >  3 files changed, 11 insertions(+)
> 
> All three patches applied, thanks.

Thanks.

Please also apply http://patchwork.ozlabs.org/patch/305647/ (iozone: add fix 
for missing pthread_setaffinity_np()). It fixes iozone build for xtensa as 
well 
(http://autobuild.buildroot.net/results/d54/d54012d167dc7f70c796a109f7fc659690b5c548/).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
