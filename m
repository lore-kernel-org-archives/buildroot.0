From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 21 Jul 2017 15:14:13 +0200
Subject: [Buildroot] [PATCH v9 3/3] support/scripts/fix-rpath: typo fix and
	unneeded "; " removed
In-Reply-To: <1500642853-5565-1-git-send-email-wg@grandegger.com>
References: <1500642853-5565-1-git-send-email-wg@grandegger.com>
Message-ID: <1500642853-5565-4-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 support/scripts/fix-rpath | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 9272d2d..5a30207 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -27,7 +27,7 @@ Description:
 
     Sanitization behaves the same whatever the kind of the processed tree,
     but the resulting RPATH differs. The rpath sanitization is done using
-    "patchelf --make-rpath-relazive".
+    "patchelf --make-rpath-relative".
 
 Arguments:
 
@@ -81,7 +81,7 @@ main() {
                 find_args+=( "-path" "${TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR}" "-prune" "-o" )
 
             for excludepath in ${HOST_EXCLUDEPATHS}; do
-                find_args+=( "-path" "${HOST_DIR}""${excludepath}" "-prune" "-o" );
+                find_args+=( "-path" "${HOST_DIR}""${excludepath}" "-prune" "-o" )
             done
 
             # do not process the patchelf binary but a copy to work-around "file in use"
-- 
2.7.4
