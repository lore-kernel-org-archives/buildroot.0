From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 13 Jun 2018 21:16:57 +0000
Subject: [Buildroot] [PATCH] binutils: Fix glibc building for ARC with
 stock binutils 2.30
In-Reply-To: <20180613222953.23ac58db@windsurf>
References: <20180613163956.28894-1-abrodkin@synopsys.com>
 <20180613222953.23ac58db@windsurf>
Message-ID: <c2d3f37ce30daa17d69e64d3ced5bf8df803cd09.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2018-06-13 at 22:29 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 13 Jun 2018 19:39:56 +0300, Alexey Brodkin wrote:
> > There're known issues with building glibc for ARC with vanilla
> > Binutils 2.30. Adding a couple of not yet upstreamed patches
> > that solve it.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > ---
> >  ...ocation-where-GOT-information-is-col.patch | 197 ++++++++++++++++++
> >  ...ustness.-Return-FALSE-in-case-of-NUL.patch |  34 +++
> >  ...obal-symbol-is-not-an-indirect-or-wa.patch |  42 ++++
> >  ...ion-was-still-being-generated-when-s.patch |  35 ++++
> >  4 files changed, 308 insertions(+)
> >  create mode 100644 package/binutils/2.30/0010-ARC-Refactored-location-where-GOT-information-is-col.patch
> >  create mode 100644 package/binutils/2.30/0011-ARC-Improved-robustness.-Return-FALSE-in-case-of-NUL.patch
> >  create mode 100644 package/binutils/2.30/0012-ARC-Make-sure-global-symbol-is-not-an-indirect-or-wa.patch
> >  create mode 100644 package/binutils/2.30/0013-ARC-PLT-information-was-still-being-generated-when-s.patch
> 
> I've applied to master after:
> 
>  - Removing the number from the patch titles (use 'git format-patch -N'
>    please!)

Was it something we used to do before?

>  - Adjusting the numbering of patch file names. Recently, Romain Naour
>    renumbered all patches and made them Git formatted, so it would be
>    nice to keep that consistency.

I intentionally started from 10 so that a couple of more generic patches might be
squeezed before ARC-specific ones. But will keep in mind your preference for next
submissions.

Thanks for doing those fix-ups anyways!

-Alexey
