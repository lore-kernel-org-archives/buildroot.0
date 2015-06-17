From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jun 2015 12:24:44 +0200
Subject: [Buildroot] [git commit] lftp: indicate why autoreconf is needed
Message-ID: <20150617102642.8486581DC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebe2968d7056372bbfcae53fcb3ecdd636e9f32b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer have any patch touching configure.ac/Makefile.am, so one
might wonder why we're autoreconfiguring the package. The reason is
that our libtool patch doesn't apply on the code provided by the lftp
tarball.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lftp/lftp.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 54b1c6c..362ad28 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -9,6 +9,7 @@ LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
+# Needed so that our libtool patch applies properly
 LFTP_AUTORECONF = YES
 LFTP_DEPENDENCIES = readline zlib host-pkgconf
 
