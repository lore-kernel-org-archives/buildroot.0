From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Aug 2014 23:57:08 +0200
Subject: [Buildroot] [git commit] libgpgme: Take into account that gnupg and
	gnupg2 are mutual exclusive
Message-ID: <20140830220339.5B8099D59A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a9a32d6928cd7c4871866b6512a7778d5e0671f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avoid that libgpgme can select the gnupg package although gnupg2 has
been already selected. Both packages are mutual exclusive and shouldn't
be selected at the same time.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
