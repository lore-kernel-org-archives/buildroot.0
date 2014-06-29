From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 29 Jun 2014 14:54:42 +0300
Subject: [Buildroot] [PATCH v2] lzo: security bump to version 2.07
In-Reply-To: <20140629064513.7a946d43@core2quad.morethan.org>
References: <178793dde59515317a045893c8e0c090be510fcf.1404017271.git.baruch@tkos.co.il>
 <20140629064513.7a946d43@core2quad.morethan.org>
Message-ID: <20140629115442.GC4425@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,

On Sun, Jun 29, 2014 at 06:45:13AM -0500, Mike Zick wrote:
> On Sun, 29 Jun 2014 07:47:51 +0300
> Baruch Siach <baruch@tkos.co.il> wrote:
> 
> > Fixes CVE-2014-4607.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > v2:
> >    Rephrase the comment explaining the need for AUTORECONF (Peter).
> > ---
> >  package/lzo/lzo.mk | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
> > index 10107fea3be3..3b348a3eff30 100644
> > --- a/package/lzo/lzo.mk
> > +++ b/package/lzo/lzo.mk
> > @@ -4,11 +4,14 @@
> >  #
> >  ################################################################################
> >  
> > -LZO_VERSION = 2.06
> > +LZO_VERSION = 2.07
> >  LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
> >  LZO_LICENSE = GPLv2+
> >  LZO_LICENSE_FILES = COPYING
> >  LZO_INSTALL_STAGING = YES
> > +# Out libtool patch does not apply to bundled ltmain.sh since it's too new.
> s/out/our/

Thomas has fixed this when applying the patch.

> Two things mentioned in sentence, which of them is "too new"?
> 
>  try: "Our libtool patch is too new to apply to the bundled ltmain.sh"

Actually this is the other way around. ltmain.sh is new and our patch doesn't 
apply anymore. The lzo bump patch as already been applied (commit 
7001f391eef29). Is it worth a follow-up patch?

Thanks for reviewing,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
