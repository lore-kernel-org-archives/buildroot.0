From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 14:07:27 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: add optional
 cryptsetup dependency
Message-ID: <20190213214530.29EA88A34F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b96a4d090928daa90440dd11c0d5a377ef16e8e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5b2abdc3fe..bbcc14901f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -23,7 +23,6 @@ SYSTEMD_CONF_OPTS += \
 	-Dblkid=true \
 	-Dman=false \
 	-Dima=false \
-	-Dlibcryptsetup=false \
 	-Defi=false \
 	-Dgnu-efi=false \
 	-Dldconfig=false \
@@ -57,6 +56,13 @@ else
 SYSTEMD_CONF_OPTS += -Daudit=false
 endif
 
+ifeq ($(BR2_PACKAGE_CRYPTSETUP),y)
+SYSTEMD_DEPENDENCIES += cryptsetup
+SYSTEMD_CONF_OPTS += -Dlibcryptsetup=true
+else
+SYSTEMD_CONF_OPTS += -Dlibcryptsetup=false
+endif
+
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 SYSTEMD_DEPENDENCIES += elfutils
 SYSTEMD_CONF_OPTS += -Delfutils=true
