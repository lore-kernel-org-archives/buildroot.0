From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 6 Jun 2018 07:01:31 +0300
Subject: [Buildroot] [PATCH] libbsd: bump to version 0.9.1
In-Reply-To: <20180605221634.3a53fa0b@windsurf>
References: <f54e614d6b4a1de2ab39e843ed6266828faecd15.1528222775.git.baruch@tkos.co.il>
 <20180605221634.3a53fa0b@windsurf>
Message-ID: <20180606040131.drvicwte22lzicad@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jun 05, 2018 at 10:16:34PM +0200, Thomas Petazzoni wrote:
> On Tue,  5 Jun 2018 21:19:35 +0300, Baruch Siach wrote:
> > Drop upstream patches.
> > 
> > Add a patch fixing build with musl libc.
> > 
> > Update the list of licenses based on the content of COPYING. The
> > BSD-5-Clause license is not listed by SPDX, but that is its name in the
> > COPYING file.
> 
> The license seems to really be
> 
> BSD-5-clause-Peter-Wemm
> 
> because the license text itself refers to Peter Wemm.

The libbsd COPYING fine appends the copyright holder to a number of common 
licenses like BSD-3-clause-John-Birrell and BSD-4-clause-Niels-Provos. That's 
probably because each COPYING entry lists specific files with their copyright 
holders. We usually only use the SPDX identifier string. So I don't think 
there is a reason to do that for this license.

> Yocto is really using a longer list of licenses:
> https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/libbsd/libbsd_0.8.7.bb

The full list is only in a comment, AFAICS. The actual effective line is 
rather shorter than what we have following this patch:

LICENSE = "BSD-4-Clause & ISC & PD"

> For now I've applied your patch, because it's definitely not worse
> than what we have, but perhaps we want to make it even better.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
