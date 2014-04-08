From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Apr 2014 00:47:06 +0200
Subject: [Buildroot] [git commit] cppcms: icu support needs wchar + threads
Message-ID: <20140408225026.2D8E09C69E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28f0d896aed92980fcfcc3d6033772607c790a58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppcms/Config.in |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 2b99b52..418146a 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -24,11 +24,18 @@ config BR2_PACKAGE_CPPCMS_ICU
 	bool "enable icu support"
 	depends on !BR2_arc # icu -> atomic builtins
 	depends on !BR2_BINFMT_FLAT # icu
+	depends on BR2_USE_WCHAR # icu
+	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
+comment "icu support needs a toolchain w/ wchar, threads"
+	depends on !BR2_arc
+	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 endif
 
 comment "cppcms needs a toolchain w/ C++"
