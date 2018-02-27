From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:17 -0600
Subject: [Buildroot] [NEXT 02/26] cpe-info: update manual for new pkg vars
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-3-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Provide guidance on setting up the <pkgname>_CPE_ID
and <pkgname>_CVE_PATCHED variables.
---
 docs/manual/adding-packages-generic.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 63ea51b..635c5d2 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -453,6 +453,21 @@ information is (assuming the package name is +libfoo+) :
   FLAT binary format is only 4k bytes. If the application consumes more stack,
   append the required number here.
 
+* +LIBFOO_CPE_ID+ is a space-separated list of the package's Common Product
+  Enumeration (CPE) identification string(s).
+  +make cpe-info+ copies all of these into a +cpe-manifest.csv+ file.
+  This variable is optional. If it is not defined, +unknown+ will appear in
+  the +CPI ID+ field of the manifest file for this package.
+  To identify a package's possible CPE(s), the National Vunerability
+  Database can be searched at https://nvd.nist.gov/products/cpe/search.
+
+* +LIBFOO_CVE_PATCHED+ is a space-separated list of the package's Common
+  Vunerability Enumeration (CVE) identification strings.  This list
+  represents patches applied to the package beyond the current version,
+  which may fix CVEs.  It's used as part of the +make cpe-info+ reporting.
+  This variable is optional. If it is not defined, the +CVE PATCHED+ field
+  will appear empty in the manifest file for this package.
+
 The recommended way to define these variables is to use the following
 syntax:
 
-- 
1.9.1
