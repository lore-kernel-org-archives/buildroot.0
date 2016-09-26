From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 26 Sep 2016 11:44:21 +0100
Subject: [Buildroot] [PATCH 1/2] jsoncpp: follow Debian, Ubuntu,
	Arch convention for headers location
Message-ID: <1474886662-46914-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Taken from here: https://bugs.gentoo.org/show_bug.cgi?id=452234

Currently headers are installed in /usr/include/json/ but this collides
with other JSON libraries that also install headers in the same
location.

Fixes:

  http://autobuild.buildroot.net/results/2dd/2ddafa46a35fff54586810b23e0b98e6e4d28ca2/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/jsoncpp/jsoncpp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 83ce0a7..2231b47 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -10,7 +10,10 @@ JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
 JSONCPP_INSTALL_STAGING = YES
 
+# Follow Debian, Ubuntu, Arch convention for headers location
+# Taken from here: https://bugs.gentoo.org/show_bug.cgi?id=452234
 JSONCPP_CONF_OPTS += \
+	-DINCLUDE_INSTALL_DIR=/usr/include/jsoncpp \
 	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
 	-DJSONCPP_WITH_TESTS=OFF \
 	-DJSONCPP_WITH_STRICT_ISO=OFF
-- 
2.7.3
