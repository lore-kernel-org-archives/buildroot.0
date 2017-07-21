From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 21 Jul 2017 15:03:02 +0200
Subject: [Buildroot] [PATCH v8 2/3] support/scripts/fix-rpath: check if the
	patchelf utilitiy is executable
In-Reply-To: <1500642183-5456-1-git-send-email-wg@grandegger.com>
References: <1500642183-5456-1-git-send-email-wg@grandegger.com>
Message-ID: <1500642183-5456-3-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 support/scripts/fix-rpath | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index f7c70b7..8fa5048 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -45,6 +45,9 @@ Environment:
 
     TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR
                  (default HOST_DIR/opt/ext-toolchain)
+
+Returns:         0 if success or 1 in case of error
+
 EOF
 }
 
@@ -60,6 +63,11 @@ main() {
     local find_args=( )
     local sanitize_extra_args=( )
 
+    if [ ! -x "${PATCHELF}" ]; then
+	echo "Error: patchelf utility '${PATCHELF}' not found"
+	exit 1;
+    fi
+
     case "${tree}" in
         host)
             rootdir="${HOST_DIR}"
-- 
2.7.4
