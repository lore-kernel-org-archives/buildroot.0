From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 16:33:26 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/chartjs: move 'v'
 version prefix out of CHARTJS_VERSION
Message-ID: <20210204152021.BD05581E06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=810926dffef7a54be08ddbc64cf2666e42542fe3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

chartjs 2.9.3 has a security vulnerability (CVE-2020-7746) which is not
detected by the CVE scripts, presumably because our version variable starts
with a 'v'.

Move that 'v' prefix out of the version variable to fix that.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0244b11597461919d4240f9ee93dcb61a27e47d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chartjs/chartjs.hash | 2 +-
 package/chartjs/chartjs.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
index d2426ea614..a029d16ab1 100644
--- a/package/chartjs/chartjs.hash
+++ b/package/chartjs/chartjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	8079d8fd39131fcfaec33f1c7799412bcf8e051e25b10bd6e37fc16159417aa1  chartjs-v2.9.3.tar.gz
+sha256	8079d8fd39131fcfaec33f1c7799412bcf8e051e25b10bd6e37fc16159417aa1  chartjs-2.9.3.tar.gz
 sha256	7b43caae91f31b18dc81fae6e0f7aa1acbecaa6d84e3249905cbe15308307d67  LICENSE.md
diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
index 171e0a4a7c..960b3e24af 100644
--- a/package/chartjs/chartjs.mk
+++ b/package/chartjs/chartjs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHARTJS_VERSION = v2.9.3
-CHARTJS_SITE = $(call github,chartjs,Chart.js,$(CHARTJS_VERSION))
+CHARTJS_VERSION = 2.9.3
+CHARTJS_SITE = $(call github,chartjs,Chart.js,v$(CHARTJS_VERSION))
 CHARTJS_LICENSE = MIT
 CHARTJS_LICENSE_FILES = LICENSE.md
 
