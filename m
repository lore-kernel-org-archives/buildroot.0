From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 21:49:09 +0200
Subject: [Buildroot] [git commit] udftool: add missing dependency on readline
Message-ID: <20180506195333.60ADF8B84C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eef425146223f220587c32ad880463b1c749660c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udftool/Config.in selects BR2_PACKAGE_READLINE, but udftool does not
depend on it. Readline is not a runtime dependency: one of the udftool
program links against it.

This commit fixes this inconsistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
