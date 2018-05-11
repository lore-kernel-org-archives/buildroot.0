From: Anisse Astier <anisse@astier.eu>
Date: Fri, 11 May 2018 22:50:36 +0200
Subject: [Buildroot] [PATCH v2 4/5] go: honor building with V=1 for
 debugging purposes
In-Reply-To: <20180511205037.10078-1-anisse@astier.eu>
References: <20180511205037.10078-1-anisse@astier.eu>
Message-ID: <20180511205037.10078-5-anisse@astier.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anisse Astier <anisse@astier.eu>
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
-- 
2.14.3
