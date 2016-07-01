From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:20 +0200
Subject: [Buildroot] [PATCH 20/31] package/systemd: add optional support for
	audit
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-20-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index eefd980..e3aacc6 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -64,6 +64,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-acl
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+SYSTEMD_CONF_OPTS += --enable-audit
+SYSTEMD_DEPENDENCIES += audit
+else
+SYSTEMD_CONF_OPTS += --disable-audit
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 SYSTEMD_CONF_OPTS += --enable-seccomp
 SYSTEMD_DEPENDENCIES += libseccomp
-- 
2.8.1
