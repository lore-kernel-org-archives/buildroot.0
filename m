From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:52:41 +0100
Subject: [Buildroot] [git commit] package/apr-util: add optional dependency
	to openssl
Message-ID: <20141026215247.BEF91B0DA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3026e3850a2dda48f4cb17559152e3b3cceaaa1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr-util/apr-util.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index fc515a3..3b0a71b 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -46,4 +46,11 @@ else
 APR_UTIL_CONF_OPTS += --without-sqlite3
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+APR_UTIL_CONF_OPTS += --with-crypto --with-openssl="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += openssl
+else
+APR_UTIL_CONF_OPTS += --without-crypto
+endif
+
 $(eval $(autotools-package))
