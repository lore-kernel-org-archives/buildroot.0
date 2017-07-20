From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 16:35:15 +0200
Subject: [Buildroot] [PATCH v8 04/10] patchelf: always build this package
	required for RPATH sanitization
In-Reply-To: <1500561321-6623-1-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
Message-ID: <1500561321-6623-5-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 package/patchelf/Config.in.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/patchelf/Config.in.host b/package/patchelf/Config.in.host
index d1c8375..7b19e6a 100644
--- a/package/patchelf/Config.in.host
+++ b/package/patchelf/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_PATCHELF
-	bool "host patchelf"
+	bool
+	default "y"
 	help
 	  PatchELF is a small utility to modify the dynamic linker
 	  and RPATH of ELF executables.
-- 
2.7.4
