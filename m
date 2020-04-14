From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Apr 2020 19:12:40 +0200
Subject: [Buildroot] [PATCH v2,1/6] package/collectd: drop autoreconf
Message-ID: <20200414171245.2235154-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

autoreconf is not needed since bump to version 5.11.0 in commit
57adbfc482454e3fb17172626b2dc971afaf5cfd which dropped patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/collectd.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index c09edebfc9..dda15b0162 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -12,8 +12,6 @@ COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
 COLLECTD_LICENSE_FILES = COPYING
-# We're patching configure.ac
-COLLECTD_AUTORECONF = YES
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
-- 
2.25.1
