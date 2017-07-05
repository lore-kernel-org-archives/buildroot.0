From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:44 +0200
Subject: [Buildroot] [git commit] dos2unix: use prefix instead of DESTDIR
	for host installation
Message-ID: <20170705141337.3DB7381D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86e07957b61f15aad2329f821bf11798ad0cdb6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

prefix defaults to /usr, so setting DESTDIR installs things in
$(HOST_DIR)/usr.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dos2unix/dos2unix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 87525fb..276a18e 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -38,7 +38,7 @@ define HOST_DOS2UNIX_BUILD_CMDS
 endef
 
 define HOST_DOS2UNIX_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) ENABLE_NLS= \
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) ENABLE_NLS= \
 		install
 endef
 
