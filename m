From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:48:56 +0200
Subject: [Buildroot] [git commit] package/systemd: disable portabled
Message-ID: <20200805134339.CE4A681358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b37fa74380557689f2309370c5bc1e770a1831eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

portabled is a container-like service, but so far its still a preview
and basically unknown as the portablectl is hidden in
/usr/lib/systemd.

Disable it for now.

See https://systemd.io/PORTABLE_SERVICES/

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4fcff90512..e356cb1add 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -41,7 +41,8 @@ SYSTEMD_CONF_OPTS += \
 	-Dmount-path=/usr/bin/mount \
 	-Dumount-path=/usr/bin/umount \
 	-Didn=true \
-	-Dnss-systemd=true
+	-Dnss-systemd=true \
+	-Dportabled=false
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
