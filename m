From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Nov 2014 22:39:41 +0100
Subject: [Buildroot] [PATCH 2/4] qt5: expose a QT5_QMAKE variable for
	other Qt5 packages
In-Reply-To: <20141103222519.7c8797e9@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 3 Nov 2014 22:25:19 +0100")
References: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1414880111-19166-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87mw8943vw.fsf@dell.be.48ers.dk>
 <20141103222519.7c8797e9@free-electrons.com>
Message-ID: <87fve02cbm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> This (and elsewhere) shows a bit of a mixup between BR2_PACKAGE_QT5 and
 >> qt5base - But ok, having BR2_PACKAGE_QT5 enabled without qt5base isn't
 >> really sensible (but is allowed by kconfig).

 > I hesitated between qt5.mk or qt5base.mk. I decided to go with qt5.mk,
 > with the following reasoning:

 >  * I wanted to name the variable QT5_QMAKE and not QT5BASE_QMAKE, to
 >    mimic what exists for qt4 (variable is named QT_QMAKE).

 >  * Since the variable was going to be named QT5_QMAKE, I found it would
 >    be odd to have it in qt5base.mk where all variables are
 >    QT5BASE_<foo>. So I went with qt5.mk instead.

Ok.

 >> Should we just use BR2_PACKAGE_QT5BASE everywhere you check for BR2_PACKAGE_QT5?

 > Where exactly? Or shouldn't we have qt5base selected as soon as qt5 is
 > enabled?

Well, that's perhaps the easiest solution, yes. Having qt5 enabled but
not qt5base doesn't make any sense.

Will you send an updated series or should I do that here?

-- 
Bye, Peter Korsgaard
