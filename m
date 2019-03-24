From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:04:44 +0100
Subject: [Buildroot] [git commit] package/libcpprestsdk: add optional brotli
 dependency
Message-ID: <20190324220643.88219838AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b386e153958ece9a497efd4e27e7bd7657141c64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Official brotli support has been added in version 2.10.8 and
https://github.com/Microsoft/cpprestsdk/commit/f3824aa8d01705656e7ee4c0c49ae6980c868b20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcpprestsdk/libcpprestsdk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index d527aaad98..fd1201f287 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -16,6 +16,13 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
 
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+LIBCPPRESTSDK_DEPENDENCIES += brotli
+LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_BROTLI=OFF
+else
+LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_BROTLI=ON
+endif
+
 ifeq ($(BR2_PACKAGE_WEBSOCKETPP),y)
 LIBCPPRESTSDK_DEPENDENCIES += websocketpp
 LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=OFF
