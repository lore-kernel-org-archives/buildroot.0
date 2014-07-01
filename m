From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 13:28:33 +0200
Subject: [Buildroot] [git commit] wget: add optional libuuid dependency
Message-ID: <20140701113221.087139D128@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=faa9e1a6bb3e81a75484367d29b542abac69c4e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Alexander Potashev <a.potashev@geoscan.aero>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wget/wget.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index a8d9f61..56ccfb5 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -37,6 +37,10 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WGET_DEPENDENCIES += openssl
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+	WGET_DEPENDENCIES += util-linux
+endif
+
 # --with-ssl is default
 ifneq ($(BR2_PACKAGE_GNUTLS),y)
 ifneq ($(BR2_PACKAGE_OPENSSL),y)
