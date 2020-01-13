From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jan 2020 19:17:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/fmt: bump to version 6.1.2
Message-ID: <20200113181719.790221-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- License is MIT (with exception) since version 6.0.0 and
  https://github.com/fmtlib/fmt/commit/5a353fa8cf147cdb13198f26145fbb026644808c
- HAVE_OPEN has been removed since version 6.1.0. and
  https://github.com/fmtlib/fmt/commit/dcde089b4edaecb42c4bdd43c5b3674017a00d91

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fmt/fmt.hash | 4 ++--
 package/fmt/fmt.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index a124a1b7ed..24d05e7789 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 defa24a9af4c622a7134076602070b45721a43c51598c8456ec6f2c4dbb51c89  fmt-5.3.0.tar.gz
-sha256 560d39617dfb4b4e4088597291a070ed6c3a8d67668114ed475c673430c3e49a  LICENSE.rst
+sha256 1cafc80701b746085dddf41bd9193e6d35089e1c6ec1940e037fcb9c98f62365  fmt-6.1.2.tar.gz
+sha256 825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 17dfb87b74..5dc3088e89 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-FMT_VERSION = 5.3.0
+FMT_VERSION = 6.1.2
 FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
-FMT_LICENSE = BSD-2-Clause
+FMT_LICENSE = MIT with exception
 FMT_LICENSE_FILES = LICENSE.rst
 FMT_INSTALL_STAGING = YES
 
 FMT_CONF_OPTS = \
-	-DHAVE_OPEN=ON \
 	-DFMT_INSTALL=ON \
 	-DFMT_TEST=OFF
 
-- 
2.24.1
