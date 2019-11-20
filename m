From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 22:33:07 +0100
Subject: [Buildroot] [git commit] package/rpcbind: add systemd as a
 build-time dependency
Message-ID: <20191120212641.8020C8F43A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33da50f0142f9e062df136c8c3cdd67036791e1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When systemd support is enabled, systemd should be built before,
otherwise the build fails with:

checking for SYSTEMD... no
configure: error: libsystemd support requested but found
package/pkg-generic.mk:228: recipe for target

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpcbind/rpcbind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 0f5011e522..46e5b27d35 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -17,6 +17,7 @@ RPCBIND_CONF_OPTS += --with-rpcuser=root
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+RPCBIND_DEPENDENCIES += systemd
 else
 RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
 endif
