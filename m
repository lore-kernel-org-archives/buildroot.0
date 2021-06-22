From: Geoff Levand <geoff@infradead.org>
Date: Tue, 22 Jun 2021 06:45:26 -0700
Subject: [Buildroot] [PATCH 1/2] package/flannel: update project URL
In-Reply-To: <cover.1623643496.git.geoff@infradead.org>
References: <cover.1623643496.git.geoff@infradead.org>
Message-ID: <911da07d-394f-f598-fd38-d8c60d587bc1@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update flannel project URL.

  from: github.com/coreos/flannel
  to:   github.com/flannel-io/flannel

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/flannel/Config.in  | 2 +-
 package/flannel/flannel.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flannel/Config.in b/package/flannel/Config.in
index 326361080f..eb8d798f48 100644
--- a/package/flannel/Config.in
+++ b/package/flannel/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_FLANNEL
 	  Flannel is a virtual network that gives a subnet to each
 	  host for use with container runtimes.
 
-	  https://github.com/coreos/flannel
+	  https://github.com/flannel-io/flannel
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 8aa960f086..a8a3c7a3cd 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -5,13 +5,13 @@
 ################################################################################
 
 FLANNEL_VERSION = 0.12.0
-FLANNEL_SITE = https://github.com/coreos/flannel/archive
+FLANNEL_SITE = https://github.com/flannel-io/flannel/archive
 FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
 
 FLANNEL_LICENSE = Apache-2.0
 FLANNEL_LICENSE_FILES = LICENSE
 
-FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
+FLANNEL_LDFLAGS = -X github.com/flannel-io/flannel/version.Version=$(FLANNEL_VERSION)
 
 # Install flannel to its well known location.
 define FLANNEL_INSTALL_TARGET_CMDS
-- 
2.25.1
