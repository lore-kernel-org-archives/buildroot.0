From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:32:44 +0200
Subject: [Buildroot] [git commit] gnupg: make gnupg and gnupg2 mutually
	exclusive
Message-ID: <20140723213300.3FBCF9CDC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cadb26e6d4267998e6927bd5b972b2cffeb19e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 90f07c2..1dc27a4 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GNUPG
 	bool "gnupg"
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_NCURSES
+	depends on !BR2_PACKAGE_GNUPG2
 	help
 	  GnuPG is the GNU project's complete and free implementation
 	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
