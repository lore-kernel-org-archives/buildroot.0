From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 00:19:37 +0200
Subject: [Buildroot] [git commit] systemd: Fix polkit build order
Message-ID: <20180707222245.CFFA787FF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fe0c50d3683be4975a4551ac183707692b11215
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to install polkit before systemd if we want to enable
polkit integration, because systemd will not install polkit
policy files unless it finds polkit-gobject-1.

Signed-off-by: Asgeir Bjarni Ingvarsson <asgeir@appdynamic.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 10e11a9277..04775ee778 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -283,6 +283,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
 SYSTEMD_CONF_OPTS += -Dpolkit=true
+SYSTEMD_DEPENDENCIES += polkit
 else
 SYSTEMD_CONF_OPTS += -Dpolkit=false
 endif
