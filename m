From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 10 Jan 2020 23:38:08 +0100
Subject: [Buildroot] [PATCH] package/glibc: add missing comment
Message-ID: <20200110223808.9070-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since [1], glibc package has a new option to install glibc utils to the
target. But this option is displayed below "Kernel Header Options".

As for uClibc package, add a comment line to separate Glibc options
from kernel header options.

[1] c6cd512fe2e954b2ccc0412717c1c3380bc5f69b

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.24.1
