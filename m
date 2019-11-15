From: Michael Drake <michael.drake@codethink.co.uk>
Date: Fri, 15 Nov 2019 12:10:22 +0000
Subject: [Buildroot] [PATCH v1] docs/manual/quickstart: Mention sysroot dir.
Message-ID: <20191115121022.27662-1-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mention that staging/ is a symlink to the host/$(GNU_TARGET_NAME)/sysroot
directory.
---
 docs/manual/quickstart.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
index 74158ae249..d9bbc2527b 100644
--- a/docs/manual/quickstart.txt
+++ b/docs/manual/quickstart.txt
@@ -95,7 +95,8 @@ This directory contains several subdirectories:
   files, unstripped binaries and libraries that make it far too big
   for an embedded system. These development files are used to compile
   libraries and applications for the target that depend on other
-  libraries.
+  libraries. +staging/+ is actually a symlink to the toolchain's target
+  sysroot directory inside +host/+.
 
 * +target/+ which contains 'almost' the complete root filesystem for
   the target: everything needed is present except the device files in
-- 
2.20.1
