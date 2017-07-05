From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:41 +0200
Subject: [Buildroot] [git commit] lzip: use $(HOST_DIR) as prefix instead of
	DESTDIR
Message-ID: <20170705141337.006BE81D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39bc3614d60e364830fb8ea15c7fab9534959a2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... and remove the /usr prefix

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzip/lzip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 04c83f1..cb88037 100644
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
