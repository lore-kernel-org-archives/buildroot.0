From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:18:06 +0200
Subject: [Buildroot] [git commit] dmidecode: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121836.9B78A81F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a79220ab42d70eb5802f3daa0f9324255a54b509
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmidecode/dmidecode.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 4298d88..cd30aa7 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -11,11 +11,11 @@ DMIDECODE_LICENSE = GPLv2+
 DMIDECODE_LICENSE_FILES = LICENSE
 
 define DMIDECODE_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
 
 define DMIDECODE_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) prefix=/usr DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) prefix=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
