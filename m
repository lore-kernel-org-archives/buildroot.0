From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:35 -0000
Subject: [Buildroot] [git commit] package/systemd: drop host-intltool
 dependency
Message-ID: <20190903133619.4457A81413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfcd5b9ff9677b9407ecad502744875302637ef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

intltool is not needed since version 236 and
https://github.com/systemd/systemd/commit/c81217920effddc93fb780cf8f9eb699d6fe1319
https://github.com/systemd/systemd/commit/9e8f3893e349a68312a817da72b3473b81b6869e

So drop it and replace it by TARGET_NLS_DEPENDENCIES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e8fd7967bd..b6aac6dc53 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -12,10 +12,10 @@ SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	host-gperf \
-	host-intltool \
 	kmod \
 	libcap \
-	util-linux
+	util-linux \
+	$(TARGET_NLS_DEPENDENCIES)
 
 SYSTEMD_PROVIDES = udev
 
