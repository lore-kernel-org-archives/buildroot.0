From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 19:39:37 +0200
Subject: [Buildroot] [git commit] package/eudev: explicitly disable rules
	generator if not wanted
Message-ID: <20160715183413.6C35482257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=077f70a834588198bcdec95aac37a78f934b1a1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/eudev.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 4818ea5..e3d3d63 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -31,6 +31,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
 EUDEV_CONF_OPTS += --enable-rule-generator
+else
+EUDEV_CONF_OPTS += --disable-rule-generator
 endif
 
 ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
