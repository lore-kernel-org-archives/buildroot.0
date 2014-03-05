From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Mar 2014 10:38:30 +0000
Subject: [Buildroot] [PATCH] crda: Disable for Python 3
Message-ID: <1394015910-64878-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is not compatible with Python 3.

Fixes:
   http://autobuild.buildroot.net/results/a1e/a1e53d66d3962fd5431e7601937b071a0a3c2084/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/crda/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/crda/Config.in b/package/crda/Config.in
index e56a45e..c59f6ec 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CRDA
 	bool "crda"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on !BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBNL
 	# regdb is a runtime dependency
-- 
1.7.1
