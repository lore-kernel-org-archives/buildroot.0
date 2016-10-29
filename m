From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:52:34 +0200
Subject: [Buildroot] [git commit] lzip: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161029135923.5209D800FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=678a54e11c2194d1a036cb1c55f25e2b2faa4a94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
