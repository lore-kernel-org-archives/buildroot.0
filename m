From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Aug 2019 14:57:32 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-pyqt5: add qt optional
 dependencies
In-Reply-To: <20190819143937.70ecc1d8@windsurf.home>
References: <20190818224647.11920-1-fontaine.fabrice@gmail.com>
 <20190819143937.70ecc1d8@windsurf.home>
Message-ID: <CAPi7W80GTo4EXMoaqu8jbLUAAr+_Z_zvzR_HmLqpoJkQwqiL3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le lun. 19 ao?t 2019 ? 14:39, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Mon, 19 Aug 2019 00:46:46 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > python-pyqt5 optionally depends on qt5enginio, qt5location,
> > qt5multimedia, qt5quickcontrols, qt5quickcontrols2, qt5sensors,
> > qt5serialport, qt5svg, qt5webchannel, qt5webengine, qt5webkit,
> > qt5websockets and qt5x11extras
> >
> > Fixes:
> >  - https://bugs.buildroot.org/show_bug.cgi?id=12121
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Thanks for looking so quickly into this bug report. I also had a look
> yesterday, and I think we should use the --enable option of PyQT5
> configure.py script, to force the list of modules we want to enable.
> This way, if one we enable does not work for some reason, the build
> will fail instead of silently ignoring it. It also prevents PyQt5 from
> automatically detecting which modules it should build.
I agree that this is a better solution however I'm not sufficiently
good in Qt to map all the PyQt modules to their respective
BR2_PACKAGE_QT5xxx variables (for example QtHelp, QtMultimediaWidgets,
...).
That's why I decided to just mess with the dependencies (with the
exception of QtQuick that must be disabled if opengl is not set)
>
> Also, on another note, I see we prefeed a qtdetail.out file, but
> apparently a (better?) alternative is to give a configuration file to
> PyQt5 configure.py script.
Again, as I'm not a Qt expert, I also missed this one ;-(.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
