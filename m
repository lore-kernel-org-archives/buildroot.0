From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 28 Jan 2021 10:27:55 +0100
Subject: [Buildroot] [PATCH 7/9] package/kismet: add SELinux refpolicy module
In-Reply-To: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
References: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
Message-ID: <20210128092757.1016598-8-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SELinux support for kismet is provided by the admin/kismet refpolicy
module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/kismet/kismet.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index b39b58d81b..5445db0b1f 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -17,6 +17,8 @@ KISMET_DEPENDENCIES = \
 	zlib
 KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = LICENSE
+KISMET_SELINUX_MODULES = kismet
+
 KISMET_CONF_OPTS = --disable-debuglibs
 
 KISMET_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.25.4
