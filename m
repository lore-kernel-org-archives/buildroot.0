From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 11:25:26 +0100
Subject: [Buildroot] [git commit] package/systemd: add optional iptables
 dependency
Message-ID: <20190204102414.C89DD8082D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fe205c59be863fa8a4a1609ae9099423a908adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 15db1969e5..f9df66b039 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -64,6 +64,13 @@ else
 SYSTEMD_CONF_OPTS += -Delfutils=false
 endif
 
+ifeq ($(BR2_PACKAGE_IPTABLES),y)
+SYSTEMD_DEPENDENCIES += iptables
+SYSTEMD_CONF_OPTS += -Dlibiptc=true
+else
+SYSTEMD_CONF_OPTS += -Dlibiptc=false
+endif
+
 # Both options can't be selected at the same time so prefer libidn2
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 SYSTEMD_DEPENDENCIES += libidn2
