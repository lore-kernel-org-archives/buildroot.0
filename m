From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:33:57 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] collectd: fix license
Message-ID: <20180718213011.29EA27FBE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d99e2c4fddb373aa95be0e56c07a5bfc7bbe6b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

- Since version 5.5, daemon is licensed under MIT:
  https://github.com/collectd/collectd/commit/889e5e6bd51d38d490289332053a238a4f1c70b3
- Plugins are licensed under MIT, GPL-2.0 or LGPL-2.1
- Add libltdl/COPYING.LIB to license files to have a copy of LGPL-2.1 as
  it is not in COPYING
- Add hash for both license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d5fa317f2dc2317d5d2526c61a6f88af92cdfc73)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.hash | 4 ++++
 package/collectd/collectd.mk   | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index be2f646c9c..cf7e0b83f9 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,2 +1,6 @@
 # From https://collectd.org/files/SHA256SUM
 sha256	7edd3643c0842215553b2421d5456f4e9a8a58b07e216b40a7e8e91026d8e501	collectd-5.7.1.tar.bz2
+
+# Hash for license files
+sha256	ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4	COPYING
+sha256	f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa	libltdl/COPYING.LIB
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6c987b2e36..ef45f342ae 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -9,8 +9,8 @@ COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
-COLLECTD_LICENSE = GPL-2.0, LGPL-2.1
-COLLECTD_LICENSE_FILES = COPYING
+COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
+COLLECTD_LICENSE_FILES = COPYING libltdl/COPYING.LIB
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
