From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 8 Oct 2019 23:02:31 +0200
Subject: [Buildroot] glmark2 build failure
In-Reply-To: <CAOMZO5BiMG8TWDd93abA2aWXCyTZ3c7LYByg907oMCTmhqcQTg@mail.gmail.com>
References: <CAOMZO5BC0CyEpPyJxeXWYf8ZqY+K10tEQw2W5nJZ2S9viM0e4g@mail.gmail.com>
 <20191007173640.5ec12ff1@windsurf>
 <CAOMZO5BiMG8TWDd93abA2aWXCyTZ3c7LYByg907oMCTmhqcQTg@mail.gmail.com>
Message-ID: <20191008230231.11da9a76@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Mon, 7 Oct 2019 12:53:09 -0300, Fabio Estevam <festevam@gmail.com> wrote:

> Hi Thomas,
>
> On Mon, Oct 7, 2019 at 12:36 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > +Bernd in Cc.
> >
> > On Mon, 7 Oct 2019 11:01:12 -0300
> > Fabio Estevam <festevam@gmail.com> wrote:
> >
> > > --prefix=/usr --libdir=/usr/lib --prefix=/usr --with-flavors=
> >
> > --with-flavors is empty
> >
> > I guess it's a fallout of cf66a67112cd706d2e71665e45e8f6453fd53963. Do
> > you have udev enabled in your configuration ? If not that's the
>
> imx6-sabresd_qt5_defconfig does not select udev, so no, I don't have it enabled.

Changing

	System-Configuration --> /dev management --> Dyanmic using devtempfs + mdev

to

	System-Configuration --> /dev management --> Dyanmic using devtempfs + eudev

fixes the glmark2 compile failure for the imx6-sabresd_qt5_defconfig...

Regards,
Peter

>
> Regards,
>
> Fabio Estevam
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
