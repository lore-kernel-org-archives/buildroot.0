From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jan 2015 22:41:50 +0100
Subject: [Buildroot] [RFC 5/8] ccache: add custom help entries
In-Reply-To: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1422394913-13257-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-ccache package has some custom targets to get statistics
about ccache or change ccache options. This commit adds a
HOST_CCACHE_HELP_HOOKS to ensure such targets are documented in 'make
host-ccache-help'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ccache/ccache.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 270ea4b..5f86125 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -58,6 +58,13 @@ endef
 HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAL_SETUP
 endif
 
+define HOST_CCACHE_PACKAGE_HELP
+	@$(call pkg-print-help-opt,ccache-stats,"Show ccache statistics")
+	@$(call pkg-print-help-opt,cache-options,"Update ccache options using CCACHE_OPTIONS variable")
+endef
+
+HOST_CCACHE_HELP_HOOKS += HOST_CCACHE_PACKAGE_HELP
+
 $(eval $(host-autotools-package))
 
 ifeq ($(BR2_CCACHE),y)
-- 
2.1.0
