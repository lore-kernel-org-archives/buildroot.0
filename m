From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Jun 2018 10:52:19 +0200
Subject: [Buildroot] [PATCH 1/1] host-protobuf-c: fix build with gcc 4.8
Message-ID: <20180624085219.10452-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

protobuf requires C++11 so add -std=c++11 for host-protobuf-c as it is
experimental in gcc 4.8

Fixes:
 - http://autobuild.buildroot.net/results/7fe12457ccac7e8c95b1d4c1fa20d6753599742d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/protobuf-c/protobuf-c.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 4306610533..34f8294412 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -16,5 +16,8 @@ PROTOBUF_C_LICENSE_FILES = LICENSE
 PROTOBUF_C_AUTORECONF = YES
 HOST_PROTOBUF_C_AUTORECONF = YES
 
+# host-protobuf needs c++11 (since 3.6.0)
+HOST_PROTOBUF_C_CONF_ENV += CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.14.1
