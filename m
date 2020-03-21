From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 22:52:18 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/polkit: fix build
 with NLS
Message-ID: <20200321214148.5B97983BAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c2ec3ece2edc1162e636f318ff6e2dfea775377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
 - http://autobuild.buildroot.org/results/258b734e14f8f31355eba1ddb734213bc3f29591

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0c08a04e78eb64679482222dee5f7c2f777c54af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polkit/polkit.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index efd788a05c..4e7cda943c 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -11,10 +11,13 @@ POLKIT_LICENSE_FILES = COPYING
 
 POLKIT_INSTALL_STAGING = YES
 
-POLKIT_DEPENDENCIES = libglib2 host-intltool expat spidermonkey
+POLKIT_DEPENDENCIES = \
+	libglib2 host-intltool expat spidermonkey $(TARGET_NLS_DEPENDENCIES)
 
 # spidermonkey needs C++11
-POLKIT_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+POLKIT_CONF_ENV = \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
+	LIBS=$(TARGET_NLS_LIBS)
 
 POLKIT_CONF_OPTS = \
 	--with-os-type=unknown \
