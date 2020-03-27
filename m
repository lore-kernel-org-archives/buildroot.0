From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 27 Mar 2020 11:29:54 -0700
Subject: [Buildroot] [PATCH v3 1/7] package/vala/vala-wrapper: fix wrapper
Message-ID: <20200327183000.1005676-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Add double quotes around the $@ variable to prevent globbing.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/vala/vala-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vala/vala-wrapper b/package/vala/vala-wrapper
index ae2f7ca671..84fc905b9f 100644
--- a/package/vala/vala-wrapper
+++ b/package/vala/vala-wrapper
@@ -1,2 +1,2 @@
 #!/bin/sh
-$0- at VALA_VERSION@ --vapidir=${STAGING_DIR}/usr/share/vala/vapi --girdir=${STAGING_DIR}/usr/share/gir-1.0 $@
+$0- at VALA_VERSION@ --vapidir=${STAGING_DIR}/usr/share/vala/vapi --girdir=${STAGING_DIR}/usr/share/gir-1.0 "$@"
-- 
2.25.1
