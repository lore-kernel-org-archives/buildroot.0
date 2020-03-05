From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Mar 2020 22:01:51 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/xen: security
 bump to version 4.11.3
Message-ID: <20200305205226.BB6438F4D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00986efc492409c9a1e702318e451016fb3355f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The 4.11.3 release brings a large number of fixes:

https://xenproject.org/downloads/xen-project-archives/xen-project-4-11-series/xen-project-4-11-3/

Including a number of security fixes:

XSA-298: missing descriptor table limit checking in x86 PV emulation
         (CVE-2019-18425)
XSA-299: Issues with restartable PV type change operations (CVE-2019-18421)
XSA-301: add-to-physmap can be abused to DoS Arm hosts (CVE-2019-18423)
XSA-302: passed through PCI devices may corrupt host memory after
         deassignment (CVE-2019-18424)
XSA-303: ARM: Interrupts are unconditionally unmasked in exception handlers
         (CVE-2019-18422)
XSA-304: x86: Machine Check Error on Page Size Change DoS (CVE-2018-12207)
XSA-305: TSX Asynchronous Abort speculative side channel (CVE-2019-11135)
XSA-306: Device quarantine for alternate pci assignment methods
         (CVE-2019-19579)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 2 +-
 package/xen/xen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index d4232f592e..3900317789 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 3f9217f5a7cc240a06f3a03db8c29605d69a64d98330c426611ba5c2ee08b5d8 xen-4.11.2.tar.gz
+sha256 d4d81da4b8390dadf90a177bd32739dd443ad84d09c2f143a0f0d4384d1a2021 xen-4.11.3.tar.gz
 sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 92629a3d86..352c35bf87 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.11.2
+XEN_VERSION = 4.11.3
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
