From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2014 23:46:43 +0100
Subject: [Buildroot] [PATCH 2/4] qt5: expose a QT5_QMAKE variable for
	other Qt5 packages
In-Reply-To: <1414880111-19166-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 1 Nov 2014 23:15:09 +0100")
References: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1414880111-19166-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mw8943vw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Much like package/qt/qt.mk exposes a QT_QMAKE variable that other
 > qmake-based Qt4 libraries/applications can use in their .mk file, this
 > commit adds a QT5_QMAKE variable to allow the same for Qt5 packages.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/qt5/qt5.mk | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
 > index e9c59db..2a3e274 100644
 > --- a/package/qt5/qt5.mk
 > +++ b/package/qt5/qt5.mk
 > @@ -17,3 +17,6 @@ define QT5_LA_PRL_FILES_FIXUP
 >  		$(SED) "s%-L/usr/lib%%" $$i; \
 >  	done
 >  endef
 > +
 > +# Variable for other Qt applications to use
 > +QT5_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec devices/linux-buildroot-g++

This (and elsewhere) shows a bit of a mixup between BR2_PACKAGE_QT5 and
qt5base - But ok, having BR2_PACKAGE_QT5 enabled without qt5base isn't
really sensible (but is allowed by kconfig).

Should we just use BR2_PACKAGE_QT5BASE everywhere you check for BR2_PACKAGE_QT5?

-- 
Bye, Peter Korsgaard
