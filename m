From: Carlos Santos <unixmania@gmail.com>
Date: Tue, 19 Nov 2019 08:38:16 -0300
Subject: [Buildroot] [PATCH v2 next] package/tar: bump target version to
 1.32 (host is kept at 1.29)
In-Reply-To: <20191119091834.481ae4c1@windsurf.home>
References: <20191119011656.23740-1-unixmania@gmail.com>
 <20191119091834.481ae4c1@windsurf.home>
Message-ID: <CAJ4jsaeet+YmWgE7JLfVHfhQ15PBPiBs+pP00Ef3e57J57UV9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 19, 2019 at 5:18 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 18 Nov 2019 22:16:56 -0300
> unixmania at gmail.com wrote:
>
> > From: LUC CRETI <luc.creti@atos.net>
>
> Would be nicer to have a author name capitalized in a more traditional
> way, i.e "Luc Creti"

I left leave the name as it was in the original patch, since I don't
know the author and maybe he prefers his name written that way. There
are other caes, e.g. Yann E. MORIN.

> > diff --git a/package/tar/tar.hash b/package/tar/tar.hash
> > index 60309bab8f..c87be596b1 100644
> > --- a/package/tar/tar.hash
> > +++ b/package/tar/tar.hash
> > @@ -1,4 +1,5 @@
> >  # Locally calculated after checking signature
> >  sha256       402dcfd0022fd7a1f2c5611f5c61af1cd84910a760a44a688e18ddbff4e9f024        tar-1.29.tar.xz
>
> This hash is no longer needed I believe.
>
> > +sha256       d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8        tar-1.32.tar.xz
> >  sha256       9173f222464dd3676118408840da5990527062b5c7daf6487bed7c396c45bfb1        tar-1.29.cpio.gz
> >  sha256       8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903        COPYING
> > diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> > index 6f609d7a02..87af8073f2 100644
> > --- a/package/tar/tar.mk
> > +++ b/package/tar/tar.mk
> > @@ -4,7 +4,8 @@
> >  #
> >  ################################################################################
> >
> > -TAR_VERSION = 1.29
> > +HOST_TAR_VERSION=1.29
>
> Spaces around = sign.

Hum, shouldn't check-package detect this?

> Maybe we should take this opportunity (or the opportunity of another
> commit) to add a comment in the .mk file that explains why the host-tar
> package is kept at 1.29 and not bumped to any higher version ?

Sure, I will add the comment.

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Carlos Santos <unixmania@gmail.com>
