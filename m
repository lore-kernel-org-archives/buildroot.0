From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 24 May 2017 17:32:39 +0200
Subject: [Buildroot] [PATCH/next v2] package/bootstrap: bump version to 3.3.7
Message-ID: <20170524153239.8485-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extended _EXTRACT_CMDS to handle updated internal zip structure:

$ unzip -l ../dl/bootstrap-3.3.1-dist.zip
Archive:  ../dl/bootstrap-3.3.1-dist.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2014-11-12 18:03   dist/
        0  2014-11-12 18:03   dist/css/
[...]

$ unzip -l ../dl/bootstrap-3.3.7-dist.zip
Archive:  ../dl/bootstrap-3.3.7-dist.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2016-07-25 15:53   bootstrap-3.3.7-dist/css/
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: changed _EXTRACT_CMDS instead of _INSTALL_TARGET_CMDS
    to handle updated internal zip structure (Thomas)

 package/bootstrap/bootstrap.hash | 2 +-
 package/bootstrap/bootstrap.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
index acb06b424..abc09da21 100644
--- a/package/bootstrap/bootstrap.hash
+++ b/package/bootstrap/bootstrap.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  95ca4a02aff37570660c81a87065b53ebc281c33fa86b91a6a7a650eee10678f  bootstrap-3.3.1-dist.zip
+sha256 f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b  bootstrap-3.3.7-dist.zip
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 17752ce06..520cfeb2e 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-BOOTSTRAP_VERSION = 3.3.1
+BOOTSTRAP_VERSION = 3.3.7
 BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
 BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
 BOOTSTRAP_LICENSE = MIT
 
 define BOOTSTRAP_EXTRACT_CMDS
 	$(UNZIP) $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
+	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist $(@D)/dist
 endef
 
 define BOOTSTRAP_INSTALL_TARGET_CMDS
-- 
2.11.0
