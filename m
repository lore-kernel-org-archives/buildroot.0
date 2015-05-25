From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2015 22:25:21 +0200
Subject: [Buildroot] [git commit] iproute2: drop unneeded Werror handling
Message-ID: <20150525205004.5F5237FC1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e881e2def46b20b5e60bae0c3afe6dd1f02ecb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has dropped -Werror since the 3.12 release, so there's no point in
us sed'ing it away:

https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/commit/?id=3140e9a3a343d37a8d828ee27e16ad9f3f9ab389

Reported-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iproute2/iproute2.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 49b1fdc..a8f4400 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -51,7 +51,6 @@ endif
 define IPROUTE2_CONFIGURE_CMDS
 	$(SED) 's/gcc/$$CC $$CFLAGS/g' $(@D)/configure
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
-	$(SED) 's/-Werror//' $(IPROUTE2_DIR)/Makefile
 	$(IPROUTE2_DISABLE_ARPD)
 	$(IPROUTE2_WITH_IPTABLES)
 endef
