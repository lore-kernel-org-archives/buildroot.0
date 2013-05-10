From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:22 +0200
Subject: [Buildroot] [PATCH 00/16] Handle more <pkg>-config scripts
Message-ID: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The allyespackageconfig build has revealed a number of packages that
are still installing a <pkg>-config script in target/usr/bin. This
patch series converts those packages to use the <pkg>_CONFIG_SCRIPTS
mechanism where appropriate, or to manual removal when
<pkg>_CONFIG_SCRIPTS is not appropriate (it's the case for
Python2/Python3).

Best regards,

Thomas

Thomas Petazzoni (16):
  libcgicc: handle cgicc-config script
  fltk: handle fltk-config script
  gsl: handle gsl-config script
  imlib2: handle imlib2-config script
  libart: handle libart2-config script
  libcdaudio: handle libcdaudio-config script
  libesmtp: handle libesmtp-config script
  libftdi: handle libftdi-config script
  libvncserver: handle libvncserver-config script
  netatalk: handle netatalk-config script
  netsnmp: handle net-snmp-config script
  liblog4c-localtime: remove whitespace at beginning of lines
  liblog4c-localtime: handle log4c-config script
  python: remove stale python2-config symbolic link
  python3: remove another config script
  sane-backends: handle sane-config script

 package/fltk/fltk.mk                             |    1 +
 package/gsl/gsl.mk                               |    1 +
 package/imlib2/imlib2.mk                         |    6 ++----
 package/libart/libart.mk                         |    1 +
 package/libcdaudio/libcdaudio.mk                 |    1 +
 package/libcgicc/libcgicc.mk                     |    2 +-
 package/libesmtp/libesmtp.mk                     |    2 +-
 package/libftdi/libftdi.mk                       |    2 +-
 package/liblog4c-localtime/liblog4c-localtime.mk |   21 +++++++++++----------
 package/libvncserver/libvncserver.mk             |    1 +
 package/netatalk/netatalk.mk                     |    1 +
 package/netsnmp/netsnmp.mk                       |    6 +++---
 package/python/python.mk                         |    1 +
 package/python3/python3.mk                       |    1 +
 package/sane-backends/sane-backends.mk           |    1 +
 15 files changed, 28 insertions(+), 20 deletions(-)

-- 
1.7.9.5
