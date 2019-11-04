From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:30:31 +0100
Subject: [Buildroot] [git commit] package/iputils: add systemd dependency
Message-ID: <20191104212340.238F18E6FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a94bd8e6ffaf5a7e3dd43320a025e3fb7992229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed to ensure systemd services are installed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iputils/iputils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 57e90a973a..daceb192f2 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -49,6 +49,10 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 IPUTILS_NINFOD = n
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+IPUTILS_DEPENDENCIES += systemd
+endif
+
 # ninfod requires <pthread.h>
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 IPUTILS_NINFOD = n
