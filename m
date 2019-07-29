From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 09:26:26 +0200
Subject: [Buildroot] [git commit] package/zip: adjust the version to 3.0
Message-ID: <20190729072413.6407C81528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b254cb25b2ab89ac482abd4da91d827abfe2344e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the project homepage at
http://infozip.sourceforge.net/Zip.html, the version is really named
3.0. This is also how it's called inside the zip30.ann file in the
source code, which says "We have posted Zip 3.0, July 5th 2008".

So the fact that the tarball is named zip30.tgz is just because
upstream wanted to avoid having two dots (perhaps by habit of the old
DOS 8.3 file name limitation ?).

The version is also named "3.0" in the SourceForge RSS at [0] that
release-monitoring.org is using for this package [1]. Therefore, by
using "3.0" as the version, we will match the version known by
release-monitoring.org.

Of course the tarball name is still zip30.tgz so we tweak the
ZIP_VERSION value appropriately.

[0] https://sourceforge.net/projects/infozip/rss?path=/
[1] https://release-monitoring.org/project/10080/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zip/zip.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 0bd3d3c11f..ca52c74fb1 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ZIP_VERSION = 30
-ZIP_SOURCE = zip$(ZIP_VERSION).tgz
+ZIP_VERSION = 3.0
+# The version is really 3.0, but the tarball is named zip30.tgz
+ZIP_SOURCE = zip$(subst .,,$(ZIP_VERSION)).tgz
 ZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 ZIP_LICENSE = Info-ZIP
 ZIP_LICENSE_FILES = LICENSE
