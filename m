From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 01:56:29 -0500
Subject: [Buildroot] [PATCH] package/flannel: remove 'v' prefix
Message-ID: <20191027065629.16426-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes version parsing for release-monitoring.org support.

Cc: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/flannel/flannel.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index d00d2df92c..e944012358 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = v0.5.5
+FLANNEL_VERSION = 0.5.5
 FLANNEL_SITE = https://github.com/coreos/flannel/archive
-FLANNEL_SOURCE = $(FLANNEL_VERSION).tar.gz
+FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
 
 FLANNEL_LICENSE = Apache-2.0
 FLANNEL_LICENSE_FILES = LICENSE
 
-FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
+FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=v$(FLANNEL_VERSION)
 
 # Install flannel to its well known location.
 define FLANNEL_INSTALL_TARGET_CMDS
-- 
2.17.1
