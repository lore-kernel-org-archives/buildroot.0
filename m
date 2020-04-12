From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:47:09 +0200
Subject: [Buildroot] [git commit] package/systemd: add p11-kit support
Message-ID: <20200412133307.A22278E773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09d0c7b6ef732490e612a97536595310d1decba2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7ba4c540d8..7d0789f493 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -158,6 +158,13 @@ else
 SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no -Dgcrypt=false
 endif
 
+ifeq ($(BR2_PACKAGE_P11_KIT),y)
+SYSTEMD_DEPENDENCIES += p11-kit
+SYSTEMD_CONF_OPTS += -Dp11kit=true
+else
+SYSTEMD_CONF_OPTS += -Dp11kit=false
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 SYSTEMD_DEPENDENCIES += pcre2
 SYSTEMD_CONF_OPTS += -Dpcre2=true
