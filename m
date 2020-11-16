From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 22:24:00 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/xorriso: fix host
 option
Message-ID: <20201116211239.7225881560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdd953d1805a2cfb2b53f9183bfa46c729cc77a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

--disable-bzip2 is not a recognized option so replace it by
--disable-libbz2 to match the target logic.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 41236c61b186028dcfef3d71c34cf31ca889b090)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xorriso/xorriso.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 56bf39f764..472623ea5e 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -14,7 +14,7 @@ XORRISO_LICENSE_FILES = COPYING COPYRIGHT
 HOST_XORRISO_CONF_OPTS = \
 	--disable-xattr-h-pref-attr \
 	--disable-zlib \
-	--disable-bzip2 \
+	--disable-libbz2 \
 	--disable-libcdio \
 	--disable-libreadline \
 	--disable-libedit \
