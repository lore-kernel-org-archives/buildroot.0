From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Aug 2020 22:24:29 +0200
Subject: [Buildroot] qt5webengine examples build failure
Message-ID: <20200809222429.74a81f5a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Our RaspberryPi Qt5 defconfig is failing to build:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934350

The complete build log is at:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/674934350/artifacts/file/build.log

At the very end of the log, we can see:

Makefile:73: recipe for target 'sub-examples-make_first' failed
make[1]: *** [sub-examples-make_first] Error 2
make[1]: Leaving directory '/builds/buildroot.org/buildroot/output/build/qt5webengine-5.15.0'
package/pkg-generic.mk:247: recipe for target '/builds/buildroot.org/buildroot/output/build/qt5webengine-5.15.0/.stamp_built' failed
make: *** [/builds/buildroot.org/buildroot/output/build/qt5webengine-5.15.0/.stamp_built] Error 2

If we go further up:

Project ERROR: Unknown module(s) in QT: svg
cd webui/ && ( test -e Makefile || /builds/buildroot.org/buildroot/output/host/bin/qmake -o Makefile /builds/buildroot.org/buildroot/output/build/qt5webengine-5.15.0/examples/webenginewidgets/webui/webui.pro -spec devices/linux-buildroot-
g++ WEBENGINE_CONFIG+=use_system_ffmpeg WEBENGINE_CONFIG+=use_proprietary_codecs QT_CONFIG-=alsa ) && /usr/bin/make -f Makefile 
Makefile:72: recipe for target 'sub-multipage-make_first' failed
make[3]: *** [sub-multipage-make_first] Error 3
make[3]: Leaving directory '/builds/buildroot.org/buildroot/output/build/qt5webengine-5.15.0/examples/pdf'
Makefile:124: recipe for target 'sub-pdf-make_first' failed
make[2]: *** [sub-pdf-make_first] Error 2
make[2]: *** Waiting for unfinished jobs....

And even further up:

Project ERROR: Unknown module(s) in QT: svg
Makefile:47: recipe for target 'sub-pdfviewer-make_first' failed
make[3]: *** [sub-pdfviewer-make_first] Error 3
make[3]: *** Waiting for unfinished jobs....

Do we need to add qt5svg as a dependency of qt5webengine when examples
are enabled ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
