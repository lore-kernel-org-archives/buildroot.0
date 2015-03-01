From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun,  1 Mar 2015 22:06:51 +0100
Subject: [Buildroot] [PATCH v3 0/2] Fix logrotate autobuild failure
Message-ID: <1425244013-2509-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set fix a logrotate autobuild failure:
    http://autobuild.buildroot.net/results/159bf5730414ca7f73dcdae95090177355193636
    http://autobuild.buildroot.net/results/ebe6ab7fc0f2cff98de06b3dc374730da9e9e4f2

v3:
 - popt: instead of using sed add a patch and send it upstream
 - logrotate: improve commit message
v2:
 - logroate: instead of adding a patch just overwrite from the command line the
   LOADLIBES variable


Fabio Porcedda (2):
  popt: add to the "popt.pc" file the libintl library
  logrotate: use pkg-config for the opt library

 package/logrotate/logrotate.mk                     |  6 ++-
 ...-the-libintl-library-to-the-Libs.private-.patch | 47 ++++++++++++++++++++++
 package/popt/popt.mk                               |  4 ++
 3 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 package/popt/0004-popt.pc-add-the-libintl-library-to-the-Libs.private-.patch

-- 
2.3.1
