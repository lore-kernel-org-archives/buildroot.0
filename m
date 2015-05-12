From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 May 2015 23:10:07 +0300
Subject: [Buildroot] [PATCH 2/2] rsyslog: drop autoreconf
In-Reply-To: <e2f2e9591f74058025374bfeb2f41de5b6d4c47d.1431461407.git.baruch@tkos.co.il>
References: <e2f2e9591f74058025374bfeb2f41de5b6d4c47d.1431461407.git.baruch@tkos.co.il>
Message-ID: <9f7884794b6133f0a53ee03b5ac040d8285e1379.1431461407.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patches touching configure.ac were dropped in 9d9bbf9b7935 (rsyslog: bump
to version 8.8.0, 2015-02-25). Remove autoreconf as well.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/rsyslog/rsyslog.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 99e6eba38dc5..261f59dd35c9 100644
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
-- 
2.1.4
