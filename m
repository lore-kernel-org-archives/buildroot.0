From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 21:00:09 +0200
Subject: [Buildroot] [PATCH v3 04/10] toolchain-buildroot: update glibc
	comment for noMMU
In-Reply-To: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1459450815-6494-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1459450815-6494-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc is not available for noMMU platforms, so it doesn't make sense
to show the comment about glibc requiring dynamic libraries on noMMU
platforms.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index cb4fc18..ea290eb 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -83,6 +83,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	  http://www.gnu.org/software/libc/
 
 comment "(e)glibc only available with shared lib support"
+	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
-- 
2.6.4
