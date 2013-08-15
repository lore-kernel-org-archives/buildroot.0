From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Aug 2013 18:35:43 +0200
Subject: [Buildroot] [git commit] webkit: Restrict supported architectures
Message-ID: <20130815163539.319BD9A60E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b678b2a4225da854e35f6538ddb8a5beca9d49ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See Source/WTF/wtf/Platform.h. Webkit is only supported for
arm, armeb, i386, mips, mipsel, powerpc, sh, sparc, x86_64.

[Thomas P: propagate dependency to the midori package.]

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/midori/Config.in |    2 ++
 package/webkit/Config.in |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index d358740..66279f9 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
 	depends on BR2_TOOLCHAIN_HAS_THREADS # webkit -> enchant -> libglib2
 	depends on BR2_USE_WCHAR	 # webkit
+	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
+		    BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64) # webkit
 	help
 	  Midori is a lightweight web browser based on WebKit
 
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 92cbc62..789e427 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_USE_WCHAR # enchant -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
+		    BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64)
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
