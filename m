From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 12 May 2014 16:44:13 +0200
Subject: [Buildroot] [PATCH 5 of 7 v2] toolchain-external: change version
 from 'undefined' to 'virtual'
In-Reply-To: <patchbomb.1399905848@argentina>
References: <patchbomb.1399905848@argentina>
Message-ID: <edfef86e565d4540f1a1.1399905853@argentina>
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
v2: no changes

 toolchain/toolchain-external/toolchain-external.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -410,6 +410,8 @@ TOOLCHAIN_EXTERNAL_SITE =
 TOOLCHAIN_EXTERNAL_SOURCE =
 endif
 
+TOOLCHAIN_EXTERNAL_VERSION = virtual
+
 TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
