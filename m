From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Jan 2012 09:41:57 +0100
Subject: [Buildroot] [git commit] libxslt: fix typo from db8fcd04ba94ce8
	(libxslt: cleanup)
Message-ID: <20120119084323.48B01902F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f05c8a432c1e009b3dd03aab5d957bcc3b70e790
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--without-crypto should be appended to the configure opts, not replace them.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxslt/libxslt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 2a1730e..15b6e6a 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -17,7 +17,7 @@ LIBXSLT_DEPENDENCIES = libxml2
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBXSLT_DEPENDENCIES += libgcrypt
 else
-LIBXSLT_CONF_OPT = --without-crypto
+LIBXSLT_CONF_OPT += --without-crypto
 endif
 
 HOST_LIBXSLT_CONF_OPT = --without-debug --without-python --without-crypto
