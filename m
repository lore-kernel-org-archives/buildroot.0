From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 12 Nov 2013 08:28:44 +0000
Subject: [Buildroot] [PATCH] audiofile: needs dynamic library
Message-ID: <1384244924-31625-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Fixes build failures such as the following.

  http://autobuild.buildroot.net/results/c00/c002711ef82fb29f1765df251bd0006caeccc508/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/audiofile/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/audiofile/Config.in b/package/audiofile/Config.in
index 4aa8d69..9752648 100644
--- a/package/audiofile/Config.in
+++ b/package/audiofile/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_AUDIOFILE
 	bool "audiofile"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  The Audio File Library handles reading and writing audio files
 	  in many common formats.
 
 	  http://www.68k.org/~michael/audiofile/
 
-comment "audiofile needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "audiofile needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PREFER_STATIC_LIB
-- 
1.8.3.2
