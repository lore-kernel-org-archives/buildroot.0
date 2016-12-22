From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 22 Dec 2016 15:02:18 -0500
Subject: [Buildroot] [PATCH 2/2] net-tools: switch to git-http protocol
In-Reply-To: <20161222200218.15052-1-james.knight@rockwellcollins.com>
References: <20161222200218.15052-1-james.knight@rockwellcollins.com>
Message-ID: <20161222200218.15052-2-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move to the http-provided protocol to aid in environments where a
corporate firewall has the Git port restricted.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/net-tools/net-tools.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index dd9be01..745ddde 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 NET_TOOLS_VERSION = ea3935bd7c0f36c86c40e5785326698fa3336c6a
-NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
+NET_TOOLS_SITE = http://git.code.sf.net/p/net-tools/code
+NET_TOOLS_SITE_METHOD = git
 NET_TOOLS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 NET_TOOLS_LICENSE = GPLv2+
 NET_TOOLS_LICENSE_FILES = COPYING
-- 
2.8.4.windows.1
