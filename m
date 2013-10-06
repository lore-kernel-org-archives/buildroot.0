From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 20:48:15 +0200
Subject: [Buildroot] [git commit] Fix glibc dependency to gcc-intermediate
Message-ID: <20131006184900.957129B92E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0148cdd4dff1d34d4134b109d72fcc0f5e727de8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit ebc81933, we reverted 2babed4a, but meanwhile eglibc/ was
renamed glibc/ so rules eglibc-build must be renamed glibc-build to
correctly work.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 998bd0f..48ff0f7 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -29,7 +29,7 @@ GLIBC_DEPENDENCIES += host-gawk
 endif
 
 # Before (e)glibc is built, we must have the second stage cross-compiler
-eglibc-build: host-gcc-intermediate
+glibc-build: host-gcc-intermediate
 
 GLIBC_SUBDIR = build
 
