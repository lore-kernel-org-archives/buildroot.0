From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 23:05:32 +0200
Subject: [Buildroot] [git commit] go: honor building with V=1 for debugging
 purposes
Message-ID: <20180511211521.05E208CA8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=486334dd819b15943b6f9e93868a354be0b8ab20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Anisse Astier <anisse@astier.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index b70c5d49d8..6e2612481d 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -78,7 +78,8 @@ HOST_GO_TARGET_CC = \
 
 define HOST_GO_BUILD_CMDS
 	cd $(@D)/src && \
-		$(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) CGO_ENABLED=$(HOST_GO_CGO_ENABLED) ./make.bash
+		$(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
+		./make.bash $(if $(VERBOSE),-v)
 endef
 
 define HOST_GO_INSTALL_CMDS
