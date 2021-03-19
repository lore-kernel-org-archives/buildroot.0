From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 18:21:01 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/dmidecode: add
 SELinux refpolicy module
Message-ID: <20210319171640.0339680046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa8a2a71be71a974acf3f5d27377e5e42d77ea5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Dmidecode provides 4 tools, for which support for SELinux is provided by
the admin/dmidecode refpolicy module.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 205f03d1b886bc12586d54262a47b8d7a48961b9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
