From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 10 Apr 2014 16:59:26 +0100
Subject: [Buildroot] [PATCH 2/2] liblogging: Depend on systemd
In-Reply-To: <1397145566-11243-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1397145566-11243-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1397145566-11243-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package depends on systemd because in the configure phase it
searches for a file installed by systemd. We add systemd to it's
dependencies to ensure that is built before this package.

Fixes:
   http://autobuild.buildroot.net/results/32c/32c636020600aa3f378d326c84fac82eb1fb2871/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/liblogging/liblogging.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/liblogging/liblogging.mk b/package/liblogging/liblogging.mk
index fa181fb..3608c40 100644
--- a/package/liblogging/liblogging.mk
+++ b/package/liblogging/liblogging.mk
@@ -13,6 +13,7 @@ LIBLOGGING_CONF_OPT = --enable-cached-man-pages
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 LIBLOGGING_CONF_OPT += --enable-journal
+LIBLOGGING_DEPENDENCIES += systemd
 else
 LIBLOGGING_CONF_OPT += --disable-journal
 endif
-- 
1.7.1
