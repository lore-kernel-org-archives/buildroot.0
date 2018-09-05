From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  6 Sep 2018 00:00:07 +0200
Subject: [Buildroot] [PATCH v4 2/3] docs/manual: adding infos about tainting
In-Reply-To: <1536184808-9085-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1536184808-9085-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1536184808-9085-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo@amarulasolutions.com>

Adding documentation about the usage of LIBFOO_TAINTS and
"make check-tainted".

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/manual/adding-packages-generic.txt |  6 ++++++
 docs/manual/legal-notice.txt            | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 7be1754..6495157 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -445,6 +445,12 @@ not and can not work as people would expect it should:
   to let you know, and +not saved+ will appear in the +license files+ field
   of the manifest file for this package.
 
+* +LIBFOO_TAINTS+ shoud be set to YES if a package taints a Buildroot
+  configuration. A Buildroot configuration is tainted when a packages uses
+  external dependencies for which Buildroot cannot clearly recover licensing
+  informations. If a configuration is tainted, it means that the licensing
+  information produced by +make legal-info+ could not be accurate.
+
 * +LIBFOO_ACTUAL_SOURCE_TARBALL+ only applies to packages whose
   +LIBFOO_SITE+ / +LIBTOO_SOURCE+ pair points to an archive that does
   not actually contain source code, but binary code. This a very
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 6975328..7fde09a 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -73,6 +73,18 @@ distribution is required).
 When you run +make legal-info+, Buildroot produces warnings in the +README+
 file to inform you of relevant material that could not be saved.
 
+Furthermore, a Buildroot configuration could be tainted from a package that uses
+some custom external dependencies from the Buildroot tree. An example could be
+a package manager for a software stack that downloads the required dependencies
+during the building of a package. In such cases, Buildroot cannot check the
+licensing of the downloaded software and thus giving accurate licensing
+informations.
+To check if your configuration is tainted, run:
+
+--------------------
+make check-tainted
+--------------------
+
 Finally, keep in mind that the output of +make legal-info+ is based on
 declarative statements in each of the packages recipes. The Buildroot
 developers try to do their best to keep those declarative statements as
-- 
2.7.4
