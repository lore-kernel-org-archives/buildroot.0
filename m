From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 May 2014 16:52:33 +0200
Subject: [Buildroot] [git commit] ulogd: forcibly disable mysql when not
	present
Message-ID: <20140508145518.4D97E9C5E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e49c7036eea8ded61a4c465f74bffff55315442
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forcibly disable mysql support when we don't want it since ulogd's
configure script can pick up the host mysql_config thus leading to a
build failure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ulogd/ulogd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 28ada96..91eeaaf 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -20,6 +20,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 	ULOGD_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
 	ULOGD_DEPENDENCIES += mysql
+else
+	ULOGD_CONF_OPT += --with-mysql=no
 endif
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	ULOGD_DEPENDENCIES += sqlite
