From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Mar 2021 23:16:46 +0100
Subject: [Buildroot] [git commit branch/next] toolchain: disable gcc bug
 60620 if gcc version >= 10.x
Message-ID: <20210306215355.3803B8150B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8e6179807bdfc89608a037e31c0dcc43382bcb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since gcc version 10.x bug 60620 doesn't show anymore, so let's make it
enabled up to versino 10.x excluded.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ce7e7f6cc4..1940c076a9 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -154,10 +154,11 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_85862
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
 # ICE: in do_output_reload, at reload1.c:7978 on microblaze.
-# It's still not fixed in gcc 9.x
+# This bug no longer exists in gcc 10.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	bool
 	default y if BR2_microblaze
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
 # ICE: compiler error: Segmentation fault on Nios II. This bug
