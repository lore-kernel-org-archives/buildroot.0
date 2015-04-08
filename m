From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:42:48 +0200
Subject: [Buildroot] [git commit] package/libungif: deprecate package
Message-ID: <20150408204304.8DA45819B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aaf066666e5efaf0b5b156eca0a5759096b9dce8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To be replaced with giflib.

Follow-up of http://patchwork.ozlabs.org/patch/432990/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libungif/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libungif/Config.in b/package/libungif/Config.in
index e8c301c..012ef76 100644
--- a/package/libungif/Config.in
+++ b/package/libungif/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBUNGIF
 	bool "libungif"
+	depends on !BR2_PACKAGE_GIFLIB
+	depends on BR2_DEPRECATED_SINCE_2015_02 # giflib
 	help
 	  libungif is a library for handling the uncompressed GIF image format.
 
