From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 23:49:40 +0200
Subject: [Buildroot] [git commit] package/xen: add dependency on host-acpica
Message-ID: <20170529214947.1D1E18285C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92c1b8132dd298dbbd35bfff8cc07f326924d92d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a dependency on the host ACPICA package as Xen tools
require iasl to build.

Fixes:

  http://autobuild.buildroot.net/results/afa199864d6b546fe759bb582a9c10702ea7fa78/

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Erico Nunes <nunes.erico@gmail.com>
[Thomas: tweak commit log, add autobuilder reference.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xen/xen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 89c09f8..821ab21 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -8,7 +8,7 @@ XEN_VERSION = 4.8.1
 XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
-XEN_DEPENDENCIES = host-python
+XEN_DEPENDENCIES = host-acpica host-python
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
