From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu, 14 Dec 2017 14:14:44 -0200
Subject: [Buildroot] [PATCH] wolfssl: new package
In-Reply-To: <20171214064310.zlgeattkdrphujem@sapphire.tkos.co.il>
References: <1513098237-18245-1-git-send-email-sergio.prado@e-labworks.com>
 <20171212173206.vablwxvwcpjfrffn@tarshish>
 <CANu7NGt3er0OfSdH-ujY6111fdywdixTpgVRTq7C79HzZXCWvw@mail.gmail.com>
 <20171213060308.gosvafozfwqsdw4p@sapphire.tkos.co.il>
 <CANu7NGsei4G9mcvMxtRRoyp9C69Yab-n6sa5htL-+==30kLBEw@mail.gmail.com>
 <20171214064359.282d0412@windsurf.png.is.keysight.com>
 <20171214064310.zlgeattkdrphujem@sapphire.tkos.co.il>
Message-ID: <CANu7NGu1FYMpNv=Jc0ZRUnwHzuY1Vgra=u==K2xw5=Jod8B2pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Baruch,

2017-12-14 4:43 GMT-02:00 Baruch Siach <baruch@tkos.co.il>:
>
> Hi Thomas, Sergio,
>
> On Thu, Dec 14, 2017 at 06:43:59AM +0100, Thomas Petazzoni wrote:
> > On Wed, 13 Dec 2017 15:21:37 -0200, Sergio Prado wrote:
> >
> > > I also discovered looking at wolfssl forums that they keep patches to
be
> > > applied in these applications, so they would work with wolfssl. And
these
> > > patches are not public [1].
> > >
> > > So, from that point of view, it does not make sense to keep these
options
> > > in the package's makefile, since it is not useful with the upstream
version
> > > of nginx, lighttpd and wpa_supplicant. What do you think?
> > >
> > > [1] https://www.wolfssl.com/forums/topic1015-nginx-wolfssl.html
> >
> > Indeed, of you can't build wolfssl against nginx without out of tree
> > patches that are not even public, I don't see the point of enabling
> > "nginx support" in wolfssl.
>
> While I agree with Thomas, I think that if there is a convenient way to
> control the wolfssl configuration then we should expose it somehow. The
list
> of HAVE_* options indicates that many, maybe even most, users will need
more
> than the default minimal configuration.

So I see two possible options:

1. Completely remove these options.
2. Keep these options, documenting that to be useful, it needs out of tree
patches that are not public and should be requested via wolfssl website
contact page.

I'm okay with both options, but I think option 2 is better because it will
give Buildroot users the possibility to use wolfssl with
nginx/lighttpd/wpa_supplicant in a way the wolfssl project intended. What
do you think?

Best regards,

Sergio Prado
Embedded Labworks
https://e-labworks.com/en
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171214/bb6580c6/attachment.html>
