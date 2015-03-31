From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:36:55 +0200
Subject: [Buildroot] [git commit] ccache: fix the indentation
Message-ID: <20150331213701.597B681E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3b44101d396d2794a35f11298fec5e288ec8893
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "packages: indentation cleanup" broke the build of master.
This commit reverse the patch on just ccache package and fix that issue.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ccache/ccache.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index ac2eaab..893b6ae 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -66,10 +66,10 @@ ccache-stats: host-ccache
 
 ccache-options: host-ccache
 ifeq ($(CCACHE_OPTIONS),)
-$(Q)echo "Usage: make ccache-options CCACHE_OPTIONS=\"opts\""
-$(Q)echo "where 'opts' corresponds to one or more valid ccache options" \
-"(see ccache help text below)"
-$(Q)echo
+	$(Q)echo "Usage: make ccache-options CCACHE_OPTIONS=\"opts\""
+	$(Q)echo "where 'opts' corresponds to one or more valid ccache options" \
+	"(see ccache help text below)"
+	$(Q)echo
 endif
-$(Q)$(CCACHE) $(CCACHE_OPTIONS)
+	$(Q)$(CCACHE) $(CCACHE_OPTIONS)
 endif
