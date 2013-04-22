From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 22 Apr 2013 13:37:26 +0200
Subject: [Buildroot] [PATCH 2/7] arc: Add option for ARC-specific download
	site
In-Reply-To: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1366630651-6857-3-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As ARC support is not yet in all upstream packages, a different location is
required to download the packages from. This adds an option to specify a
site for ARC-specific versions of packages such as binutils, gcc.

When ARC support has been upstreamed for all packages, this option can be
removed again.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 Config.in |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index bbb9885..c365b38 100644
--- a/Config.in
+++ b/Config.in
@@ -141,6 +141,15 @@ config BR2_PRIMARY_SITE
 	  NOTE: This works for all packages using the central package
 	  infrastructure (generic, autotools, cmake, ...)
 
+config BR2_ARC_SITE
+	string "Download site for ARC specific packages"
+	default "http://www.synopsys.com/apps/arc-developer/"
+	depends on BR2_arc || BR2_arceb
+	help
+	  This download site is used for packages that require specific
+	  support for ARC, while this support is not yet pushed to the
+	  respective open source project.
+
 config BR2_PRIMARY_SITE_ONLY
 	bool "Only allow downloads from primary download site"
 	depends on BR2_PRIMARY_SITE != ""
-- 
1.7.0.4
