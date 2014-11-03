From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Nov 2014 22:25:19 +0100
Subject: [Buildroot] [PATCH 2/4] qt5: expose a QT5_QMAKE variable for
 other Qt5 packages
In-Reply-To: <87mw8943vw.fsf@dell.be.48ers.dk>
References: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1414880111-19166-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87mw8943vw.fsf@dell.be.48ers.dk>
Message-ID: <20141103222519.7c8797e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 02 Nov 2014 23:46:43 +0100, Peter Korsgaard wrote:

>  > diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
>  > index e9c59db..2a3e274 100644
>  > --- a/package/qt5/qt5.mk
>  > +++ b/package/qt5/qt5.mk
>  > @@ -17,3 +17,6 @@ define QT5_LA_PRL_FILES_FIXUP
>  >  		$(SED) "s%-L/usr/lib%%" $$i; \
>  >  	done
>  >  endef
>  > +
>  > +# Variable for other Qt applications to use
>  > +QT5_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec devices/linux-buildroot-g++
> 
> This (and elsewhere) shows a bit of a mixup between BR2_PACKAGE_QT5 and
> qt5base - But ok, having BR2_PACKAGE_QT5 enabled without qt5base isn't
> really sensible (but is allowed by kconfig).

I hesitated between qt5.mk or qt5base.mk. I decided to go with qt5.mk,
with the following reasoning:

 * I wanted to name the variable QT5_QMAKE and not QT5BASE_QMAKE, to
   mimic what exists for qt4 (variable is named QT_QMAKE).

 * Since the variable was going to be named QT5_QMAKE, I found it would
   be odd to have it in qt5base.mk where all variables are
   QT5BASE_<foo>. So I went with qt5.mk instead.

> Should we just use BR2_PACKAGE_QT5BASE everywhere you check for BR2_PACKAGE_QT5?

Where exactly? Or shouldn't we have qt5base selected as soon as qt5 is
enabled?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
