From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Apr 2015 22:58:05 +0200
Subject: [Buildroot] [git commit] Revert "dhcpcd: fix ipv6 related compile
	failure"
Message-ID: <20150429205838.7082681DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56e42a9f4399adfa106ef6d6b5d599700ba61b99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 6b1f66643d782fc6f00e7436d41ceea6d88ad6bf.

It turns out to not really fix the build errors after all, so revert it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 756a660..4056351 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -20,8 +20,8 @@ endif
 
 define DHCPCD_CONFIGURE_CMDS
 	(cd $(@D); \
-	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
-		./configure --os=linux \
+	$(TARGET_CONFIGURE_OPTS) ./configure \
+		--os=linux \
 		$(DHCPCD_CONFIG_OPTS) )
 endef
 
