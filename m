From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 15:02:41 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/suricata: fix
 lzma dependency
Message-ID: <20200307135111.E6A2D8FB70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b87270ed2df526f989fe82c1df9e21291af5daa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

lzma package is a host-only package so replace this wrong dependency by
xz package

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2f185e82ed79a96a446362d27f5302f984d915d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/suricata/suricata.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 56eb6a706f..ebd830ea77 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -21,8 +21,8 @@ SURICATA_DEPENDENCIES = \
 	libpcap \
 	libyaml \
 	$(if $(BR2_PACKAGE_LZ4),lz4) \
-	$(if $(BR2_PACKAGE_LZMA),lzma) \
-	pcre
+	pcre \
+	$(if $(BR2_PACKAGE_XZ),xz)
 
 SURICATA_CONF_ENV = ac_cv_path_HAVE_SPHINXBUILD=no
 
