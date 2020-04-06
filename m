From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Apr 2020 18:16:55 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/civetweb: add
 zlib optional dependency
Message-ID: <20200406213859.3E2EF8D377@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a19efcf4edc11dce29258487a117007c5e99b598
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

zlib is an optional dependency since version 1.11 and
https://github.com/civetweb/civetweb/commit/6b8b15935378f71323ff95f907fa0d33841deac0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 41dfe5707cc7704d74604879035882b01f349ce8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/civetweb/civetweb.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 1652239ebb..69a377d723 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -38,6 +38,12 @@ else
 CIVETWEB_COPT += -DNO_SSL
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+CIVETWEB_CONF_OPTS += WITH_ZLIB=1
+CIVETWEB_LIBS += -lz
+CIVETWEB_DEPENDENCIES += zlib
+endif
+
 ifeq ($(BR2_PACKAGE_CIVETWEB_SERVER),y)
 CIVETWEB_BUILD_TARGETS += build
 CIVETWEB_INSTALL_TARGETS += install
