From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Jun 2014 14:44:28 +0100
Subject: [Buildroot] [PATCH 4/5] gnupg: Make gnupg and gnupg2 mutual
	exclusive
In-Reply-To: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1402062269-57018-5-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
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
-- 
1.7.1
