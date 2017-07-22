From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 14:38:43 +0200
Subject: [Buildroot] [git commit] support/scripts/fix-rpath: typo fix and
	unneeded "; " removed
Message-ID: <20170722123439.EEB7481F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bc81f528bcc136b65d73e60a05993526704c0b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
