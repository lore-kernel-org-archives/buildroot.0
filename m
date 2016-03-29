From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Mar 2016 20:44:53 +0300
Subject: [Buildroot] [PATCH] package/libxslt: fix static build
In-Reply-To: <20160329145214.6a434016@free-electrons.com>
References: <1459199363-28640-1-git-send-email-joerg.krause@embedded.rocks>
 <20160329030113.55474130@free-electrons.com>
 <20160329145214.6a434016@free-electrons.com>
Message-ID: <20160329174453.GS2637@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Mar 29, 2016 at 02:52:14PM +0200, Thomas Petazzoni wrote:
> On Tue, 29 Mar 2016 03:01:13 +0200, Thomas Petazzoni wrote:
> > I've applied because it indeed works, but to be honest, I don't
> > understand why: I don't quite understand how this can fix the build.
> > All what this option does is:
> > 
> > AC_ARG_WITH(libxml-libs-prefix,
> >         [  --with-libxml-libs-prefix=[PFX]      Specify location of libxml libs],
> >         LIBXML_LIBS="-L$withval"
> > )
> > 
> > I.e, it will add -L$(STAGING_DIR)/usr/lib to the gcc options. But that
> > is completely useless because $(STAGING_DIR)/usr/lib is already the
> > default search path for libraries. So why does it fix the build? I
> > don't know.
> 
> Baruch has posted another patch that I believe is supposed to fix the
> same problem: http://patchwork.ozlabs.org/patch/602529/.
> 
> Baruch, J?rg, could you have a closer look at this problem, and see
> which solution, between the one from J?rg and the one from Baruch is
> actually correct ?

The libxml2 patch fixes a bug in xml2-config generation. It fixes static build 
also for raptor, and possibly other libxml2 users (for which libxml2 is only 
an optional dependency, so we don't see hard failures). So I think that the 
libxml2 patch should be applied regardless of this one.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
