From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 23 Oct 2019 20:09:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/iwd: disable man pages
Message-ID: <20191023180919.16269-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/3f68bad231b18485871f24175001e1525501f35d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iwd/iwd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index b172d94fc6..40ee06ba6f 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -12,7 +12,9 @@ IWD_LICENSE_FILES = COPYING
 # sources from git, no configure script provided
 IWD_AUTORECONF = YES
 
-IWD_CONF_OPTS = --enable-external-ell
+IWD_CONF_OPTS = \
+	--disable-manual-pages \
+	--enable-external-ell
 IWD_DEPENDENCIES = ell
 
 # autoreconf requires an existing build-aux directory
-- 
2.23.0
