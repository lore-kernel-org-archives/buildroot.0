From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 28 Aug 2014 13:16:21 +0100
Subject: [Buildroot] [PATCH] libgpgme: Take into account that gnupg and
	gnupg2 are mutual exclusive
Message-ID: <1409228181-29052-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid that libgpgme can select the gnupg package although gnupg2 has
been already selected. Both packages are mutual exclusive and shouldn't
be selected at the same time.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libgpgme/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
index a303bfa..e176dac 100644
--- a/package/libgpgme/Config.in
+++ b/package/libgpgme/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBGPGME
 	bool "libgpgme"
 	depends on BR2_USE_MMU # libassuan
 	#gnupg is not needed to build, but at runtime.
-	select BR2_PACKAGE_GNUPG
+	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBASSUAN
 	help
-- 
1.7.1
