From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 May 2015 11:01:49 +0200
Subject: [Buildroot] [git commit] rsyslog: drop autoreconf
Message-ID: <20150514090228.EB5547FA13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e624b3638420bb688f1f46a63cb78eb88430884
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patches touching configure.ac were dropped in 9d9bbf9b7935 (rsyslog: bump
to version 8.8.0, 2015-02-25). Remove autoreconf as well.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 99e6eba..261f59d 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -16,8 +16,6 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 	pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnare
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
-# For mysql and pgsql support patches
-RSYSLOG_AUTORECONF = YES
 
 # Build after BusyBox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
