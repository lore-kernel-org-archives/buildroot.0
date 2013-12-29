From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 11:59:39 +0100
Subject: [Buildroot] [git commit] avrdude: add missing dependencies on
	host-flex and host-bison
Message-ID: <20131229110012.D3EAA9C226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e09f869a0ae1695a4a061936912e7c651ea8510
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/374/374608a852e66b89d02bbee1199a8dc9817d3aa0/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avrdude/avrdude.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 338d61c..33e010d 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -12,7 +12,8 @@ AVRDUDE_SUBDIR = avrdude
 # Sources coming from git, without generated configure and Makefile.in
 # files.
 AVRDUDE_AUTORECONF = YES
-AVRDUDE_DEPENDENCIES = libelf libusb libusb-compat ncurses
+AVRDUDE_DEPENDENCIES = libelf libusb libusb-compat ncurses \
+	host-flex host-bison
 
 ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
