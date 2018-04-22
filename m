From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 23:20:03 +0200
Subject: [Buildroot] [PATCH 1/3] udftool: add missing dependency on readline
In-Reply-To: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
References: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180422212005.13062-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udftool/Config.in selects BR2_PACKAGE_READLINE, but udftool does not
depend on it. Readline is not a runtime dependency: one of the udftool
program links against it.

This commit fixes this inconsistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/udftools/udftools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udftools/udftools.mk b/package/udftools/udftools.mk
index 708fef9ab7..2d3477a51c 100644
--- a/package/udftools/udftools.mk
+++ b/package/udftools/udftools.mk
@@ -8,5 +8,6 @@ UDFTOOLS_VERSION = 2.0
 UDFTOOLS_SITE = https://github.com/pali/udftools/releases/download/$(UDFTOOLS_VERSION)
 UDFTOOLS_LICENSE = GPL-2.0+
 UDFTOOLS_LICENSE_FILES = COPYING
+UDFTOOLS_DEPENDENCIES = readline
 
 $(eval $(autotools-package))
-- 
2.14.3
