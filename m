From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 22:11:06 +0200
Subject: [Buildroot] [git commit] toolchain: adjust version check to allow
 for single numbers
Message-ID: <20200614201137.9893682A11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5303e72a80e44c265473706a2d4f3acb5010814f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A gcc compiler, which was configured with
--with-gcc-major-version-only, will only return a single
number. (debian does this for example).

A simple modification allows the check to work with both
single numbers (eg. '9') and full versions (eg. '9.2.1').

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 44d0c83d1e..17bc159f3e 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -184,7 +184,7 @@ check_gcc_version = \
 		exit 0 ; \
 	fi; \
 	real_version=`$(1) -dumpversion` ; \
-	if [[ ! "$${real_version}" =~ ^$${expected_version}\. ]] ; then \
+	if [[ ! "$${real_version}." =~ ^$${expected_version}\. ]] ; then \
 		printf "Incorrect selection of gcc version: expected %s.x, got %s\n" \
 			"$${expected_version}" "$${real_version}" ; \
 		exit 1 ; \
