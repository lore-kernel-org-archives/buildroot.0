From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Apr 2017 12:57:04 +0200
Subject: [Buildroot] Qt5 build failure (beaglebone_qt5_defconfig)
Message-ID: <87f293c7-8aef-14e9-23e4-195a16b564e3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Qt5 specialists,

 For quite some time now (basically since the 5.8.0 bump I think),
beaglebone_qt5_defconfig has been failing [1]. The error is:

cd photoviewer/ && ( test -e Makefile ||
/builds/buildroot.org/buildroot/output/host/usr/bin/qmake -o Makefile
/builds/buildroot.org/buildroot/output/build/qt5declarative-5.8.0/examples/quick/demos/photoviewer/photoviewer.pro
) && /usr/bin/make -f Makefile
Project ERROR: Unknown module(s) in QT: widgets

 Probably some missing Config.in dependency, or else a missing exclusion of
demos that require widgets.

 Can someone take a look?

 Regards,
 Arnout



[1] https://gitlab.com/buildroot.org/buildroot/builds/13476094
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
