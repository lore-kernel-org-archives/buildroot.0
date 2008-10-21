From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 21 Oct 2008 23:10:17 +0200
Subject: [Buildroot] [PATCH] new package wizard: change bash-specific
	construct
Message-ID: <200810212310.17396.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

${VAR//-/_} which replaces - with _ aborts with "syntax error" on a
system where /bin/sh points to dash. Use tr therefor as already done in
the line above rather than changing the shebang to bash.
---
 scripts/add_new_package.wizard |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/scripts/add_new_package.wizard b/scripts/add_new_package.wizard
index 63078b0..c5398e4 100755
--- a/scripts/add_new_package.wizard
+++ b/scripts/add_new_package.wizard
@@ -48,8 +48,7 @@ read CONFIG_OPTIONS
 URL=${DOWNLOAD_LOC%/*}
 TARBALL=${DOWNLOAD_LOC##*/}
 EXTENSION=${TARBALL##*.tar.}
-NAME_UPPER=`echo ${PACKAGE_NAME} | tr [a-z] [A-Z]`
-NAME_UPPER=${NAME_UPPER//-/_}
+NAME_UPPER=`echo ${PACKAGE_NAME} | tr [a-z-] [A-Z_]`
 
 mkdir ../package/${PACKAGE_NAME}
 
-- 
1.5.6.4
