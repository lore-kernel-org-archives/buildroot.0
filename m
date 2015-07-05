From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 15:33:22 +0200
Subject: [Buildroot] [PATCH v8 4/7] package/opencv: add qt5 support
In-Reply-To: <CAHXCMML=1J6=y1MFGetN19GAC_jMUEprzedFsJhn-Tp46B5V0Q@mail.gmail.com>
References: <1436089229-21103-1-git-send-email-s.martin49@gmail.com>
 <1436089229-21103-5-git-send-email-s.martin49@gmail.com>
 <20150705145759.50e1409f@free-electrons.com>
 <CAHXCMML=1J6=y1MFGetN19GAC_jMUEprzedFsJhn-Tp46B5V0Q@mail.gmail.com>
Message-ID: <20150705153322.4fd06f32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 5 Jul 2015 15:01:40 +0200, Samuel Martin wrote:

> >> -comment "qt4 needs a toolchain w/ C++"
> >> +comment "qt4 support needs qt"
> >>       depends on BR2_USE_MMU # qt
> >> -     depends on !BR2_INSTALL_LIBSTDCPP
> >> +     depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
> >
> > Why !qt && !qt5 ?
> >
> > Just do depends on !qt. Remember, you are inside a choice, so anyway the
> > user can only select *either* qt4 *or* qt5.
> 
> Because in BR, we don't support both qt4 and qt5 enabled at the same time.
> So if Qt5 is already enabled in the package selection, this comment
> should not be visible; hence the !qt5

Hum, ok. One could say that we could use just "depends on !qt", and
then have the user be smart enough to realize that if he wants to
enable qt, he has to disable qt5.

But ok, fair enough. What about the other comments I made on the same
patch?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
