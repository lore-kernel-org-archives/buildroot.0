From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 10:52:51 +0200
Subject: [Buildroot] [PATCH] elfutils: propagate architecture dependency to
	comment
Message-ID: <1400316771-25226-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

elfutils depends on !BR2_avr32, but this dependency was not properly
propagated to the comment about toolchain options. This commit fixes
that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 588c29d..6025a74 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -1,4 +1,5 @@
 comment "elfutils needs a toolchain w/ largefile, wchar"
+	depends on !BR2_avr32
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ELFUTILS
-- 
1.9.3
