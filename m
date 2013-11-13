From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 13 Nov 2013 15:28:49 -0600
Subject: [Buildroot] [PATCH v3 6/7] toolchain: uclibc does not support
	microblze
In-Reply-To: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
References: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1384378130-8599-7-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 toolchain/toolchain-buildroot/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 1529004..57bbc3d 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -9,6 +9,7 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
 	select BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_microblaze
 	help
 	  This option selects uClibc as the C library for the
 	  cross-compilation toolchain.
-- 
1.7.1
