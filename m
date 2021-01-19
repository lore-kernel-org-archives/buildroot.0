From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 20:26:33 +0100
Subject: [Buildroot] [git commit] package/xenomai: drop unrecognized option
Message-ID: <20210119190748.5E0E5886FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2585de4100045e3429edab42fab1f662255612e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--disable-doc-install is not available since version 3.0.6 and
https://gitlab.denx.de/Xenomai/xenomai/-/commit/6076f0951c7c37917c625b1aa1cd6905c27310f6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xenomai/xenomai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 11c69000df..7e3b130085 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -37,7 +37,7 @@ XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
-XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
+XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/
 
 ifeq ($(BR2_PACKAGE_XENOMAI_MERCURY),y)
 XENOMAI_CONF_OPTS += --with-core=mercury
