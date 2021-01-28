From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 17:49:53 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/syslog-ng: fix
 build if net-snmp is installed on the host (again)
Message-ID: <20210128200057.E414A812DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8253f57ad804eed565d0d82098f0c6c9533f66c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

See also commit 4ff6e5239240a4e1bdf73c41d6e9bff9473ec62c which describes the
problem in detail.

The same problem now arises again, because syslog-ng renamed the
--enable-snmp-dest option into --enable-afsnmp. See syslog-ng commit
4537938474771673ef5bd4a9cad7c9a7dc20b7c1, first part of 3.27.1.

Update the configure options passed from Buildroot accordingly.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 40f4468e94e0c9885386b8a6ee105aed175f340f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/syslog-ng.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index f7182ba311..31608f3a02 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -99,10 +99,10 @@ endif
 
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
