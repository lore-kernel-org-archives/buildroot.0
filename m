From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:27:34 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/xen: security
 bump to version 4.11.2
Message-ID: <20190820142400.33F978394B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb46d2478411d60114fed34814d9898ddff4169f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The 4.11.2 release brings a large number of fixes:

https://xenproject.org/downloads/xen-project-archives/xen-project-4-11-series/xen-project-4-11-2/

Including a number of security fixes:

XSA-284: grant table transfer issues on large hosts
XSA-285: race with pass-through device hotplug
XSA-287: x86: steal_page violates page_struct access discipline
XSA-288: x86: Inconsistent PV IOMMU discipline
XSA-290: missing preemption in x86 PV page table unvalidation
XSA-291: x86/PV: page type reference counting issue with failed IOMMU update
XSA-292: x86: insufficient TLB flushing when using PCID
XSA-293: x86: PV kernel context switch corruption
XSA-294: x86 shadow: Insufficient TLB flushing when using PCID
XSA-295: Unlimited Arm Atomics Operations
XSA-297: Microarchitectural Data Sampling speculative side channel

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 29055692842b65f88d636e27cb9fa248ad9161c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 2 +-
 package/xen/xen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 7a52410954..d4232f592e 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 be88cb2443761990efc1070d9718016561fe19066af232f9bfae572922897e59 xen-4.11.1.tar.gz
+sha256 3f9217f5a7cc240a06f3a03db8c29605d69a64d98330c426611ba5c2ee08b5d8 xen-4.11.2.tar.gz
 sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index d6e6c91cfb..bd8a39f639 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.11.1
+XEN_VERSION = 4.11.2
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
