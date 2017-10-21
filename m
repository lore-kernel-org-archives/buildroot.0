From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] libevent: supports only the real OpenSSL,
	not LibreSSL
Message-ID: <20171021192125.B3F2B81112@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1eefb3d9b8d6606fe6bfff6727e6a4d2b41c8e60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libevent will not build with LibreSSL without patches, so let's
support only OpenSSL.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libevent/libevent.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 36bca0b..fc4108f 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -23,8 +23,8 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBEVENT_DEPENDENCIES += host-pkgconf openssl
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+LIBEVENT_DEPENDENCIES += host-pkgconf libopenssl
 LIBEVENT_CONF_OPTS += --enable-openssl
 else
 LIBEVENT_CONF_OPTS += --disable-openssl
