From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 10:58:44 +0200
Subject: [Buildroot] [git commit] jsoncpp: don't build tests
Message-ID: <20150406085849.B6A578197C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ec45823c173e4a6e3ba59424c86e1cb5afbd681
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a0f/a0f60a1df243bdae875f12668011a53a70071ee6/
http://autobuild.buildroot.net/results/f88/f8885520b5892d49164c88a974e7dffc1c3c2ce0/
http://autobuild.buildroot.net/results/448/448745830f58496e6dcdf48e2ad57650b4744909/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jsoncpp/jsoncpp.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index cfd3dd9..3044be1 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -11,6 +11,7 @@ JSONCPP_LICENSE_FILES = LICENSE
 JSONCPP_INSTALL_STAGING = YES
 
 JSONCPP_CONF_OPTS += \
-	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF
+	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
+	-DJSONCPP_WITH_TESTS=OFF
 
 $(eval $(cmake-package))
