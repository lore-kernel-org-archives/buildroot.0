From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:47:04 +0200
Subject: [Buildroot] [git commit] patchelf: always build this package
	required for RPATH sanitization
Message-ID: <20170720204307.524A87FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b972b108f47c894626452c6f96e5ef1524795db1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/patchelf/Config.in.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/patchelf/Config.in.host b/package/patchelf/Config.in.host
index d1c8375..6abe78e 100644
--- a/package/patchelf/Config.in.host
+++ b/package/patchelf/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_PATCHELF
-	bool "host patchelf"
+	bool
+	default y
 	help
 	  PatchELF is a small utility to modify the dynamic linker
 	  and RPATH of ELF executables.
