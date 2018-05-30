From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 May 2018 00:17:13 +0200
Subject: [Buildroot] [PATCH] xen: security bump to version 4.10.1
Message-ID: <20180530221713.20890-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 4.10.1 version brings a large number of fixes:

https://www.xenproject.org/downloads/xen-archives/xen-project-410-series/xen-4101.html

Including a number of security fixes:

XSA-252: DoS via non-preemptable L3/L4 pagetable freeing (CVE-2018-7540)
XSA-253: x86: memory leak with MSR emulation (CVE-2018-5244)
XSA-254: Information leak via side effects of speculative execution
	 (CVE-2017-5753 CVE-2017-5715 CVE-2017-5754)
XSA-255: grant table v2 -> v1 transition may crash Xen (CVE-2018-7541)
XSA-256: x86 PVH guest without LAPIC may DoS the host (CVE-2018-7542)
XSA-258: Information leak via crafted user-supplied CDROM (CVE-2018-10472)
XSA-259: x86: PV guest may crash Xen with XPTI (CVE-2018-10471)

Also add a hash for the license file while we are at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 3 ++-
 package/xen/xen.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index fa4d25bab2..5daebd4d65 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 0262a7023f8b12bcacfb0b25e69b2a63291f944f7683d54d8f33d4b2ca556844 xen-4.10.0.tar.gz
+sha256 570d654f357d4085accdf752989c1cbc33e2075feac8fcc505d68bdb81b1a0cf xen-4.10.1.tar.gz
+sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 1b741a90f6..29699cf0f9 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.10.0
+XEN_VERSION = 4.10.1
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
-- 
2.11.0
