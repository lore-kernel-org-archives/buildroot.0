From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] softether: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132037.B51F07F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fec991c78270ac3fe00e11ad1203ffc26e1f9cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/softether/softether.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 9f98774..da7d129 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -34,9 +34,9 @@ HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-openssl host-readline
 # target build creates the file hamcore.se2 which needs the host variant of
 # hamcorebuilder, for details see http://www.vpnusers.com/viewtopic.php?p=5426
 define HOST_SOFTETHER_BUILD_CMDS
-	$(MAKE) -C $(@D)/src/Mayaqua
-	$(MAKE) -C $(@D)/src/Cedar
-	$(MAKE) -C $(@D)/src/hamcorebuilder
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/src/Mayaqua
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/src/Cedar
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/src/hamcorebuilder
 endef
 
 define HOST_SOFTETHER_INSTALL_CMDS
