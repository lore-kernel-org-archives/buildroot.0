From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 14:07:22 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: add optional
 valgrind dependency
Message-ID: <20190213214530.2093E8A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0f3138f819f29fcd5d37b429ccc3626fd15afe8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f9df66b039..5b2abdc3fe 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -117,6 +117,13 @@ else
 SYSTEMD_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+SYSTEMD_DEPENDENCIES += valgrind
+SYSTEMD_CONF_OPTS += -Dvalgrind=true
+else
+SYSTEMD_CONF_OPTS += -Dvalgrind=false
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 SYSTEMD_DEPENDENCIES += xz
 SYSTEMD_CONF_OPTS += -Dxz=true
