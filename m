From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 21:22:52 +0100
Subject: [Buildroot] [git commit] package/gobject-introspection: add missing
 newline at end of wrappers
Message-ID: <20200309140904.8BE1B7F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a81bc26c986cbad02fbb6a1dfd8e548da91bc36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/g-ir-compiler.in            | 2 +-
 package/gobject-introspection/g-ir-scanner-lddwrapper.in  | 2 +-
 package/gobject-introspection/g-ir-scanner-qemuwrapper.in | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/g-ir-compiler.in b/package/gobject-introspection/g-ir-compiler.in
index 02d7c15c38..3313cc501f 100644
--- a/package/gobject-introspection/g-ir-compiler.in
+++ b/package/gobject-introspection/g-ir-compiler.in
@@ -1,3 +1,3 @@
 #!/usr/bin/env bash
 
-$(dirname $0)/g-ir-scanner-qemuwrapper $(dirname $0)/g-ir-compiler.real "$@"
\ No newline at end of file
+$(dirname $0)/g-ir-scanner-qemuwrapper $(dirname $0)/g-ir-compiler.real "$@"
diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
index d7639c5c81..c19314566a 100644
--- a/package/gobject-introspection/g-ir-scanner-lddwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
@@ -1,3 +1,3 @@
 #!/usr/bin/env bash
 
-${HOST_DIR}/sbin/prelink-rtld --root=$(dirname $0)/../../ "$@"
\ No newline at end of file
+${HOST_DIR}/sbin/prelink-rtld --root=$(dirname $0)/../../ "$@"
diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
index 6e433eb300..cad7ef875e 100644
--- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
@@ -14,4 +14,4 @@ if [[ $? -ne 0 ]]; then
     echo "If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help."
     echo 'Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"'
     exit 1
-fi
\ No newline at end of file
+fi
