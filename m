From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Mar 2014 19:41:44 +0100
Subject: [Buildroot] [git commit] support: fix typo in mkusers
Message-ID: <20140305184253.4205F9BD70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b083c0ba4be5b9bb750d6ec670384449fe09a121
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the spurious "[: too many arguments" errors from mkusers.

Signed-off-by: Philip Paeps <philip@paeps.cx>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/mkusers |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index a67356a..90d1df7 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -63,7 +63,7 @@ get_uid() {
 get_ugid() {
     local username="${1}"
 
-    awk -F:i -v username="${username}"                          \
+    awk -F: -v username="${username}"                          \
         '$1 == username { printf( "%d\n", $4 ); }' "${PASSWD}"
 }
 
