From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jan 2014 11:23:56 +0100
Subject: [Buildroot] [git commit] libfreefare: examples need to link with
	zlib for openssl when static linking
Message-ID: <20140109102815.142179C40A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=712ebe85799287c3964aeab62982013b15076f92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/f09/f09d515f0e7b6d78010f1ce624336ceaef624989/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreefare/libfreefare.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 8dcd6b8..362cab2 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -8,4 +8,9 @@ LIBFREEFARE_VERSION = 0.3.4
 LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+# openssl needs zlib even if the libfreefare example itself doesn't
+LIBFREEFARE_CONF_ENV += LIBS='-lz'
+endif
+
 $(eval $(autotools-package))
