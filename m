From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  4 Feb 2019 20:13:28 +0100
Subject: [Buildroot] [PATCH 3/3] package/systemd: add optional
 bash-completion dependency
In-Reply-To: <20190204191328.31922-1-fontaine.fabrice@gmail.com>
References: <20190204191328.31922-1-fontaine.fabrice@gmail.com>
Message-ID: <20190204191328.31922-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
