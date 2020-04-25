From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2020 15:32:42 +0200
Subject: [Buildroot] [PATCH 8/8] core/show-info: report image name of
 filesystems
In-Reply-To: <20200425151202.5e6f236f@windsurf.home>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <0493cfafbdc9dd03d461d8707de2358156f9ad5d.1586592741.git.yann.morin.1998@free.fr>
 <20200425151202.5e6f236f@windsurf.home>
Message-ID: <20200425133242.GQ5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-25 15:12 +0200, Thomas Petazzoni spake thusly:
> On Sat, 11 Apr 2020 10:12:33 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > The rootfses, unlike packages, do not have stampfiles to represent
> > whether they are built or not. Indeed, we always rebuild the rootfs, and
> > there is a single step to do.
> > 
> > Hpwever, people (and scripts) who want to report on the build progress,

*However

> > will want to know whether each rootfs has been built already or not.
> > 
> > Expose in show-info the name of the file that wil contain the rootfs
> > image.
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Vadim Kochan <vadim4j@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: eeppeliteloop at gmail.com
> > ---
> >  package/pkg-utils.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> > index bcdbf568fe..a464b660ef 100644
> > --- a/package/pkg-utils.mk
> > +++ b/package/pkg-utils.mk
> > @@ -174,6 +174,10 @@ define _json-info-pkg-details
> >  endef
> >  
> >  define _json-info-fs
> > +	"image_name": $(if $($(1)_FINAL_IMAGE_NAME), \
> > +				"$($(1)_FINAL_IMAGE_NAME)", \
> > +				null \
> > +			),
> 
> Is the condition needed because of the initramfs case?

As far as I remember, yes. I forgot about it when writing the commit
log, it seems...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
