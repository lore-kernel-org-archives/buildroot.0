From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 23:33:34 +0200
Subject: [Buildroot] [git commit] ympd: add optional openssl dependency
Message-ID: <20180326214021.1E70083C18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46680c9dc13fdff28f07c3e86fbc1b778d457a31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/d9b1375f5f8ecde8fef027344a5d5b288f7cee7c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ympd/ympd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
index e3f21e9eb0..6c0f3224cc 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -10,4 +10,11 @@ YMPD_LICENSE = GPL-2.0
 YMPD_LICENSE_FILES = LICENSE
 YMPD_DEPENDENCIES = libmpdclient
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+YMPD_DEPENDENCIES += openssl
+YMPD_CONF_OPTS += -DWITH_SSL=ON
+else
+YMPD_CONF_OPTS += -DWITH_SSL=OFF
+endif
+
 $(eval $(cmake-package))
