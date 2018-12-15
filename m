From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 22:00:31 +0100
Subject: [Buildroot] [PATCH] package/xen: security bump to version 4.11.1
Message-ID: <20181215210032.436-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 4.11.1 release brings a large number of fixes:

https://xenproject.org/downloads/xen-archives/xen-project-411-series/xen-4111.html

Including a number of security fixes:

XSA-268: Use of v2 grant tables may cause crash on ARM (CVE-2018-15469)
XSA-269: x86: Incorrect MSR_DEBUGCTL handling lets guests enable BTS
	 (CVE-2018-15468)
XSA-272: oxenstored does not apply quota-maxentity (CVE-2018-15470)
XSA-273: L1 Terminal Fault speculative side channel (CVE-2018-3620,
         CVE-2018-3646)
XSA-275: insufficient TLB flushing / improper large page mappings with AMD
         IOMMUs
XSA-276: resource accounting issues in x86 IOREQ server handling
XSA-277: x86: incorrect error handling for guest p2m page removals
XSA-278: x86: Nested VT-x usable even when disabled (CVE-2018-18883)
XSA-279: x86: DoS from attempting to use INVPCID with a non-canonical
         addresses
XSA-280: Fix for XSA-240 conflicts with shadow paging
XSA-282: guest use of HLE constructs may lock up host

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 2 +-
 package/xen/xen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 376013eb7a..7a52410954 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 826e3a9f6d0eac94a825d272cc2c1294e22640ae75af906eb13920f9ad667643 xen-4.11.0.tar.gz
+sha256 be88cb2443761990efc1070d9718016561fe19066af232f9bfae572922897e59 xen-4.11.1.tar.gz
 sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 8d7b92eadc..d6e6c91cfb 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.11.0
+XEN_VERSION = 4.11.1
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
-- 
2.11.0
