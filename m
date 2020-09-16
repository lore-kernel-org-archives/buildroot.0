From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 16 Sep 2020 12:02:09 +0200
Subject: [Buildroot] [PATCH 1/3] package/doxygen: disable shared libs for
 host
In-Reply-To: <20200916100212.2903033-1-buildroot@heine.tech>
References: <20200916100212.2903033-1-buildroot@heine.tech>
Message-ID: <20200916100212.2903033-2-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

doxygen fails to build with BUILD_SHARED_LIBS=ON as it only
for some targets honors this flag and links the rest static.
So enforce BUILD_SHARED_LIBS=OFF for this package.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
-- 
2.25.1
