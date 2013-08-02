From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 02 Aug 2013 09:33:53 +0200
Subject: [Buildroot] [PATCH 1 of 4] dependencies: build without ccache
In-Reply-To: <patchbomb.1375428832@BEANTN0L019720>
References: <patchbomb.1375428832@BEANTN0L019720>
Message-ID: <a88854640580cd1738ee.1375428833@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch forces the plain host compiler to be used during the building of
dependencies, without ccache as it is not yet built.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 support/dependencies/dependencies.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -25,6 +25,8 @@ core-dependencies:
 		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
 		$(TOPDIR)/support/dependencies/dependencies.sh
 
+dependencies: HOSTCC=$(HOSTCC_NOCCACHE)
+dependencies: HOSTCXX=$(HOSTCXX_NOCCACHE)
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
 
 dependencies-source:
