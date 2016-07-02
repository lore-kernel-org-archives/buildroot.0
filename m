From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:07:04 +0200
Subject: [Buildroot] [git commit] package/systemd: Add optional libxkbcommon
	support
Message-ID: <20160702110929.44E947FB5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dcde2093d2bf36c7a686d48b364edc86c8be29b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c79b64c..3baa6e7 100644
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
