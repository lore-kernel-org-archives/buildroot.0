From: Keith Mok <ek9852@gmail.com>
Date: Mon, 20 Aug 2018 18:29:20 -0700
Subject: [Buildroot] [PATCH 1/1] systemd: add optional dependency on elfutils
Message-ID: <20180821012920.91804-1-ek9852@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd can use elfutils when available, so this commit adds the
detection of this library.

Signed-off-by: Keith Mok <ek9852@gmail.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d7031ed21d..4813496670 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -65,6 +65,13 @@ else
 SYSTEMD_CONF_OPTS += -Daudit=false
 endif
 
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+SYSTEMD_DEPENDENCIES += elfutils
+SYSTEMD_CONF_OPTS += -Delfutils=true
+else
+SYSTEMD_CONF_OPTS += -Delfutils=false
+endif
+
 # Both options can't be selected at the same time so prefer libidn2
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 SYSTEMD_DEPENDENCIES += libidn2
-- 
2.15.2 (Apple Git-101.1)
