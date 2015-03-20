From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:29:49 +0100
Subject: [Buildroot] [git commit] package/avrdude: optionally depends on
	libftdi or libftdi1
Message-ID: <20150320224445.B62F481885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=772dbcd797879f56919d0cd026c2aa882af21f71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avrdude supports both libftdi and libftdi1.

Because libftdi is already an optional dependency, this patch adds
libftdi1 as optional dependency as well, but privileges libftdi1 over
libftdi (accdording to what is done in  avrdude's configure script).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avrdude/avrdude.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 03d6490..1811893 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -17,7 +17,9 @@ AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 AVRDUDE_LICENSE = GPLv2+
 AVRDUDE_LICENSE_FILES = avrdude/COPYING
 
-ifeq ($(BR2_PACKAGE_LIBFTDI),y)
+ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
+AVRDUDE_DEPENDENCIES += libftdi1
+else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
 endif
 
