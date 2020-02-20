From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 20 Feb 2020 09:10:42 +0100
Subject: [Buildroot] Qt5 Webkit fails to compile
In-Reply-To: <20200203151323.44f5d748@gmx.net>
References: <CAPmASevmB9AZ7yOMmR3dBPcc4-4Ra2NOgfGV-J=4TXy=_cxGmw@mail.gmail.com>
 <20200202194245.46e18d8e@gmx.net>
 <CAPmASevria8dFywjiy6_9ww+GCDw79k9LAmCaTz=XxwDqojjQQ@mail.gmail.com>
 <20200202220343.3164146d@gmx.net>
 <CAPmASeuDs2TE_=E+_qSf5E9PEMgfJth7e+SzbMikOZgzAeG2iA@mail.gmail.com>
 <20200203151323.44f5d748@gmx.net>
Message-ID: <20200220091042.2419fd21@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andrea,

On Mon, 3 Feb 2020 15:13:23 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Andrea,
>
> On Mon, 3 Feb 2020 11:13:30 +0100, Andrea Simeoni <andreasimeoni73@gmail.com> wrote:
>
> > Hello Peter,
> > thanks for the hints. For the first time I have the qt5webkit running on
> > RPi!
> > I get a couple of warnings at run-time:
> >
> > [0203/101010.722538:WARNING:resource_bundle_qt.cpp(116)]
> > locale_file_path.empty() for locale
> >
> > [0203/101010.834550:WARNING:resource_bundle_qt.cpp(116)]
> > locale_file_path.empty() for locale

Which executable did your run? The file resource_bundle_qt.cpp is from
qt5webengine and not from qt5webkit...., but nevertheless the warning
for qt5webengine (and the translations access) can be fixed with
the suggested buildroot patch [1]...

Regards,
Peter

[1] http://patchwork.ozlabs.org/patch/1241293

>
>
> Maybe try to run e.g.:
>
> 	$ export LANG=en_US.utf8
>
> before starting your application?
>
> Regards,
> Peter
>
> >
> >
> > but I'm not sure if they are related to Buildroot in any way.
> >
> > Best
> >
> > Andrea S.
> >
> >
> >
> > Il giorno dom 2 feb 2020 alle ore 22:03 Peter Seiderer <ps.report@gmx.net>
> > ha scritto:
> >
> > > Hello Andrea,
> > >
> > > On Sun, 2 Feb 2020 20:51:24 +0100, Andrea Simeoni <
> > > andreasimeoni73 at gmail.com> wrote:
> > >
> > > > Detected the same failure while preparing the the Qt-5.12.7 version bump,
> > > > > fixed by the following qt5webkit patch (proper buildroot patch will
> > > > > follow soon):
> > > > >
> > > >
> > > > Super fast! Great!
> > > > I've already seen the Buildroot patch(es).
> > > > What's the recommended way to apply them? It's enough to pull from master
> > > > branch on github or I have to patch the file(s) manually?
> > >
> > > The patches show up on master branch after one of the maintainers commits
> > > them
> > > (in case they are accepted), for preliminary testing your have to apply
> > > them
> > > manually, best by down loading them from patchwork ([1]), e.g. for this
> > > ones ([2], [3]):
> > >
> > >         $ curl -OJL https://patchwork.ozlabs.org/patch/1232425/mbox/
> > >         $ curl -OJL https://patchwork.ozlabs.org/patch/1232424/mbox/
> > >
> > >         $ git am
> > > v1-1-2-package-qt5webkit-convert-patch-to-git-format-and-re-number.patch
> > >         $ git am
> > > v1-2-2-package-qt5webkit-add-patch-to-fix-ICU-related-compile-failure.patch
> > >
> > > or (for non-git):
> > >
> > >         $ patch -p 1 <
> > > v1-1-2-package-qt5webkit-convert-patch-to-git-format-and-re-number.patch
> > >         $ patch -p 2 <
> > > v1-2-2-package-qt5webkit-add-patch-to-fix-ICU-related-compile-failure.patch
> > >
> > > Regards,
> > > Peter
> > >
> > > [1] https://patchwork.ozlabs.org/project/buildroot/list/
> > > [2] https://patchwork.ozlabs.org/patch/1232425/
> > > [3] https://patchwork.ozlabs.org/patch/1232424/
> > >
> > > >
> > > > Best regards
> > > > Andrea S.
> > >
> > >
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
