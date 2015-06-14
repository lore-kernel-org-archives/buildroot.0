From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 16:33:31 +0200
Subject: [Buildroot] [PATCH 6/6] toolchain-buildroot: mark eglibc as
	deprecated
In-Reply-To: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434292411-5003-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1434292411-5003-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

eglibc is a dead project and has not been making any release since a
while, now that glibc is back and kicking. So let's deprecated our
eglibc support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index d9914b0..77a197e 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -49,6 +49,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_DEPRECATED_SINCE_2015_08
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our eglibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
2.1.0
