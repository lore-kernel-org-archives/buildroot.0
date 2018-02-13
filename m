From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:46:27 +0100
Subject: [Buildroot] [git commit] systemd: resolved was renamed to resolve
 in meson build
Message-ID: <20180213214718.E320B84045@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=527b4d545b53233cf4d642b5af45fed30f6ba28e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the conversion to meson, this seems to be missed.
Found while trying to build systemd with uClibc toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1c31ebb34c..126727d602 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -287,10 +287,10 @@ SYSTEMD_CONF_OPTS += -Dnetworkd=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
-SYSTEMD_CONF_OPTS += -Dresolved=true
+SYSTEMD_CONF_OPTS += -Dresolve=true
 SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
 else
-SYSTEMD_CONF_OPTS += -Dresolved=false
+SYSTEMD_CONF_OPTS += -Dresolve=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
