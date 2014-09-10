From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Sep 2014 15:30:05 +0100
Subject: [Buildroot] [PATCH 1/2] coreutils: Do not install uptime
Message-ID: <1410359406-49326-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

coreutils' uptime doesn't work and its execution fails with a message
like this one:

  uptime: couldn't get boot time: No such file or directory

busybox and procps-ng provide a working alternative.

This is a common old problem as we can see here:

  https://lists.openwrt.org/pipermail/openwrt-devel/2011-March/010006.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos.Chandras <Markos.Chandras@imgtec.com>
---
 package/coreutils/coreutils.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 07a1347..7457b79 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -61,7 +61,8 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 		PERL=missing
 
 COREUTILS_CONF_OPT = --disable-rpath \
-		--enable-install-program=hostname
+		--enable-install-program=hostname \
+		--enable-no-install-program=uptime
 
 define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
-- 
1.7.1
