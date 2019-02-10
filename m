From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 14:07:32 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: add optional
 bash-completion dependency
Message-ID: <20190213214530.339468A34D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84dfe5d9b5d08aad154e6f730366823b04996c45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index bbcc14901f..7a46a50ed3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -10,6 +10,7 @@ SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, s
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	host-gperf \
 	host-intltool \
 	kmod \
