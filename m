From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:27:22 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/capnproto: add
 openssl optional dependency
Message-ID: <20200828164642.C77B0865B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fed60051eb92a52e5fb7d6c049ae62e847c2624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

openssl is an optional dependency that is enabled by default since
version 0.7.0 and
https://github.com/capnproto/capnproto/commit/23db5e3fd91104a0b2881d8f8ab3c10bf9dd8e75

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c20798bca282e298c07e98e7749349256b4b9ef7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/capnproto/capnproto.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 34fb885914..2afeb8ffa3 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -21,5 +21,12 @@ endif
 # The actual source to be compiled is within a 'c++' subdirectory
 CAPNPROTO_SUBDIR = c++
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CAPNPROTO_CONF_OPTS += --with-openssl
+CAPNPROTO_DEPENDENCIES += openssl
+else
+CAPNPROTO_CONF_OPTS += --without-openssl
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
