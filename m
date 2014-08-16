From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 16:39:52 +0200
Subject: [Buildroot] [PATCH 2/2] ecryptfs-utils: ensure getent is installed
	on the target
In-Reply-To: <1408199992-26942-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408199992-26942-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1408199992-26942-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug #7142.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ecryptfs-utils/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index 7999ea5..1a92b47 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	# runtime dependency only, some scripts are using the
 	# 'gettext' program to get translations
 	select BR2_PACKAGE_GETTEXT
+	# runtime dependency only
+	select BR2_TOOLCHAIN_INSTALL_GETENT
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # keyutils
 	depends on !BR2_avr32 && !BR2_microblaze # keyutils
-- 
2.0.0
