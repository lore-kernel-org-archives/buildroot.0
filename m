From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:45 +0200
Subject: [Buildroot] [PATCH 31/35] pkg-download: fix indentation for
	SOURCE_CHECK_* macros
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-32-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some of the SOURCE_CHECK_* macros are using a non-standard two-spaces
indentation. This commit switches them to use a single tab based
indentation, like in the rest of Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0bc98b1..e4fff5f 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -88,7 +88,7 @@ endef
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
 # repository
 define SOURCE_CHECK_GIT
-  $(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
+	$(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
 endef
 
 define DOWNLOAD_BZR
@@ -135,7 +135,7 @@ define DOWNLOAD_SVN
 endef
 
 define SOURCE_CHECK_SVN
-  $(SVN) ls $($(PKG)_SITE)@$($(PKG)_DL_VERSION) > /dev/null
+	$(SVN) ls $($(PKG)_SITE)@$($(PKG)_DL_VERSION) > /dev/null
 endef
 
 # SCP URIs should be of the form scp://[user@]host:filepath
@@ -168,7 +168,7 @@ endef
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
 # repository
 define SOURCE_CHECK_HG
-  $(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
+	$(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
 endef
 
 define DOWNLOAD_WGET
@@ -181,7 +181,7 @@ define DOWNLOAD_WGET
 endef
 
 define SOURCE_CHECK_WGET
-  $(WGET) --spider '$(call qstrip,$(1))'
+	$(WGET) --spider '$(call qstrip,$(1))'
 endef
 
 define DOWNLOAD_LOCALFILES
@@ -194,7 +194,7 @@ define DOWNLOAD_LOCALFILES
 endef
 
 define SOURCE_CHECK_LOCALFILES
-  test -e $(call stripurischeme,$(call qstrip,$(1)))
+	test -e $(call stripurischeme,$(call qstrip,$(1)))
 endef
 
 ################################################################################
-- 
2.1.0
