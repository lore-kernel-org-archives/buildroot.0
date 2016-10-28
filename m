From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Fri, 28 Oct 2016 10:18:20 -0300
Subject: [Buildroot] [PATCH 02/11] lzip: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1477660709-5935-2-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/lzip/lzip.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index c6f0543..ecf70a3 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -15,7 +15,7 @@ define LZIP_CONFIGURE_CMDS
 endef
 
 define HOST_LZIP_CONFIGURE_CMDS
-	(cd $(@D); ./configure --prefix=/usr \
+	(cd $(@D); $(HOST_MAKE_ENV) ./configure --prefix=/usr \
 		$(HOST_CONFIGURE_OPTS) )
 endef
 
@@ -24,7 +24,7 @@ define LZIP_BUILD_CMDS
 endef
 
 define HOST_LZIP_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define LZIP_INSTALL_TARGET_CMDS
@@ -32,7 +32,7 @@ define LZIP_INSTALL_TARGET_CMDS
 endef
 
 define HOST_LZIP_INSTALL_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
 endef
 
 # It's not autotools-based
-- 
2.7.3
