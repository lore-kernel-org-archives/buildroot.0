From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 14:00:48 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] igmpproxy: fix license
Message-ID: <20181005115958.726DF8D2BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=664663238444f1e2be618d5e6775dc02af76e22b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

mrouted part of igmpproxy is licensed under BSD-3-Clause so add this in
IGMPPROXY_LICENSE and add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c60c92861408d73e83fc819ac861f9fde962121c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/igmpproxy/igmpproxy.hash | 3 +++
 package/igmpproxy/igmpproxy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/igmpproxy/igmpproxy.hash b/package/igmpproxy/igmpproxy.hash
index 2e3a374618..313af52fbe 100644
--- a/package/igmpproxy/igmpproxy.hash
+++ b/package/igmpproxy/igmpproxy.hash
@@ -1,2 +1,5 @@
 # Locally computed:
 sha256 e60331031f85d1fb834c5272a134f32d32e7834718da19ba3f787dff68389a31  igmpproxy-f47644d8fa7266a784f3ec7b251e7d318bc2f0a9.tar.gz
+sha256 be3d05af93dbbc4650f8d641d8e1bec220af4a729e07ba71e949c25b93a1b4f6  COPYING
+sha256 c4f65d5d396ad518a37d30b83fe33897661858dc174ff64a15d0461630ce64e4  GPL.txt
+sha256 4328a21f0822caa9976356623118bcdcc9970c7a0f9a3deeba23c779b7cfb5d1  Stanford.txt
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index 8989c74de0..9c19f76f0c 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -7,7 +7,7 @@
 IGMPPROXY_VERSION = f47644d8fa7266a784f3ec7b251e7d318bc2f0a9
 IGMPPROXY_SITE = $(call github,pali,igmpproxy,$(IGMPPROXY_VERSION))
 IGMPPROXY_AUTORECONF = YES
-IGMPPROXY_LICENSE = GPL-2.0+
-IGMPPROXY_LICENSE_FILES = COPYING
+IGMPPROXY_LICENSE = GPL-2.0+, BSD-3-Clause (mrouted)
+IGMPPROXY_LICENSE_FILES = COPYING GPL.txt Stanford.txt
 
 $(eval $(autotools-package))
