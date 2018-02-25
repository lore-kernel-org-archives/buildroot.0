From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 21:54:47 +0100
Subject: [Buildroot] [git commit] liblo: disable werror to fix build issues
Message-ID: <20180305200717.7DC7981EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2759ba039790cd15892bafbd140b34c1b63e299e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass the --disable-werror option to remove -Werror, and therefore
avoid a number of build failures.

Fixes:

  http://autobuild.buildroot.net/results/61ab7e23d2ef62f055efc74a998e3c108a3cdb43

Signed-off-by: Alex Baldwin <alexbaldwinmusic@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liblo/liblo.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
index 14b0527966..c7d163dae2 100644
--- a/package/liblo/liblo.mk
+++ b/package/liblo/liblo.mk
@@ -12,6 +12,9 @@ LIBLO_LICENSE_FILES = COPYING
 LIBLO_INSTALL_STAGING = YES
 
 # IPv6 support broken, issue known upstream
-LIBLO_CONF_OPTS = --disable-ipv6
+# werror - not needed for release.
+LIBLO_CONF_OPTS += \
+	--disable-ipv6 \
+	--disable-werror
 
 $(eval $(autotools-package))
