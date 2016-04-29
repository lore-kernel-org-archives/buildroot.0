From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 29 Apr 2016 11:30:23 +0200
Subject: [Buildroot] Qt5.6 no text rendered
In-Reply-To: <eb2ed3f2-4aa6-5ff3-4052-df67bc17fc3c@progel.net>
References: <eb2ed3f2-4aa6-5ff3-4052-df67bc17fc3c@progel.net>
Message-ID: <trinity-f163fb80-19a5-4df5-864e-d2fe10260c70-1461922223398@3capp-gmx-bs73>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mattia,

> Gesendet:?Freitag, 29. April 2016 um 10:56 Uhr
> Von:?"Mattia Adducchio" <m.adducchio@progel.net>
> An:?buildroot at busybox.net
> Betreff:?[Buildroot] Qt5.6 no text rendered
> 
> Hi,
> I compiled buildroot for raspi2 with QT5 libraries, OpenGL API, OpenGL module, fontconfig and some others qt module.
> I have no problem to cross-compile my application but when it run on raspbian2 the widgets are displayed correctly, but no text > is shown.
> I also tried to compile Qt's examples but the result is the same.
> I'm trying to googling but I find only this[https://forum.qt.io/topic/43702/buildroot-qt5-no-fonts-rendered/2] old post.
> My buildroot version is the last stable 2016-02.

With QT5.6 there are no (more) default fonts deliverd/installed.

One solution is to enable:

BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_DEJAVU=y (or any other font package)

Or find a package providing the basic legacy Qt fonts...

Regards,
Peter

> Thank you,
> Mattia
?
