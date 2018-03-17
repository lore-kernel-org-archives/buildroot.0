From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Mar 2018 09:55:17 +0100
Subject: [Buildroot] [git commit] package/enlightenment: add
 xkeyboard-config optional dependency
Message-ID: <20180317085654.6B6F583697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47c7a8c2b3f20b76b4a8937d31419f40ed6a60df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The meson build systemd is checking for xkeyboard-config optional
dependency but there is no option to handle it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enlightenment/enlightenment.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 6ee983db76..ae68888aac 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -41,6 +41,10 @@ else
 ENLIGHTENMENT_MESON_OPTS += -Dmixer=false
 endif
 
+ifeq ($(BR2_PACKAGE_XKEYBOARD_CONFIG),y)
+ENLIGHTENMENT_DEPENDENCIES += xkeyboard-config
+endif
+
 define ENLIGHTENMENT_CONFIGURE_CMDS
 	rm -rf $(@D)/build
 	mkdir -p $(@D)/build
