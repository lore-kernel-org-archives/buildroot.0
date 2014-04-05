From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:21:15 +0200
Subject: [Buildroot] [git commit] virtual-package: fake a version string for
	virtual packages
Message-ID: <20140405172339.528EE9C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=455a354c960f686c2ae9654ae0112fdc31bec686
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-virtual.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 9b206ea..617e5f2 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -44,6 +44,10 @@ endif
 # A virtual package does not have any source associated
 $(2)_SOURCE =
 
+# Fake a version string, so it looks nicer in the build log
+$(3)_VERSION = virtual
+HOST_$(3)_VERSION = virtual
+
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES
 $(2)_DEPENDENCIES ?= $(filter-out host-toolchain $(1),\
