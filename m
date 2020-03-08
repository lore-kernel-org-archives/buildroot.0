From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 8 Mar 2020 10:18:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5: add qt5remoteobjects
 library
In-Reply-To: <106f0ce4-14ce-3ae6-5a9b-4d47d0c8c505@leiderfischer.de>
References: <8ef0b851-e4b8-d2dd-28b8-190ab67dae8c@leiderfischer.de>
 <20200307230033.4dc4afcf@gmx.net>
 <106f0ce4-14ce-3ae6-5a9b-4d47d0c8c505@leiderfischer.de>
Message-ID: <20200308101821.7e2e9b27@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

On Sun, 8 Mar 2020 03:30:26 +0100, Sven Fischer <sven@leiderfischer.de> wrote:

> Hi Peter,
>
> Am 07.03.20 um 23:00 schrieb Peter Seiderer:
> > despite the line-wrapped/e-mail client problems some basic review...
> >
> > Subject should be:
> >
> > package/qt5remoteobjects: new package
> But it is not a new package, but a sub-package for Qt5. That's the
> reason for the subject. But I can write any subject you like ;-)

I see..., but from the buildroot perspective it is a 'new package', and
the de-facto standard of buildroot, see e.g.:

$ git log --oneline package/qt5/qt5serialport | tail -1

> > On Sat, 7 Mar 2020 16:19:12 +0100, Sven Fischer <sven@leiderfischer.de> wrote:
> >
> >> Qt 5.12 adds a library for IPC. This library is missing from the
> >> distributed qt5 package. Added it by using the library qt5serialport as
> >> a template and replaced serialport with remoteobjects, recalculated the
> >> sha256 sums.
> > All but the first sentence is better moved to patch cover-letter
> > or note below the first '---' (see below for example)...
> >
> >> Signed-off-by: Sven Fischer <sven@leiderfischer.de>
> >> ---
> > Notes:
> >   - Added it by using the library qt5serialport as a template and replaced
> >     serialport with remoteobjects, recalculated the sha256 sums.
> >
> >
> >> +QT5REMOTEOBJECTS_SOURCE =
> >> qtremoteobjects-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5REMOTEOBJECTS_VERSION).tar.xz
> >> +QT5REMOTEOBJECTS_DEPENDENCIES = qt5base
> > $ find build/qt5remoteobjects-5.12.7 -name "*.pro" | xargs grep QT
> >
> > build/qt5remoteobjects-5.12.7/src/imports/compat/compat.pro:QT += qml remoteobjects
> >
> > --> at least an optional dependency is missing
> Okay, trying to find out what to add to have the qtHaveModule(quick)
> condition satisfied...

It is the qt5declarative buildroot package, interesting is if it is
optional or not...

Regards,
Peter

> > Otherwise looks good (and compiles)...
>
> Thx.
>
> Regards, Sven
>
