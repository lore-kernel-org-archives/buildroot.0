From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:42:29 +0200
Subject: [Buildroot] [PATCH autobuild] autobuild-run: libffi is now
	available on ARC
Message-ID: <1414230149-2227-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 34c2afeb750fbbe92e4c00eaa374303bcf5e2584 in Buildroot
("libffi: back-port support for ARC"), we have ARC support in libffi,
so we should no longer prevent configurations having libffi enabled on
ARC from being used on the autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
---
 scripts/autobuild-run | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index c311ebf..a648813 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -285,8 +285,6 @@ def fixup_config(instance, sysinfo):
         return False
     if 'BR2_sh2a=y\n' in configlines and  'BR2_PACKAGE_LIBFFI=y\n' in configlines:
         return False
-    if 'BR2_arc=y\n' in configlines and  'BR2_PACKAGE_LIBFFI=y\n' in configlines:
-        return False
     if 'BR2_nios2=y\n' in configlines and 'BR2_PACKAGE_LIBFFI=y\n' in configlines:
         return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
-- 
2.0.0
