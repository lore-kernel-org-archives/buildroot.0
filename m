From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Sep 2020 18:30:05 +0200
Subject: [Buildroot] [git commit] support/gnuconfig: fix previous version
 bump
Message-ID: <20200927162257.A6885818D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80513c6bac368aa8d2416a65a117587e6c1c01ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a2830f0dad7a (support/gnuconfig: bump version) carried
spurious, uncommited local changes to config.sub, that were not
part of upstream commit d7a4dee7cc25e332b990d0a6d9f0ddd42cb33cf5.

Fix that by actually using the code as it is upstream.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - squash the revert and the new bump into this commit
  - ammend commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/gnuconfig/config.sub | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 2df66beeb0..9bc49a7e92 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -1733,7 +1733,7 @@ esac
 # As a final step for OS-related things, validate the OS-kernel combination
 # (given a valid OS), if there is a kernel.
 case $kernel-$os in
-	linux-gnu* | linux-dietlibc* | linux-android* | linux-newlib* | linux-musl* | linux-uclibc* | uclinux-gnu* |??uclinux-uclibc* )
+	linux-gnu* | linux-dietlibc* | linux-android* | linux-newlib* | linux-musl* | linux-uclibc* )
 		;;
 	uclinux-uclibc* )
 		;;
