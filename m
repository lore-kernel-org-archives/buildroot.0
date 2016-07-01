From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:27 +0200
Subject: [Buildroot] [PATCH 27/31] package/systemd: Add optional
	libxkbcommon support
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-27-git-send-email-maxime.hadjinlian@gmail.com>
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
index d63d1cc..08c60df 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -87,6 +87,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-seccomp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
+SYSTEMD_CONF_OPTS += --enable-xkbcommon
+SYSTEMD_DEPENDENCIES += libxkbcommon
+else
+SYSTEMD_CONF_OPTS += --disable-xkbcommon
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_KDBUS),y)
 SYSTEMD_CONF_OPTS += --enable-kdbus
 else
-- 
2.8.1
