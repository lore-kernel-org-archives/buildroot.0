From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:15 +0200
Subject: [Buildroot] [PATCH 41/53] libcap: use $(HOST_DIR) as prefix instead
	of DESTDIR
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-42-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and also remove the /usr prefix.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libcap/libcap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 35a6a97134..48c2cb3456 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -63,8 +63,8 @@ define HOST_LIBCAP_BUILD_CMDS
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
-		RAISE_SETFCAP=no prefix=/usr lib=lib install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) \
+		RAISE_SETFCAP=no lib=lib install
 endef
 
 $(eval $(generic-package))
-- 
2.11.0
