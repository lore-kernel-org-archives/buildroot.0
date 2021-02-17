From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 07:36:01 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/jasper: Bump to
 2.0.24
Message-ID: <20210217064718.523C885F07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56d75bd8fda626eadc42f48b7293630416322d7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Changes:
* Add JAS_VERSION_MAJOR, JAS_VERSION_MINOR, JAS_VERSION_PATCH for
  easier access to the JasPer version.
* Fixes stack overflow bug on Windows, where variable-length
  arrays are not available. (#256)

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7a5c61d59be35c059e96730cd70a92d47cb4e8e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 2a0a4fdff0..7386c2179f 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  20facc904bd9d38c20e0c090b1be3ae02ae5b2703b803013be2ecad586a18927  jasper-2.0.23.tar.gz
+sha256  d2d28e115968d38499163cf8086179503668ce0d71b90dd33855b3de96a1ca1d  jasper-2.0.24.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 3386108323..bb50168d67 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.23
+JASPER_VERSION = 2.0.24
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
