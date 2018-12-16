From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 15:53:57 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libiscsi: do not
 built the manpages
Message-ID: <20181216144953.713358D5AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46433b998a419566125b57e709ee0afa776ac585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The pre-rendered, bundled ones are still installed, though, but they
get removed in target-finalize anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b5c84a2a82407f7728d53ac79f0fde59f677fc3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiscsi/libiscsi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index c492865c51..a34069d7bf 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -11,7 +11,7 @@ LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 LIBISCSI_AUTORECONF = YES
 
-LIBISCSI_CONF_OPTS = --disable-werror
+LIBISCSI_CONF_OPTS = --disable-werror --disable-manpages
 
 # We need to create the m4 directory to make autoreconf work properly.
 define LIBISCSI_CREATE_M4_DIR
