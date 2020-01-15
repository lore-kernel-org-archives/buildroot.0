From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 15 Jan 2020 21:57:36 +0100
Subject: [Buildroot] [PATCH v1 3/3] package/rpi-userland: bump version
 to 42ec119
In-Reply-To: <trinity-12b6b7ea-6e9e-4540-9048-5a259f7605ff-1579036665309@3c-app-mailcom-bs11>
References: <20200114094256.23174-1-ps.report@gmx.net>
 <20200114094256.23174-3-ps.report@gmx.net>
 <trinity-41871925-7822-4238-98ae-909b71ee05a8-1579005943320@3c-app-mailcom-bs09>
 <20200114152755.4123935c@gmx.net> <20200114181920.54b8bd3e@gmx.net>
 <trinity-12b6b7ea-6e9e-4540-9048-5a259f7605ff-1579036665309@3c-app-mailcom-bs11>
Message-ID: <20200115215736.5f8c581e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dagg,

On Tue, 14 Jan 2020 22:17:45 +0100, daggs <daggs@gmx.com> wrote:

> Greetings Peter,
>
> > Sent: Tuesday, January 14, 2020 at 7:19 PM
> > From: "Peter Seiderer" <ps.report@gmx.net>
> > To: daggs <daggs@gmx.com>
> > Cc: buildroot at buildroot.org, "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>, "Martin Bark" <martin@barkynet.com>, "Mahyar Koshkouei" <mahyar.koshkouei@gmail.com>, "Arthur Courtel" <arthur.courtel@smile.fr>
> > Subject: Re: [Buildroot] [PATCH v1 3/3] package/rpi-userland: bump version to 42ec119
> >
> > Hello Dagg,
> >
> > On Tue, 14 Jan 2020 15:27:55 +0100, Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > > Hello Dagg,
> > >
> > > On Tue, 14 Jan 2020 13:45:43 +0100, daggs <daggs@gmx.com> wrote:
> > >
> > > >
> > > > do note that this commit allows rpi-userland compilation on aarch64. might be a good idea to fix rpi-userland.mk and Config.in to support that.
> > > >
> > > > Dagg.
> > >
> > > Thanks for the hint, will give it a try the next days....
> >
> > But does not provide the full set of libs for the 64bit build, e.g.
> > no libegl, libgles, libopenmax, libopenvg (see e.g. [1], [2]), not
> > sure which libs all the buildroot rpi-userland dependent packages
> > expect (and if a incomplete rpi-userland is worth the 64-bit build)?
> >
>
> that is correct, libopenmax will probably not be implemented (as the devs say), mmal is supported and can be used instead.
> as for the rest, I don't think they will be supported, according to the relevant issue (https://github.com/raspberrypi/userland/issues/314), it seems that they plan to wrap the aarch64 support up with the current list. infact, I won't be surprised if one will ask for they will say to use libegl, libgles from exiting 32 bits libs.
>
> for me, 64 bit build it worthwhile because I want to use mmal with tvheadend.

O.k, will try to get a proper rpi-userland-enable-64bit patch...

>
> btw 06bc6daa02137ca72b7a2104afad81e82a44de17 includes that patch already, might be worthwhile to bump the version again.

Thanks for the hint, will send an updated patch series...

Regards,
Peter
