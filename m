From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 23:25:03 +0100
Subject: [Buildroot] [git commit] make: depend on guile explicitly when
	available
Message-ID: <20150226225650.EF8A1817DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38ee8a8e1651f1de2b2698e4c6bce2e488001cdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/make/make.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index d643fb0..6e7a8f1 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -16,4 +16,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
 	MAKE_CONF_OPTS += --disable-load
 endif
 
+ifeq ($(BR2_PACKAGE_GUILE),y)
+MAKE_DEPENDENCIES += guile
+MAKE_CONF_OPTS += --with-guile
+else
+MAKE_CONF_OPTS += --without-guile
+endif
+
 $(eval $(autotools-package))
