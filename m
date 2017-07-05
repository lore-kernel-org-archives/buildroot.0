From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:42 +0200
Subject: [Buildroot] [git commit] opkg-utils: use $(HOST_DIR) as PREFIX
	instead of DESTDIR
Message-ID: <20170705141337.13A8181D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe8495ffc5bd32614c39217be1b2c20f15721a6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... and remove the /usr prefix

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opkg-utils/opkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index 6f4e64e..df20222 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -15,7 +15,7 @@ define HOST_OPKG_UTILS_BUILD_CMDS
 endef
 
 define HOST_OPKG_UTILS_INSTALL_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) PREFIX=/usr install
+	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
 $(eval $(host-generic-package))
