From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:32:09 +0200
Subject: [Buildroot] [git commit] package/doxygen: disable shared libs for
 host
Message-ID: <20200917202409.8676A83DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38e660af4b72edfbeb404d0a60a7b70321073861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

doxygen fails to build with BUILD_SHARED_LIBS=ON as it only
for some targets honors this flag and links the rest static.
So enforce BUILD_SHARED_LIBS=OFF for this package.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/doxygen/doxygen.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index 6d8727208a..ee8ae4fde4 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -11,4 +11,6 @@ DOXYGEN_LICENSE = GPL-2.0
 DOXYGEN_LICENSE_FILES = LICENSE
 HOST_DOXYGEN_DEPENDENCIES = host-flex host-bison
 
+HOST_DOXYGEN_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
+
 $(eval $(host-cmake-package))
