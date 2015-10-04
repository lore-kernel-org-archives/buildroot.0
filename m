From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 4 Oct 2015 15:42:19 +0200
Subject: [Buildroot] [PATCH] libnfs: Without native RPC use libtirpc
In-Reply-To: <20151004113505.GB2633@tarshish>
References: <1443882268-9737-1-git-send-email-maxime.hadjinlian@gmail.com>
 <CAGduivwirG_RD1LfYfgekqfEphCquOr5AG9H2WKB=4Vjv7OFnQ@mail.gmail.com>
 <20151004113505.GB2633@tarshish>
Message-ID: <CAGduivzptU6E4UPtpasJhX8QbY1Sw1ys2dy-_pD7vf2DpEg9sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 4, 2015 at 1:35 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Maxime,
>
> On Sat, Oct 03, 2015 at 04:25:30PM +0200, Maxime Hadjinlian wrote:
> > There's a crappy file. Don't do git add with glob at home...
>
> Or just do
>
>    echo '*.swp' >> .git/info/exclude
>
Good point Baruch.
I'll even add it to my global gitconfig, no real reason I would ever need
to commit a swp file.

>
> baruch
>
> > On Sat, Oct 3, 2015 at 4:24 PM, Maxime Hadjinlian <
> > maxime.hadjinlian at gmail.com> wrote:
> > > Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> > > ---
> > > RFC: A few packages uses libtirpc if there's no native RPC support
> *BUT*
> > > they don't propagate the
> BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2.
> > >
> > > It was probably added later on in libtirpc, so the questions here, is
> > > what do we do with that ? Should we add the dependencies to the other
> > > packages ?
> > > Do we need some kind of mechanisms to handle that ?
> > > ---
> > >  package/libnfs/.Config.in.swp | Bin 0 -> 12288 bytes
> > >  package/libnfs/Config.in      |   8 +++++---
> > >  package/libnfs/libnfs.mk      |   4 ++++
> > >  3 files changed, 9 insertions(+), 3 deletions(-)
> > >  create mode 100644 package/libnfs/.Config.in.swp
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151004/2fe38b0e/attachment.html>
