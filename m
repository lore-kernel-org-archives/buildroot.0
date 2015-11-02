From: Remi Pommarel <repk@triplefau.lt>
Date: Mon,  2 Nov 2015 09:17:29 +0100
Subject: [Buildroot] [PATCH v3 0/3] package/git: Fix static compilation
Message-ID: <1446452252-10647-1-git-send-email-repk@triplefau.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch series fixes git package static compilation. This fixes missing
library dependency coming from static library undefined symbols as well as
backport of submitted and accepted git patches.

Thanks
Remi

Remi Pommarel (3):
  package/git: Add needed library for static compilation
  package/git: Add git patch for static compilation
  package/git: Used curl-config program for target

 .../0001-Makefile-link-libcurl-before-zlib.patch   | 62 +++++++++++++++
 ...kefile-make-curl-config-path-configurable.patch | 88 ++++++++++++++++++++++
 ...configure.ac-detect-ssl-need-with-libcurl.patch | 46 +++++++++++
 package/git/git.mk                                 |  8 +-
 4 files changed, 202 insertions(+), 2 deletions(-)
 create mode 100644 package/git/0001-Makefile-link-libcurl-before-zlib.patch
 create mode 100644 package/git/0002-Makefile-make-curl-config-path-configurable.patch
 create mode 100644 package/git/0003-configure.ac-detect-ssl-need-with-libcurl.patch

-- 
2.0.1
