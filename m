From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 1 Jul 2021 14:41:11 -0700
Subject: [Buildroot] [PATCH 1/1] package/seatd: disable -Werror
In-Reply-To: <20210613125724.GB577852@momiji>
References: <20210612211502.594066-1-fontaine.fabrice@gmail.com>
 <20210613125724.GB577852@momiji>
Message-ID: <CAFSsvmp6pNJw53m4cNRdOXOMJLpx+3+aBotWfTQgnJi+YACnfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

Tested-by: Adam Duskett <aduskett@gmail.com>

On Sun, Jun 13, 2021 at 2:58 AM Adrian Perez de Castro
<aperez@igalia.com> wrote:
>
> On Sat, 12 Jun 2021 23:15:02 +0200 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > Disable -Werror to avoid the following build failure which is raised
> > since the addition of the package in commit
> > daae31149017cbf8b03634cfc56da132f7e1ad83
> >
> > ../seatd/seat.c: In function 'seat_activate_device':
> > ../seatd/seat.c:374:48: error: unused parameter 'client' [-Werror=unused-parameter]
> >   374 | static int seat_activate_device(struct client *client, struct seat_device *seat_device) {
> >       |                                 ~~~~~~~~~~~~~~~^~~~~~
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/0ec925aab23d83c52684f5fea7a4395c93a674c4
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
>
> > ---
> >  package/seatd/seatd.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
> > index 2abcefbfaa..bf582f0d1d 100644
> > --- a/package/seatd/seatd.mk
> > +++ b/package/seatd/seatd.mk
> > @@ -13,7 +13,8 @@ SEATD_INSTALL_STAGING = YES
> >
> >  SEATD_CONF_OPTS += \
> >       -Dman-pages=disabled \
> > -     -Dexamples=disabled
> > +     -Dexamples=disabled \
> > +     -Dwerror=false
> >
> >  ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
> >  SEATD_CONF_OPTS += -Dlogind=enabled
> > --
> > 2.30.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
