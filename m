From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 12 Feb 2018 22:02:41 +0100
Subject: [Buildroot] [PATCH] systemd: resolved was renamed to resolve in
 meson build
Message-ID: <20180212210240.GA19381@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While the conversion to meson, this seems to be missed.
Found while trying to build systemd with uClibc toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/systemd/systemd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a6c4b33..2bc665e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -298,10 +298,10 @@ SYSTEMD_CONF_OPTS += -Dnetworkd=false
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
-- 
2.1.4
