From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Mar 2016 20:33:14 +0300
Subject: [Buildroot] [PATCH] linknx: select libcurl to fix autoreconf
In-Reply-To: <20160329150549.3e9fdb7c@free-electrons.com>
References: <ad8eed5a1643cc3be56f317dcac61cb1314fc40a.1458157108.git.baruch@tkos.co.il>
 <20160329150549.3e9fdb7c@free-electrons.com>
Message-ID: <20160329173313.GR2637@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Mar 29, 2016 at 03:05:49PM +0200, Thomas Petazzoni wrote:
> On Wed, 16 Mar 2016 21:38:28 +0200, Baruch Siach wrote:
> > linknx configure.ac uses the LIBCURL_CHECK_CONFIG macro that is only defined
> > in libcurl.m4 that is part of libcurl. Select libcurl for now to fix
> > autoreconf.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/96e/96e9ae0df7ebb7ad3d748a6b518cc59570e0b995/
> > http://autobuild.buildroot.net/results/179/17971c9f8925ff8623a7d97aac8eda0c287a76c9/
> > http://autobuild.buildroot.net/results/2a8/2a8af93d6439b313b048ccac7b6cfecbb6baff55/
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> It's not super nice to have to add this mandatory dependency for
> autoreconf, but we indeed don't really have the choice. We should
> remember to revert this patch once the linknx patch gets merged
> upstream, and we bump the version. However, it seems like linknx is not
> super active upstream, so in fact things might just stay forever as they
> are today. Oh well.

A possible alternative is to have a local copy of libcurl.m4 for linknx, 
either in a patch or standalone. Would you prefer that?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
