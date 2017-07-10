From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Jul 2017 12:19:43 +0200
Subject: [Buildroot] [PATCH-2017.02.x] xen: security bump to version 4.7.3
Message-ID: <20170710101943.17028-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 4.7.3 release brings a number of bugfixes and improvements:

https://www.xenproject.org/downloads/xen-archives/xen-project-47-series/xen-473.html

Including fixes for the following security issues:

XSA-211: Cirrus VGA Heap overflow via display refresh (CVE-2016-9603)
XSA-212: x86: broken check in memory_exchange() permits PV guest breakout
         (CVE-2017-7228)
XSA-213: x86: 64bit PV guest breakout via pagetable use-after-mode-change
         (CVE-2017-8903)
XSA-214: grant transfer allows PV guest to elevate privileges (CVE-2017-8904)
XSA-215: possible memory corruption via failsafe callback (CVE-2017-8905)
XSA-216: blkif responses leak backend stack data (CVE-2017-10911)
XSA-217: page transfer may allow PV guest to elevate privilege
         (CVE-2017-10912)
XSA-218: Races in the grant table unmap code (CVE-2017-10913 CVE-2017-10914)
XSA-219: x86: insufficient reference counts during shadow emulation
         (CVE-2017-10915)
XSA-220: x86: PKRU and BND* leakage between vCPU-s (CVE-2017-10916)
XSA-221: NULL pointer deref in event channel poll (CVE-2017-10917)
XSA-222: stale P2M mappings due to insufficient error checking
         (CVE-2017-10918)
XSA-223: ARM guest disabling interrupt may crash Xen (CVE-2017-10919)
XSA-224: grant table operations mishandle reference counts
         (CVE-2017-10920 CVE-2017-10921 CVE-2017-10922)
XSA-225: arm: vgic: Out-of-bound access when sending SGIs (CVE-2017-10923)

Also change download location as bits.xensource.com seems to be down.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 2 +-
 package/xen/xen.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 2143f4661d..0b14e2966c 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 61494a56d9251e2108080f95b0dc8e3d175f1ba4da34603fc07b91cfebf358d5 xen-4.7.2.tar.gz
+sha256 5b5385b476e59e4cf31ecc6dd605df38814b83432b8e8d917f18c8edfdfb708f xen-4.7.3.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 9ff1b40225..a973b408da 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.7.2
-XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
+XEN_VERSION = 4.7.3
+XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPLv2
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-python
-- 
2.11.0
