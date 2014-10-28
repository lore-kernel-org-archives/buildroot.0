From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 23:19:17 +0100
Subject: [Buildroot] [PATCH 2/3] binutils: bump the default target version
	of binutils
In-Reply-To: <1414534758-7545-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1414534758-7545-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1414534758-7545-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When binutils for the host is not built (which is the case when an
external toolchain is used), the version of binutils used is 2.21,
which is quite old. Since we have bumped to 2.22 as the default
version for the host binutils, let's do the same for the target
binutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ab9f167..b8dab5d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -12,7 +12,7 @@ ifeq ($(BR2_avr32),y)
 # avr32 uses a special version
 BINUTILS_VERSION = 2.18-avr32-1.0.1
 else
-BINUTILS_VERSION = 2.21
+BINUTILS_VERSION = 2.22
 endif
 endif
 
-- 
2.0.0
