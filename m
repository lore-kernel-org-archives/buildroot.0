From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 28 Jan 2021 10:27:51 +0100
Subject: [Buildroot] [PATCH 3/9] package/dmidecode: add SELinux refpolicy
 module
In-Reply-To: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
References: <20210128092757.1016598-1-maxime.chevallier@bootlin.com>
Message-ID: <20210128092757.1016598-4-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dmidecode provides 4 tools, for which support for SELinux is provided by
the admin/dmidecode refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/dmidecode/dmidecode.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 89d9155f95..3f09cc956d 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -9,6 +9,7 @@ DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
 DMIDECODE_LICENSE_FILES = LICENSE
+DMIDECODE_SELINUX_MODULES = dmidecode
 
 define DMIDECODE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
-- 
2.25.4
