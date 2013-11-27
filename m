From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 27 Nov 2013 13:42:41 +0000
Subject: [Buildroot] [PATCH v2 2/2] grantlee: Disable on MIPS64
In-Reply-To: <1385559761-40501-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1385559761-40501-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1385559761-40501-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package selects BR2_PACKAGE_QT_SCRIPT which is not supported on MIPS64

Acked-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/grantlee/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 84afad2..e7383fb 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GRANTLEE
 	bool "grantlee"
+	depends on !BR2_mips64el && !BR2_mips64
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_SCRIPT
 	select BR2_PACKAGE_QT_GUI_MODULE
-- 
1.7.1
