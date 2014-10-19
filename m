From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 16:28:06 +0200
Subject: [Buildroot] [git commit] package/cdrkit: download from alternate
	site
Message-ID: <20141019142859.35DA9AF644@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f6dbebbbd55e9cb86b0ad1921b512a4da3e71b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

www.cdrkit.org looks dead, the cdrkit archive always downloads from the
buildroot.org mirror. This patch points the downloader to the Debian
archive site.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cdrkit/cdrkit.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 8ec0b8b..3f2b429 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 CDRKIT_VERSION = 1.1.11
-CDRKIT_SITE = http://www.cdrkit.org/releases
+CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
+CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20101018T151929Z/pool/main/c/cdrkit/
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
 CDRKIT_LICENSE = GPLv2
 CDRKIT_LICENSE_FILES = COPYING
