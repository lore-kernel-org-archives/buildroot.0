From: Anisse Astier <anisse@astier.eu>
Date: Fri, 11 May 2018 12:10:19 +0200
Subject: [Buildroot] [PATCH 2/3] go: honor building with V=1 for debugging
 purposes
In-Reply-To: <20180511101020.10295-1-anisse@astier.eu>
References: <20180511101020.10295-1-anisse@astier.eu>
Message-ID: <20180511101020.10295-3-anisse@astier.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 package/go/go.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 37bb9801c2..bc5aca2bb7 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -76,10 +76,13 @@ HOST_GO_TARGET_CC = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)"
 
+ifneq ($(V),)
+VERBOSE=-v
+endif
 
 define HOST_GO_BUILD_CMDS
 	cd $(@D)/src && \
-		$(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) CGO_ENABLED=$(HOST_GO_CGO_ENABLED) ./make.bash
+		$(HOST_GO_MAKE_ENV) $(HOST_GO_TARGET_CC) CGO_ENABLED=$(HOST_GO_CGO_ENABLED) ./make.bash $(VERBOSE)
 endef
 
 define HOST_GO_INSTALL_CMDS
-- 
2.13.6
