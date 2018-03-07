From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Mar 2018 23:02:46 +0100
Subject: [Buildroot] [git commit] jsoncpp: do not always build static library
Message-ID: <20180307220510.5284E826CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7098ee7f615b88e6939ab5194d6b28b75ed5f18f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, static libray is always built as BUILD_STATIC_LIBS is ON by
default so correctly set BUILD_STATIC_LIBS depending on BR2_SHARED_LIBS
variable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jsoncpp/jsoncpp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 3a2ee087b3..2b527fc303 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -15,4 +15,10 @@ JSONCPP_CONF_OPTS += \
 	-DJSONCPP_WITH_TESTS=OFF \
 	-DJSONCPP_WITH_STRICT_ISO=OFF
 
+ifeq ($(BR2_SHARED_LIBS),y)
+JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+else
+JSONCPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+endif
+
 $(eval $(cmake-package))
