From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 20:02:23 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] systemd: Fix polkit build
 order
Message-ID: <20180719180757.D2F7188FAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16356507ea38e68c5504e0c3fe26fe1e2206e888
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

We need to install polkit before systemd if we want to enable
polkit integration, because systemd will not install polkit
policy files unless it finds polkit-gobject-1.

Signed-off-by: Asgeir Bjarni Ingvarsson <asgeir@appdynamic.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0fe0c50d3683be4975a4551ac183707692b11215)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1c1808dbcb..aa71e83fc9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -277,6 +277,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
 SYSTEMD_CONF_OPTS += -Dpolkit=true
+SYSTEMD_DEPENDENCIES += polkit
 else
 SYSTEMD_CONF_OPTS += -Dpolkit=false
 endif
