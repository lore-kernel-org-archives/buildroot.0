From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 20:14:53 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] toolchain: disable gcc
 bug 60620 if gcc version >= 10.x
Message-ID: <20210317191335.787328820D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f204c7ab9e120d4a2e38fd7736d76bd980fd288c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Since gcc version 10.x bug 60620 doesn't show anymore, so let's make it
enabled up to versino 10.x excluded.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d8e6179807bdfc89608a037e31c0dcc43382bcb0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index fdc0f9ba59..2a7b7ea554 100644
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
