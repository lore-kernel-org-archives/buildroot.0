From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  6 Apr 2015 08:32:07 +0300
Subject: [Buildroot] [PATCH] jsoncpp: don't build tests
Message-ID: <deb5dd93e84879ae624f214bf7dba983fa526348.1428298327.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/a0f/a0f60a1df243bdae875f12668011a53a70071ee6/
http://autobuild.buildroot.net/results/f88/f8885520b5892d49164c88a974e7dffc1c3c2ce0/
http://autobuild.buildroot.net/results/448/448745830f58496e6dcdf48e2ad57650b4744909/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/jsoncpp/jsoncpp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index cfd3dd9b3179..3044be13a154 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -11,6 +11,7 @@ JSONCPP_LICENSE_FILES = LICENSE
 JSONCPP_INSTALL_STAGING = YES
 
 JSONCPP_CONF_OPTS += \
-	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF
+	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
+	-DJSONCPP_WITH_TESTS=OFF
 
 $(eval $(cmake-package))
-- 
2.1.4
