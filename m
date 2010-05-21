From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 20:37:51 +0200
Subject: [Buildroot] [git commit master] gettext: make only available if
	BR2_NEEDS_GETTEXT is set
Message-ID: <20100521184447.6F8A99C144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=407616f690a46f50f10d797a8bbc58052f515bba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows to make sure that an user, or a randpackageconfig, will
not select the gettext or libintl package when using an external
toolchain based on glibc/eglibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index bd5950c..c6792ac 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GETTEXT
 	bool "gettext"
+	depends on BR2_NEEDS_GETTEXT
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
 	  framework to help other GNU packages produce multi-lingual
@@ -21,6 +22,7 @@ config BR2_PACKAGE_GETTEXT_STATIC
 
 config BR2_PACKAGE_LIBINTL
 	bool "libintl"
+	depends on BR2_NEEDS_GETTEXT
 	help
 	  Selecting this package installs all of gettext in the staging
 	  directory and the shared library for it's use in the target.
-- 
1.6.3.3
