From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 06 Jun 2014 22:13:01 +0200
Subject: [Buildroot] [PATCH 5 of 7 v3] toolchain-external: change version
 from 'undefined' to 'virtual'
In-Reply-To: <patchbomb.1402085576@localhost>
References: <patchbomb.1402085576@localhost>
Message-ID: <640c5d9c5ac14d442207.1402085581@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The toolchain-external package displays the version 'undefined' in the build
messages and the directory in output/build, which is not very nice.
This patch sets the version to 'virtual', in analogy to the toolchain and
toolchain-buildroot packages (which use the virtual-package infrastructure).

Although toolchain-external is not strictly a virtual package, since it uses
the generic-package infrastructure, it can be considered as a virtual
package in the sense that it does not have a fixed version or source (they
depend on the selected external toolchain).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
v3: no changes
v2: no changes

 toolchain/toolchain-external/toolchain-external.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff -r 58ea2200cf19 -r 640c5d9c5ac1 toolchain/toolchain-external/toolchain-external.mk
--- a/toolchain/toolchain-external/toolchain-external.mk	Tue May 06 09:36:14 2014 +0200
+++ b/toolchain/toolchain-external/toolchain-external.mk	Sun May 11 14:28:02 2014 +0200
@@ -411,6 +411,8 @@
 TOOLCHAIN_EXTERNAL_SOURCE =
 endif
 
+TOOLCHAIN_EXTERNAL_VERSION = virtual
+
 TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
