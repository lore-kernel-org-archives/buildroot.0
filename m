From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Oct 2009 11:51:47 +0200
Subject: [Buildroot] [git commit master] speech-tools: needs C++ support
Message-ID: <20091002095205.1682577768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b624c9e35e337ecc2b950d70d9a6f89b1d3f1044
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/festival/speech-tools/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/festival/speech-tools/Config.in b/package/multimedia/festival/speech-tools/Config.in
index d8405ba..e82ea1e 100644
--- a/package/multimedia/festival/speech-tools/Config.in
+++ b/package/multimedia/festival/speech-tools/Config.in
@@ -1,6 +1,10 @@
- config BR2_PACKAGE_SPEECH_TOOLS
+config BR2_PACKAGE_SPEECH_TOOLS
 	bool "speech tools for festival"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Speech tools for the festival text to speech system
 
 	  http://festvox.org/packed/festival/latest
+
+comment "speech tools requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
1.6.3.3
