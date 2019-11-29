From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 16:04:12 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/rpcbind: add
 systemd as a build-time dependency
Message-ID: <20191129153902.8DA1582A1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28638c222378f539ae58f6ebd2b83b62a9a3caa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

When systemd support is enabled, systemd should be built before,
otherwise the build fails with:

checking for SYSTEMD... no
configure: error: libsystemd support requested but found
package/pkg-generic.mk:228: recipe for target

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 33da50f0142f9e062df136c8c3cdd67036791e1f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpcbind/rpcbind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index 5c216afc93..d69735d32e 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -17,6 +17,7 @@ RPCBIND_CONF_OPTS += --with-rpcuser=root
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+RPCBIND_DEPENDENCIES += systemd
 else
 RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
 endif
