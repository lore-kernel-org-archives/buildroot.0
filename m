From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:49 -0000
Subject: [Buildroot] [git commit] package/valijson: bump version to 0.2
Message-ID: <20191202083930.E2F0C81368@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8e2876104be3f9f01613b17d3e60120883be1a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Added hash of LICENSE file in valijson.hash
- Updated hash of valijson tar file in valijson.hash file
- Added option to set tests off which drops the curlpp dependency

Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valijson/valijson.hash | 3 ++-
 package/valijson/valijson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index cd34ecb8c9..6f11000669 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,2 +1,3 @@
 # Locally Computed:
-sha256  d22c1f8fe27d43e5a27aad1d3cbe9f1318ec28ccfa913e615663ed2bd6a5d063  valijson-0.1.tar.gz
+sha256  77dbebb40dab2e834557c2fcc39122cdb2d0fe26bf591c2b3e0df5a316a45592  valijson-0.2.tar.gz
+sha256  1a0f99926a2dbec30eba3db820236d9953fbe3048976923ac24980e655fbe991  LICENSE
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index a804334732..31efeede34 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = 0.1
+VALIJSON_VERSION = 0.2
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
 VALIJSON_DEPENDENCIES = boost
-VALIJSON_CONF_OPTS = -DINSTALL_HEADERS=TRUE
+VALIJSON_CONF_OPTS = -Dvalijson_INSTALL_HEADERS=TRUE -Dvalijson_BUILD_TESTS=FALSE
 
 $(eval $(cmake-package))
