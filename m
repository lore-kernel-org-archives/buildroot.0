From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 11:19:46 +0200
Subject: [Buildroot] [git commit] systemd: add optional dependency on
 elfutils
Message-ID: <20180821091222.B33248E151@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d609585ff7991ce720d05b475c90b004c560f4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd can use elfutils when available, so this commit adds the
detection of this library.

Signed-off-by: Keith Mok <ek9852@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
