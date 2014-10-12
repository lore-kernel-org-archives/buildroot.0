From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 18:32:16 +0200
Subject: [Buildroot] [git commit] ecryptfs-utils: add runtime dependency on
	getent
Message-ID: <20141012163257.87A94B2996@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66215ffc6d711840180ad1fdba1548d037c05bdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes bug #7142.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ecryptfs-utils/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
