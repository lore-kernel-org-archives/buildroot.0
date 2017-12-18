From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Dec 2017 08:34:20 +0200
Subject: [Buildroot] [PATCH] wolfssl: new package
In-Reply-To: <CANu7NGu0P1JT4Y1YTJJcVasTfB8PouEfp1bMSFiUBYi4X+829Q@mail.gmail.com>
References: <20171212173206.vablwxvwcpjfrffn@tarshish>
 <CANu7NGt3er0OfSdH-ujY6111fdywdixTpgVRTq7C79HzZXCWvw@mail.gmail.com>
 <20171213060308.gosvafozfwqsdw4p@sapphire.tkos.co.il>
 <CANu7NGsei4G9mcvMxtRRoyp9C69Yab-n6sa5htL-+==30kLBEw@mail.gmail.com>
 <20171214064359.282d0412@windsurf.png.is.keysight.com>
 <20171214064310.zlgeattkdrphujem@sapphire.tkos.co.il>
 <CANu7NGu1FYMpNv=Jc0ZRUnwHzuY1Vgra=u==K2xw5=Jod8B2pg@mail.gmail.com>
 <87tvwt2rv0.fsf@dell.be.48ers.dk>
 <20171215082424.wz3vq5ysfzp436mk@tarshish>
 <CANu7NGu0P1JT4Y1YTJJcVasTfB8PouEfp1bMSFiUBYi4X+829Q@mail.gmail.com>
Message-ID: <20171218063420.3lfr2sne4rez2qxb@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergio,

On Fri, Dec 15, 2017 at 08:32:31AM -0200, Sergio Prado wrote:
> 2017-12-15 6:24 GMT-02:00 Baruch Siach <baruch@tkos.co.il>:
> > On Thu, Dec 14, 2017 at 05:31:47PM +0100, Peter Korsgaard wrote:
> > > >>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:
> > >  > So I see two possible options:
> > >
> > >  > 1. Completely remove these options.
> > >  > 2. Keep these options, documenting that to be useful, it needs out
> of tree
> > >  > patches that are not public and should be requested via wolfssl
> website
> > >  > contact page.
> > >
> > >  > I'm okay with both options, but I think option 2 is better because
> it will
> > >  > give Buildroot users the possibility to use wolfssl with
> > >  > nginx/lighttpd/wpa_supplicant in a way the wolfssl project intended.
> What
> > >  > do you think?
> > >
> > > If these options cannot be tested in upstream Buildroot then they imho
> > > shouldn't be there, so +1 for option 1.
> >
> > I agree that these package specific options are not useful for Buildroot.
> But
> > judging from the list of HAVE_* defines and configure options in wolfssl
> build
> > documentation chapter[1] it looks like the default build will not be
> useful to
> > many users without customization. Is there a way to expose some of this
> > flexibility to Buildroot users without forcing them to manually edit the
> .mk
> > file?
> 
> Most features that are enabled when we pass --enabled-nginx can be
> individually selected in the configure script with other options like
> --enable-sessioncerts and --enable-opensslextra.
> 
> We could create additional menu options in Buildroot so the user could
> enable these features without changing the .mk file. The wolfssl configure
> script supports more then 150 individual --enable-* options, so we would
> have to selected the most common ones.
> 
> What do you think about this approach?

That is the best we can do at the moment I guess. We can have like two or 
three build profiles that cover what most users would need.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
