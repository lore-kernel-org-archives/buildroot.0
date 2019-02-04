From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Feb 2019 20:13:27 +0100
Subject: [Buildroot] [PATCH 2/3] package/systemd: add optional cryptsetup
 dependency
In-Reply-To: <20190204191328.31922-1-fontaine.fabrice@gmail.com>
References: <20190204191328.31922-1-fontaine.fabrice@gmail.com>
Message-ID: <20190204191328.31922-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
