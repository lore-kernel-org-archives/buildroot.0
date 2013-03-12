From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2013 07:59:02 +0100
Subject: [Buildroot] qt4 and qt5 side-by-side
Message-ID: <513ED236.20305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Qt4 and Qt5 are currently not mutually exclusive. As I just found out, 
they really are...

  Qt4 installs qt.conf in $(HOST_DIR)/usr/bin; if you use this with qt5's 
qmake, qmake will spit out bogus configuration options. As soon as you 
commit one of the other qt5 packages, you'll start to get autobuilder 
failures (which are pretty hard to debug as I can testify :-).

  For the time being, I propose to add a 'depends on !BR2_PACKAGE_QT' to
BR2_PACKAGE_QT5. Ideally, QT should become a virtual package with choices 
between qt4 and qt5.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
