From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Aug 2014 11:54:09 +0200
Subject: [Buildroot] [PATCHv2 2/2] ecryptfs-utils: add runtime dependency on
	getent
In-Reply-To: <1408355649-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408355649-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1408355649-28891-3-git-send-email-thomas.petazzoni@free-electrons.com>
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
index 7999ea5..0d912c7 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	# runtime dependency only, some scripts are using the
 	# 'gettext' program to get translations
 	select BR2_PACKAGE_GETTEXT
+	# runtime dependency only
+	select BR2_PACKAGE_GETENT
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # keyutils
 	depends on !BR2_avr32 && !BR2_microblaze # keyutils
-- 
2.0.0
