From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 21:37:10 +0200
Subject: [Buildroot] [git commit] rapidjson: needs C++ support
Message-ID: <20170504193733.0BF4582856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab56ce15c1802f41259718e6d36e35790fd8cb0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/ac989c119e4ea90b8318795fe9cf8c3e9395a354/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rapidjson/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rapidjson/Config.in b/package/rapidjson/Config.in
index b8c8bcf..3367385 100644
--- a/package/rapidjson/Config.in
+++ b/package/rapidjson/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_RAPIDJSON
 	bool "rapidjson"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  A fast JSON parser/generator for C++ with both SAX/DOM style API.
 
 	  http://rapidjson.org/
+
+comment "rapidjson needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
