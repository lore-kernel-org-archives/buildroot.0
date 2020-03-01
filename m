From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 19:16:31 +0100
Subject: [Buildroot] [git commit] package/systemd: also fix rpath for
 machine-id-setup
Message-ID: <20200301180538.7C6328F0E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dabb5181ad2873e87935b778d1f6772ec361fa16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: #12576

Reported-by: Melanie <melanie@trash-mail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index bed4ed0be7..ca2174e5fb 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -570,6 +570,7 @@ HOST_SYSTEMD_DEPENDENCIES = \
 # * thus re-tweak rpath after the installation for all binaries that need it
 HOST_SYSTEMD_HOST_TOOLS = \
 	systemd-analyze \
+	systemd-machine-id-setup \
 	systemd-mount \
 	systemd-nspawn \
 	systemctl \
