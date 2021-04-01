From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 1 Apr 2021 09:38:36 -0700
Subject: [Buildroot] [PATCH] package/mender: add nodbus to tags if dbus
 is not selected
In-Reply-To: <20210401175910.13b92177@windsurf.home>
References: <20210401154453.144605-1-aduskett@gmail.com>
 <20210401154453.144605-3-aduskett@gmail.com>
 <20210401175910.13b92177@windsurf.home>
Message-ID: <CAFSsvmqYUES+pdgE8+QJjd=TRPVTwPM-E5R8-R6JKe0JaLGbeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas;

It looks like passing nodbus disables building the following files:
./dbus/dbus_libgio_helpers.go
./dbus/error.go
./dbus/dbus_libgio_test.go
./dbus/dbus_libgio.go
./dbus/dbus_test.go
./dbus/error_test.go

It also looks like if dbus isn't found, config.DBus.Enabled is set
to false in config.go. Although it's probably better to err on the
side of caution and follow the README.md's instructions yeah?

Adam

On Thu, Apr 1, 2021 at 8:59 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu,  1 Apr 2021 08:44:53 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > The README.md file suggests passing "nodbus" as a tag if dbus is not selected.
> >
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
>
> Interesting. What does it do, if D-Bus is not a build dependency, what
> there is to enable/disable within the Mender code base?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
