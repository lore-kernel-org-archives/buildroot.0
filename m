From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 14:39:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-pyqt5: add qt optional
 dependencies
In-Reply-To: <20190818224647.11920-1-fontaine.fabrice@gmail.com>
References: <20190818224647.11920-1-fontaine.fabrice@gmail.com>
Message-ID: <20190819143937.70ecc1d8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Aug 2019 00:46:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python-pyqt5 optionally depends on qt5enginio, qt5location,
> qt5multimedia, qt5quickcontrols, qt5quickcontrols2, qt5sensors,
> qt5serialport, qt5svg, qt5webchannel, qt5webengine, qt5webkit,
> qt5websockets and qt5x11extras
> 
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=12121
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for looking so quickly into this bug report. I also had a look
yesterday, and I think we should use the --enable option of PyQT5
configure.py script, to force the list of modules we want to enable.
This way, if one we enable does not work for some reason, the build
will fail instead of silently ignoring it. It also prevents PyQt5 from
automatically detecting which modules it should build.

Also, on another note, I see we prefeed a qtdetail.out file, but
apparently a (better?) alternative is to give a configuration file to
PyQt5 configure.py script.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
