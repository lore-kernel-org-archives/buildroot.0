From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 21 Jan 2016 12:54:21 +0530
Subject: [Buildroot] [PATCH 1/1] docs/manual: document format specifying
	licenses
Message-ID: <1453361061-13226-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 docs/manual/adding-packages-generic.txt | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 1c25c4e..460bb87 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -382,7 +382,15 @@ information is (assuming the package name is +libfoo+) :
   Otherwise, describe the license in a precise and concise way, avoiding
   ambiguous names such as +BSD+ which actually name a family of licenses.
   This variable is optional. If it is not defined, +unknown+ will appear in
-  the +license+ field of the manifest file for this package.
+  the +license+ field of the manifest file for this package. +
+  Format for specifying licenses is:
+  ** If the package is released under multiple licenses, then +comma+ separate
+  licenses (e.g. +`LIBFOO_LICENSE = GPLv2+, LGPLv2.1+`+). If there is clear
+  distinction between which component is licensed under what license, then
+  annotate the license with +libraries+ or +programs+ or +others+ keyword
+  (e.g. +`LIBFOO_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)`+).
+  ** If the package is dual licensed, then separate licenses with +or+ keyword
+  (e.g. +`LIBFOO_LICENSE = AFLv2.1 or GPLv2+`+).
 
 * +LIBFOO_LICENSE_FILES+ is a space-separated list of files in the package
   tarball that contain the license(s) under which the package is released.
-- 
1.9.1
