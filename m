From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:53:22 +0200
Subject: [Buildroot] [PATCH 19/21] package: normalize output of 'make
	external-deps'
In-Reply-To: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e2ac9f0f8d09e4d0820293da3c6bbbbeba867ac6.1316464690.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For wget-downloaded packages, only the tarball name was displayed,
while for svn/git/bzr packages, the complete repository URL was
shown. As discussed on the list, what we want for 'make external-deps'
is only the tarball name even for git/svn/bzr downloads.

For local packages, we of course keep the full path since it's the
only information that we can provide.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index f1c76d0..2cb410c 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -141,7 +141,7 @@ define SOURCE_CHECK_GIT
 endef
 
 define SHOW_EXTERNAL_DEPS_GIT
-  echo "$($(PKG)_SITE) [git: $($(PKG)_DL_VERSION)]"
+	echo $($(PKG)_SOURCE)
 endef
 
 
@@ -155,7 +155,7 @@ define SOURCE_CHECK_BZR
 endef
 
 define SHOW_EXTERNAL_DEPS_BZR
-	echo "$($(PKG)_SITE) [bzr: $($(PKG)_DL_VERSION)]"
+	echo $($(PKG)_SOURCE)
 endef
 
 
@@ -173,7 +173,7 @@ define SOURCE_CHECK_SVN
 endef
 
 define SHOW_EXTERNAL_DEPS_SVN
-  echo "$($(PKG)_SITE) [svn: $($(PKG)_DL_VERSION)]"
+  echo $($(PKG)_SOURCE)
 endef
 
 
-- 
1.7.4.1
