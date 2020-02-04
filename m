From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2020 17:15:19 +0100
Subject: [Buildroot] [git commit] utils/check-package: ignore ACLOCAL_PATH
Message-ID: <20200204160643.A2EAC8B55C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76772cefd83603380819a24eed5ac25f1cd343d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The aclocal program is provided by the automake package, so it makes
sense to define aclocal-related variables in automake.mk.

Add an exception to check-package to ignore that variable.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/checkpackagelib/lib_mk.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index b805cd9925..a0caf84636 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -225,6 +225,7 @@ class TypoInPackageVariable(_CheckFunction):
     ALLOWED = re.compile("|".join([
         "ACLOCAL_DIR",
         "ACLOCAL_HOST_DIR",
+        "ACLOCAL_PATH",
         "BR_CCACHE_INITIAL_SETUP",
         "BR_LIBC",
         "BR_NO_CHECK_HASH_FOR",
