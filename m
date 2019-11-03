From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 3 Nov 2019 18:17:20 +0100
Subject: [Buildroot] [PATCH 06/15] package/avahi: adapt to preset-all
In-Reply-To: <CADvTj4r_o-HqfRQUOpi+6h92R=AX9kLN5yQr3y-pV8LSGKoYxQ@mail.gmail.com>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-7-jeremy.rosen@smile.fr>
 <CADvTj4r_o-HqfRQUOpi+6h92R=AX9kLN5yQr3y-pV8LSGKoYxQ@mail.gmail.com>
Message-ID: <CAFvCimX3m6+Ft=zxK-36VrB=xkLFRx4rNJG+Wpr=eMmeQTuKZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

that's probably correct, but I tried to be compatible.

Dropping that patch will do "the correct thing"

Le dim. 3 nov. 2019 ? 18:15, James Hilliard <james.hilliard1@gmail.com> a
?crit :

> On Sun, Nov 3, 2019 at 11:57 AM J?r?my Rosen <jeremy.rosen@smile.fr>
> wrote:
> >
> > avahi was not enabled, we now need to disable it explicitly
> Isn't avahi not being enabled a bug? Why do we want to have it disabled?
> >
> > Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> > ---
> >  package/avahi/50-avahi.preset | 3 +++
> >  package/avahi/avahi.mk        | 2 ++
> >  2 files changed, 5 insertions(+)
> >  create mode 100644 package/avahi/50-avahi.preset
> >
> > diff --git a/package/avahi/50-avahi.preset
> b/package/avahi/50-avahi.preset
> > new file mode 100644
> > index 0000000000..998772ea96
> > --- /dev/null
> > +++ b/package/avahi/50-avahi.preset
> > @@ -0,0 +1,3 @@
> > +disable avahi-daemon.service
> > +disable avahi-daemon.socket
> > +disable avahi-dnsconfd.service
> > diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> > index 53021f6b6d..2df63c5273 100644
> > --- a/package/avahi/avahi.mk
> > +++ b/package/avahi/avahi.mk
> > @@ -198,6 +198,8 @@ endef
> >  endif
> >
> >  define AVAHI_INSTALL_INIT_SYSTEMD
> > +       $(INSTALL) -D -m 644 package/avahi/50-avahi.preset \
> > +
>  $(TARGET_DIR)/usr/lib/systemd/system-preset/50-avahi.preset
> >         $(INSTALL) -D -m 644 package/avahi/avahi_tmpfiles.conf \
> >                 $(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
> >
> > --
> > 2.24.0.rc1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191103/0bf60974/attachment.html>
