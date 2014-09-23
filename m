From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 23 Sep 2014 11:45:45 +0200
Subject: [Buildroot] [PATCH 6/8] systemd: make libseccomp usage determinist
In-Reply-To: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
References: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
Message-ID: <1411465547-6847-6-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 39b458e..c7cff0d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -76,6 +76,13 @@ else
 SYSTEMD_CONF_OPT += --disable-gudev
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+SYSTEMD_CONF_OPT += --enable-seccomp
+SYSTEMD_DEPENDENCIES += libseccomp
+else
+SYSTEMD_CONF_OPT += --disable-seccomp
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
 SYSTEMD_DEPENDENCIES += \
 	xz 		\
-- 
1.9.1
