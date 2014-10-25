From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 02:46:50 +0200
Subject: [Buildroot] [git commit] package/nginx: fix build failure
Message-ID: <20141025004725.92D52B0E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6476f9adcd50adbe5d262ed37b1dca5081430bff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Correctly set NGX_SYS_NERR, even when it is 0.

Fixes:
  http://autobuild.buildroot.org/results/666/666d780bf61e10c9f89f765bb04ddc1afc11d0d1/
  http://autobuild.buildroot.org/?reason=nginx-1.6.2&&arch=powerpc

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nix-make-sys_nerr-guessing-cross-friendly.patch |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch b/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
index 4c00755..d02de68 100644
--- a/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
+++ b/package/nginx/nginx-0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
@@ -22,7 +22,7 @@ new file mode 100644
 index 0000000..25e7c22
 --- /dev/null
 +++ b/auto/os/sys_nerr
-@@ -0,0 +1,77 @@
+@@ -0,0 +1,78 @@
 +
 +# Copyright (C) Samuel Martin <s.martin49@gmail.com>
 +
@@ -89,6 +89,7 @@ index 0000000..25e7c22
 +
 +if test -z $ngx_sys_nerr ; then
 +    ngx_size=0
++    ngx_sys_nerr=0
 +fi
 +
 +cat << END >> $NGX_AUTO_CONFIG_H
