From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jul 2014 23:28:14 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual: enhance doc for
	BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y
In-Reply-To: <cover.1406323367.git.yann.morin.1998@free.fr>
References: <cover.1406323367.git.yann.morin.1998@free.fr>
Message-ID: <f8aa686b6618867afc2725a276beb75a63e8ca12.1406323367.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y symbols can be used to denote the
lowest required kernel headers version, but also the highest supported
version. Document that.

Use the `...` construct instead of +...+ used eveywhere else, otherwise
asciidoc would render +<=+ to the ? arrow, while `...` does no rendering
at all.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-directory.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index c2f0a1a..93e6a3e 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -222,8 +222,8 @@ use in the comment.
 * Kernel headers
 ** Dependency symbol: +BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y+, (replace
    +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
-** Comment string: +headers >= X.Y+ (replace +X.Y+ with the
-   proper version)
+** Comment string: +headers >= X.Y+ and/or `headers <= X.Y` (replace
+   +X.Y+ with the proper version)
 
 * C library
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
-- 
1.9.1
