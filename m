From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 11:28:05 +0200
Subject: [Buildroot] [git commit] package/rsyslog: ignore CVE-2015-3243
Message-ID: <20210424090312.EE03E8039D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb4402b51693e8d191bb568622ed9cf9315493fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://security-tracker.debian.org/tracker/CVE-2015-3243
 "Rsyslog uses weak permissions for generating log files."

Ignoring this CVE for Buildroot as normally there are not local
users and a build could customize the rsyslog.conf to be more
restrictive ($FileCreateMode 0640).

Example fix from Alpino Linux
 https://github.com/libTorrentUser/alpino-linux-aports/commit/3cb5210cdac46fb8805d4028df16f5889f393a09

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rsyslog/rsyslog.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 1aa81b8eac..6cf53ccb82 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -9,6 +9,10 @@ RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 RSYSLOG_CPE_ID_VENDOR = rsyslog
+# rsyslog uses weak permissions for generating log files.
+# Ignoring this CVE as Buildroot normally doesn't have local users and a build
+# could customize the rsyslog.conf to be more restrictive ($FileCreateMode 0640)
+RSYSLOG_IGNORE_CVES += CVE-2015-3243
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
 RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
