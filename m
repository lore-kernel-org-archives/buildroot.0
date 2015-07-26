From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Jul 2015 01:58:12 +0300
Subject: [Buildroot] [PATCH] mosh: don't show dependencies comment on
 unsupported arches
In-Reply-To: <CA+h8R2rr7mUx0PxbQ7iQbk5jcsM73o+So06k2-hOvoN4yGsFxw@mail.gmail.com>
References: <b994c845f6e1f42f7a88e70dfffb4b00ce6d134e.1437949287.git.baruch@tkos.co.il>
 <20150726223802.GP3770@free.fr>
 <CA+h8R2rr7mUx0PxbQ7iQbk5jcsM73o+So06k2-hOvoN4yGsFxw@mail.gmail.com>
Message-ID: <20150726225812.GM17029@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Sun, Jul 26, 2015 at 10:41:54PM +0000, Christian Stewart wrote:
> Not sure how I missed that.
> 
> Thanks!
> Christian
> 
> Acked-by: "Christian Stewart" <c <yann.morin.1998@free.fr>hristian at paral.in>

Something went wrong here, I think.

baruch

> On Sun, Jul 26, 2015 at 3:38 PM Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> 
> > Baruch, All,
> >
> > On 2015-07-27 01:21 +0300, Baruch Siach spake thusly:
> > > Cc: Christian Stewart <christian@paral.in>
> > > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >
> > Thanks for spotting that! :-)
> >
> > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > Regards,
> > Yann E. MORIN.
> >
> > > ---
> > >  package/mosh/Config.in | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/package/mosh/Config.in b/package/mosh/Config.in
> > > index 2f5214cd3c88..4ad7d61023b6 100644
> > > --- a/package/mosh/Config.in
> > > +++ b/package/mosh/Config.in
> > > @@ -1,5 +1,6 @@
> > >  comment "mosh needs a toolchain w/ threads"
> > >       depends on !BR2_TOOLCHAIN_HAS_THREADS
> > > +     depends on !(BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64)
> > >
> > >  config BR2_PACKAGE_MOSH
> > >       bool "mosh"

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
