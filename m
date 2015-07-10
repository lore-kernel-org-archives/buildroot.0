From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Jul 2015 18:05:07 +0200
Subject: [Buildroot] [PATCH 1/2] heimdal: needs host-ncurses
Message-ID: <1436544308-22652-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it will fail with an error like this one:

checking for tgetent in -lcurses... no
checking for tgetent in -lncurses... no
configure: error: libcurses or libncurses are required!

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/heimdal/heimdal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 6260f8c..19bca5e 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -6,7 +6,7 @@
 
 HEIMDAL_VERSION = 1.6rc2
 HEIMDAL_SITE = http://www.h5l.org/dist/src
-HEIMDAL_DEPENDENCIES = host-e2fsprogs host-pkgconf
+HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
-- 
2.3.6
