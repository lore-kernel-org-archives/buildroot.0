From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Aug 2013 21:34:00 -0000
Subject: [Buildroot] [git commit] dependencies: build without ccache
Message-ID: <20130831213336.DF7569B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ba1014009b4b2b2db298e8a5615c8d8e92ef641
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch forces the plain host compiler to be used during the building of
dependencies, without ccache as it is not yet built.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index a2d229c..934da40 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -25,6 +25,8 @@ core-dependencies:
 		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
 		$(TOPDIR)/support/dependencies/dependencies.sh
 
+dependencies: HOSTCC=$(HOSTCC_NOCCACHE)
+dependencies: HOSTCXX=$(HOSTCXX_NOCCACHE)
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
 
 dependencies-source:
