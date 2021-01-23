From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:35:41 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: fix build if net-snmp
 is installed on the host (again)
Message-ID: <20210123201614.7E77F815DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40f4468e94e0c9885386b8a6ee105aed175f340f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See also commit 4ff6e5239240a4e1bdf73c41d6e9bff9473ec62c which describes the
problem in detail.

The same problem now arises again, because syslog-ng renamed the
--enable-snmp-dest option into --enable-afsnmp. See syslog-ng commit
4537938474771673ef5bd4a9cad7c9a7dc20b7c1, first part of 3.27.1.

Update the configure options passed from Buildroot accordingly.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/syslog-ng/syslog-ng.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 6d22883116..14888d2aed 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -100,10 +100,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
 SYSLOG_NG_DEPENDENCIES += netsnmp
-SYSLOG_NG_CONF_OPTS += --enable-snmp-dest
+SYSLOG_NG_CONF_OPTS += --enable-afsnmp
 SYSLOG_NG_CONF_OPTS += --with-net-snmp="$(STAGING_DIR)/usr/bin"
 else
-SYSLOG_NG_CONF_OPTS += --disable-snmp-dest
+SYSLOG_NG_CONF_OPTS += --disable-afsnmp
 endif
 
 define SYSLOG_NG_INSTALL_INIT_SYSV
