From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 2 Jul 2014 17:10:41 +0200
Subject: [Buildroot] [PATCH v2] use default binutils for sh architecture
Message-ID: <20140702151041.GA10042@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested toolchain compiles with binutils 2.22 and 2.24.
Result tested in Qemu 2.0.0. (only little endian version
tested)

---
 Changes v1 -> v2:
   - split binutils and kernel patch (requested via #buildroot)

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/binutils/Config.in.host |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 08540a3..a58fe93 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,6 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
-	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
 	default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze || BR2_powerpc64le
 	default BR2_BINUTILS_VERSION_2_22
 	help
-- 
1.7.10.4
