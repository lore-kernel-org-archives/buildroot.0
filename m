From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Jun 2014 07:16:43 +0300
Subject: [Buildroot] simple xtensa build fails
In-Reply-To: <20140602230010.591ed0c4@free-electrons.com>
References: <20140602062354.GB4197@waldemar-brodkorb.de>
 <20140602064030.GB4473@tarshish>
 <20140602230010.591ed0c4@free-electrons.com>
Message-ID: <20140603041643.GB4444@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jun 02, 2014 at 11:00:10PM +0200, Thomas Petazzoni wrote:
> On Mon, 2 Jun 2014 09:40:30 +0300, Baruch Siach wrote:
> > On Mon, Jun 02, 2014 at 08:23:54AM +0200, Waldemar Brodkorb wrote:
> > > a simple Xtensa build fails:
> > >  CC libc/sysdeps/linux/common/posix_fadvise.os
> > > libc/sysdeps/linux/common/posix_fadvise.c:26:29: error: unknown type
> > > name 'off64_t'
> > > libc/sysdeps/linux/common/posix_fadvise.c:26:45: error: unknown type
> > > name 'off64_t'
> > > libc/sysdeps/linux/common/posix_fadvise.c: In function
> > > 'posix_fadvise':
> > > libc/sysdeps/linux/common/posix_fadvise.c:32:2: warning: implicit
> > > declaration of function 'posix_fadvise64'
> > > [-Wimplicit-function-declaration]
> > > make[1]: *** [libc/sysdeps/linux/common/posix_fadvise.os] Error 1
> > > make[1]: Leaving directory
> > > `/home/wbx/br/output/build/uclibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c'
> > > make: ***
> > > [/home/wbx/br/output/build/uclibc-7bf35c8b7d4a1f97174eb49f47f33946b282114c/.stamp_built]
> > > Error 2
> > 
> > Snapshot uClibc build without LFS is currently broken. See 
> > http://article.gmane.org/gmane.comp.lib.uclibc.general/23714 for a fix.
> 
> Should we integrate this patch in our Xtensa and ARC uClibc patch
> series?

We actually carry this patch for the uClibc version that ARC used to default 
to. ARC no longer uses this version so I sent a patch removing it. The current 
uClibc default for ARC seems to be based on the 0.9.33 branch, which is not 
affected by this problem.

I'll look into adding this patch for the xtensa default uClibc version.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
