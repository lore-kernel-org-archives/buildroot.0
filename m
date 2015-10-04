From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2015 13:59:46 +0200
Subject: [Buildroot] [git commit] toolchain: Fix glibc breakage
Message-ID: <20151004120515.667AA81D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f59da855207b5e271f826f37e246b6e27b8c9d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduced by previous patch 0f75b2635ee564fbbdb9ea631cf39fa8731d6d6c,
this printf would break the build of glibc, because there is no format
to printf:

    printf: usage: printf [-v var] format [arguments]

Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index a4fa815..1452ec6 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -79,9 +79,7 @@ copy_toolchain_lib_root = \
 			fi ; \
 			LIBPATH="`readlink -f $${LIBPATH}`"; \
 		done; \
-	done; \
-\
-	printf
+	done
 
 #
 # Copy the full external toolchain sysroot directory to the staging
