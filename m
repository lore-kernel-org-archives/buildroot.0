From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 23:17:21 +0200
Subject: [Buildroot] [git commit] docs/manual: add musl to toolchain
	dependency options
Message-ID: <20140928212210.3530C9D6C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0e0bdcd880502007586073743e28da781fe8275
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we only document (e)glibc and uClibc as C libraries on which
we can depend. However, we've supported musl for quite some time now.

So, also refference it in the manual, when dealing with toolchain
options a package may have to depend on.

[Peter: order musl before uClibc]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index fd9460c..c145829 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -232,7 +232,7 @@ use in the comment.
 
 * C library
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
-   +BR2_TOOLCHAIN_USES_UCLIBC+
+   +BR2_TOOLCHAIN_USES_MUSL+, +BR2_TOOLCHAIN_USES_UCLIBC+
 ** Comment string: for the C library, a slightly different comment text
    is used: +foo needs an (e)glibc toolchain+, or `foo needs an (e)glibc
    toolchain w/ C++`
