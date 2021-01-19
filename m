From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 19 Jan 2021 16:46:05 +0100
Subject: [Buildroot] [PATCH 2/2] package/chartjs: security bump to 2.9.4
In-Reply-To: <20210119154607.11101-1-patrickdepinguin@gmail.com>
References: <20210119154607.11101-1-patrickdepinguin@gmail.com>
Message-ID: <20210119154607.11101-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

CVE-2020-7746 (https://nvd.nist.gov/vuln/detail/CVE-2020-7746)

    The options parameter is not properly sanitized when it is processed.
    When the options are processed, the existing options (or the defaults
    options) are deeply merged with provided options. However, during this
    operation, the keys of the object being set are not checked, leading to
    a prototype pollution.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/chartjs/chartjs.hash | 2 +-
 package/chartjs/chartjs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
index a029d16ab1..de4d6d4ebf 100644
--- a/package/chartjs/chartjs.hash
+++ b/package/chartjs/chartjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	8079d8fd39131fcfaec33f1c7799412bcf8e051e25b10bd6e37fc16159417aa1  chartjs-2.9.3.tar.gz
+sha256	9ef3697e279a585c79730f35dba16ad4e24ddeed49a150adb341c31f191fb78e  chartjs-2.9.4.tar.gz
 sha256	7b43caae91f31b18dc81fae6e0f7aa1acbecaa6d84e3249905cbe15308307d67  LICENSE.md
diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
index 960b3e24af..82c86dc6cc 100644
--- a/package/chartjs/chartjs.mk
+++ b/package/chartjs/chartjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHARTJS_VERSION = 2.9.3
+CHARTJS_VERSION = 2.9.4
 CHARTJS_SITE = $(call github,chartjs,Chart.js,v$(CHARTJS_VERSION))
 CHARTJS_LICENSE = MIT
 CHARTJS_LICENSE_FILES = LICENSE.md
-- 
2.26.2
