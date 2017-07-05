From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:42 +0200
Subject: [Buildroot] [PATCH v4 25/36] lzip: use $(HOST_DIR) as prefix
	instead of DESTDIR
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-26-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and remove the /usr prefix

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lzip/lzip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 04c83f1133..cb8803737e 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -15,7 +15,7 @@ define LZIP_CONFIGURE_CMDS
 endef
 
 define HOST_LZIP_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_MAKE_ENV) ./configure --prefix=/usr \
+	(cd $(@D); $(HOST_MAKE_ENV) ./configure --prefix=$(HOST_DIR) \
 		$(HOST_CONFIGURE_OPTS) )
 endef
 
@@ -32,7 +32,7 @@ define LZIP_INSTALL_TARGET_CMDS
 endef
 
 define HOST_LZIP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
 # It's not autotools-based
-- 
2.13.2
