From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 25 Jan 2016 10:35:40 +0530
Subject: [Buildroot] [PATCH v2 1/1] docs/manual: document format for
	specifying licenses
Message-ID: <1453698340-13777-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
Changes v1 -> v2:
  - tweak commit message (added missing 'for')
  - use full sentences (suggested by Thomas Petazzoni)
  - don't standardize components (suggested by Thomas Petazzoni)
  - add missing 'the' before +or+ keyword (suggested by Thomas Petazzoni)
---
 docs/manual/adding-packages-generic.txt | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 1f9c7bb..47cd95b 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -387,7 +387,15 @@ information is (assuming the package name is +libfoo+) :
   Otherwise, describe the license in a precise and concise way, avoiding
   ambiguous names such as +BSD+ which actually name a family of licenses.
   This variable is optional. If it is not defined, +unknown+ will appear in
-  the +license+ field of the manifest file for this package.
+  the +license+ field of the manifest file for this package. +
+  The expected format for this variable must comply with the following rules:
+  ** If the package is released under multiple licenses, then +comma+ separate
+  licenses (e.g. +`LIBFOO_LICENSE = GPLv2+, LGPLv2.1+`+). If there is clear
+  distinction between which component is licensed under what license, then
+  annotate the license with that component
+  (e.g. +`LIBFOO_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)`+).
+  ** If the package is dual licensed, then separate licenses with the +or+
+  keyword (e.g. +`LIBFOO_LICENSE = AFLv2.1 or GPLv2+`+).
 
 * +LIBFOO_LICENSE_FILES+ is a space-separated list of files in the package
   tarball that contain the license(s) under which the package is released.
-- 
1.9.1
