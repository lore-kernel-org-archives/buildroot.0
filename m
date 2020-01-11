From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:36:31 +0100
Subject: [Buildroot] [git commit] package/glibc: add missing comment
Message-ID: <20200111142634.06EFF8A3F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62c621990ba8f5351bbf31d4a23dd5d447d3a6b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since [1], glibc package has a new option to install glibc utils to the
target. But this option is displayed below "Kernel Header Options".

As for uClibc package, add a comment line to separate Glibc options
from kernel header options.

[1] c6cd512fe2e954b2ccc0412717c1c3380bc5f69b

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index cc178468b5..5ecd058145 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -1,5 +1,7 @@
 if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
+comment "Glibc Options"
+
 config BR2_PACKAGE_GLIBC
 	bool
 	default y
