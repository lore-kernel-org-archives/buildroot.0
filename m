From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 05:07:22 -0500
Subject: [Buildroot] [PATCH v2 8/8] package/flannel: remove 'v' prefix
In-Reply-To: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
References: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191027100722.64156-8-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes version parsing for release-monitoring.org support.

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Change
v1->v2
[Arnout
 - dropped 'v' from LDFLAGS use of verion in a -X line
---
 package/flannel/flannel.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index d00d2df92c..0af06c7656 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FLANNEL_VERSION = v0.5.5
+FLANNEL_VERSION = 0.5.5
 FLANNEL_SITE = https://github.com/coreos/flannel/archive
-FLANNEL_SOURCE = $(FLANNEL_VERSION).tar.gz
+FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
 
 FLANNEL_LICENSE = Apache-2.0
 FLANNEL_LICENSE_FILES = LICENSE
-- 
2.17.1
