From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 21:52:57 +0100
Subject: [Buildroot] [git commit] docs/manual: document format for
	specifying licenses
Message-ID: <20160306205310.43DD78180E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c02a88337baafadcee571e1990939ccec5eb356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
[Thomas: minor tweaks for clarity.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b7817e3..8ed7fe8 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -387,7 +387,16 @@ information is (assuming the package name is +libfoo+) :
   Otherwise, describe the license in a precise and concise way, avoiding
   ambiguous names such as +BSD+ which actually name a family of licenses.
   This variable is optional. If it is not defined, +unknown+ will appear in
-  the +license+ field of the manifest file for this package.
+  the +license+ field of the manifest file for this package. +
+  The expected format for this variable must comply with the following rules:
+  ** If different parts of the package are released under different
+  licenses, then +comma+ separate licenses (e.g. +`LIBFOO_LICENSE =
+  GPLv2+, LGPLv2.1+`+). If there is clear distinction between which
+  component is licensed under what license, then annotate the license
+  with that component, between parenthesis (e.g. +`LIBFOO_LICENSE =
+  GPLv2+ (programs), LGPLv2.1+ (libraries)`+).
+  ** If the package is dual licensed, then separate licenses with the
+  +or+ keyword (e.g. +`LIBFOO_LICENSE = AFLv2.1 or GPLv2+`+).
 
 * +LIBFOO_LICENSE_FILES+ is a space-separated list of files in the package
   tarball that contain the license(s) under which the package is released.
