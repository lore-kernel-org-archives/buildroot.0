From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:47:09 +0200
Subject: [Buildroot] [git commit] package/systemd: add gnutls support
Message-ID: <20200412133307.B3EAE8E774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93d8b5d903017c5c66e7acd6f251c87325b87861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 14490106aa..78a801926f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -70,6 +70,13 @@ else
 SYSTEMD_CONF_OPTS += -Delfutils=false
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SYSTEMD_DEPENDENCIES += gnutls
+SYSTEMD_CONF_OPTS += -Dgnutls=true
+else
+SYSTEMD_CONF_OPTS += -Dgnutls=false
+endif
+
 ifeq ($(BR2_PACKAGE_IPTABLES),y)
 SYSTEMD_DEPENDENCIES += iptables
 SYSTEMD_CONF_OPTS += -Dlibiptc=true
