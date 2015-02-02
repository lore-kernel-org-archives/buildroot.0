From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:31:08 +0100
Subject: [Buildroot] [git commit] bootstrap: use the UNZIP variable instead
	of calling it directly
Message-ID: <20150202203117.E25A380796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb3eca8a728af981405135d3245717e553186141
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bootstrap/bootstrap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 1a1c4f1..17752ce 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -10,7 +10,7 @@ BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
 BOOTSTRAP_LICENSE = MIT
 
 define BOOTSTRAP_EXTRACT_CMDS
-	unzip $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
+	$(UNZIP) $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
 endef
 
 define BOOTSTRAP_INSTALL_TARGET_CMDS
