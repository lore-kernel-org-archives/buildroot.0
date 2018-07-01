From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 14:19:44 +0200
Subject: [Buildroot] [git commit] systemd: add optional dependency on pcre2
Message-ID: <20180701122742.DA9A181408@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8dd03de565296698ceaff2aca22867ef365613c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd can use libpcre2 when available, so this commit adds the
detection of this library.

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 16c9d9f290..0d5e348594 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -144,6 +144,13 @@ else
 SYSTEMD_CONF_OPTS += -Dgcrypt=false
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+SYSTEMD_DEPENDENCIES += pcre2
+SYSTEMD_CONF_OPTS += -Dpcre2=true
+else
+SYSTEMD_CONF_OPTS += -Dpcre2=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
 SYSTEMD_CONF_OPTS += -Dmicrohttpd=true
