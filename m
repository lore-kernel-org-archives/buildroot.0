From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 22:47:18 +0200
Subject: [Buildroot] [git commit] package/re2: build host as shared libs
Message-ID: <20200907204122.955C0813FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=559aa508643014f80830f4ca223496ff383cf8b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-grpc needs re2 as shared lib.
Set this via cmake config flag.

Fixes:
http://autobuild.buildroot.net/results/a98/a98d3203f68f0f929c544537244e7621e80ce0a1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/re2/re2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 0a3c204661..0c3bf4e844 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -11,7 +11,7 @@ RE2_LICENSE_FILES = LICENSE
 RE2_INSTALL_STAGING = YES
 
 RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
-HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
+HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
