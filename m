From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 22:46:34 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: add
	--enable/disable-zlib
Message-ID: <20160229214740.639A380AC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be207535d8850b8f6d15b70b321af3ea78e0f2a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 16c4d52..91da61b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -101,6 +101,13 @@ else
 SYSTEMD_CONF_OPTS += --disable-xz
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+SYSTEMD_DEPENDENCIES += zlib
+SYSTEMD_CONF_OPTS += --enable-zlib
+else
+SYSTEMD_CONF_OPTS += --disable-zlib
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
 SYSTEMD_CONF_OPTS += \
