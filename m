From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 15:24:53 +0100
Subject: [Buildroot] [git commit] libxmlpp: need BR2_USE_MMU dependancy
Message-ID: <20140204142939.C0C699C7C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc6e4c4a32761f298442568ba7590a611ec6501a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.org/results/d4d/d4d10ddccf4f53087e2012a36fd80808f7dc7cc5/

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxmlpp/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index 77723a8..69bd220 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBXMLPP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glibmm -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glibmm -> libglib2
+	depends on BR2_USE_MMU # glibmm -> libglib2
 	help
 	  libxml++ is a C++ wrapper for the libxml XML parser library.
 
