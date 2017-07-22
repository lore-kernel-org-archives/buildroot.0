From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sat, 22 Jul 2017 13:15:42 +0200
Subject: [Buildroot] [PATCH v10 3/3] support/scripts/fix-rpath: typo fix and
	unneeded "; " removed
In-Reply-To: <1500722142-20420-1-git-send-email-wg@grandegger.com>
References: <1500722142-20420-1-git-send-email-wg@grandegger.com>
Message-ID: <1500722142-20420-4-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/fix-rpath | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index f92e601..15705a3 100755
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
1.9.1
