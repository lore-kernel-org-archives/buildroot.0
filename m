From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 23 Feb 2015 10:37:26 +0100
Subject: [Buildroot] [PATCH next 1/2] libsigsegv: fix patch failure of
	0004-Add-stack...
Message-ID: <1424684247-3644-1-git-send-email-user@ld2077>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Porcedda <fabio.porcedda@gmail.com>

After removing the patch 0001-Add-stack... in commit
9863553fe8fa16a4d19f652b409a44bb58ef5567 "packages: all salute the
passing of avr32" the patch 004-Add-stack... does not apply anymore, so
fix it.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 .../0004-Add-stack-direction-for-the-Blackfin-architecture.patch        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch b/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
index e5f3c49..5d8232a 100644
--- a/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
+++ b/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
@@ -19,7 +19,7 @@ index 53f4216..1a97d5a 100644
 @@ -18,6 +18,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
        arc | \
        arm* | strongarm* | xscale* | \
-       avr | avr32 | \
+       avr | \
 +      bfin | \
        c1 | c2 | c32 | c34 | c38 | \
        clipper | \
-- 
2.3.0
