From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Aug 2014 13:55:57 +0300
Subject: [Buildroot] [PATCH v4] bandwidthd: Version bump to fix
 autobuilder errors
In-Reply-To: <53F5CD25.2030300@gmail.com>
References: <1408616695-22000-1-git-send-email-nroach44@gmail.com>
 <20140821103421.GG2405@tarshish> <53F5CD25.2030300@gmail.com>
Message-ID: <20140821105557.GI2405@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

On Thu, Aug 21, 2014 at 06:42:45PM +0800, Nathaniel Roach wrote:
> On 21/08/14 18:34, Baruch Siach wrote:
> > On Thu, Aug 21, 2014 at 06:24:55PM +0800, Nathaniel Roach wrote:
> >> Thanks to Romain Naour, we've found that certain tests
> >> in configure fail if their dependencies aren't tested for
> >> beforehand.
> >>  	depends on BR2_USE_MMU # fork()
> >> +	select BR2_PACKAGE_ZLIB
> > 
> > Is bandwidthd using libz directly? If not, libpng already selects 
> > BR2_PACKAGE_ZLIB so this may not actually be needed?
> 
> You are correct, it's only through libpng that zlib is used. I put it in
> there as a safeguard because bandwidthd's configure script does test for
> it's existence, as the libpng tests can fail without first testing for zlib.
> 
> The above issue should be covered by libpng anyway. I don't see any harm
> in it being there, but if you think it should be removed I'll undo the
> changes.

I'll let the maintainers make the final decision on that. It just feels wrong 
to workaround a libpng issue in a dependent packages. At the very least there 
should be a comment here (again) clearly stating that bandwidthd doesn't 
actually use libz, and that once the libpng issue is fixed this dependency can 
be removed.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
