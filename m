From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 5 Mar 2018 10:09:42 +0100
Subject: [Buildroot] [git commit branch/next] czmq: bump to version v4.1.0
Message-ID: <20180305093821.8A524811C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb4a33e586bc041a43cd415869e91d29287dcefd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[Arnout: correct comment about AUTORECONF]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/czmq/czmq.hash |  6 +++++-
 package/czmq/czmq.mk   | 12 +++---------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
index 526ea594b9..c0a7176f8d 100644
--- a/package/czmq/czmq.hash
+++ b/package/czmq/czmq.hash
@@ -1,2 +1,6 @@
+# From https://github.com/zeromq/czmq/releases
+md5 d29baef1079f19a2c6a360eb6be984f8 czmq-4.1.0.tar.gz
+sha1 1d201a87205811367f7c92cbbd36a899edda68bf czmq-4.1.0.tar.gz
 # Locally calculated
-sha256 5c76de41f736f0c059e0b26174ef99200f2aba2fa38333683dbe4944b2f80555 czmq-5205ec201e97c3a652c17eb86b18b70350b54512.tar.gz
+sha256 3befa35b4886b5298e8329b4f0aa5bb9bde0e7439bd3c5c53295cb988371fc11 czmq-4.1.0.tar.gz
+sha256 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5 LICENCE
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 5305789d7a..aef552415e 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-CZMQ_VERSION = 5205ec201e97c3a652c17eb86b18b70350b54512
-CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
+CZMQ_VERSION = 4.1.0
+CZMQ_SITE = https://github.com/zeromq/czmq/releases/download/v$(CZMQ_VERSION)
 
-# Autoreconf required as we use the git tree
+# 0001-configure.ac-remove-Werror.patch touches configure.ac
 CZMQ_AUTORECONF = YES
 CZMQ_INSTALL_STAGING = YES
 CZMQ_DEPENDENCIES = zeromq host-pkgconf
@@ -18,10 +18,4 @@ CZMQ_LICENSE_FILES = LICENSE
 # host-python, so disable asciidoc entirely.
 CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
 
-define CZMQ_CREATE_CONFIG_DIR
-	mkdir -p $(@D)/config
-endef
-
-CZMQ_POST_PATCH_HOOKS += CZMQ_CREATE_CONFIG_DIR
-
 $(eval $(autotools-package))
