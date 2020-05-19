From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Tue, 19 May 2020 09:28:45 +0200
Subject: [Buildroot] [PATCH 3/8] Config.in: add
 BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
In-Reply-To: <20200519072850.898877-1-kamel.bouhara@bootlin.com>
References: <20200519072850.898877-1-kamel.bouhara@bootlin.com>
Message-ID: <20200519072850.898877-4-kamel.bouhara@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation to the addition of new dependencies in the odb package,
add the BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT symbol.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 48fd36ff98..e056498bd5 100644
--- a/Config.in
+++ b/Config.in
@@ -80,6 +80,11 @@ config BR2_HOSTARCH_NEEDS_IA32_COMPILER
 config BR2_NEEDS_HOST_UTF8_LOCALE
 	bool
 
+# Hidden boolean selected by packages that need the host for building
+# gcc plugins
+config BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
+	bool
+
 source "arch/Config.in"
 
 menu "Build options"
-- 
2.25.0
