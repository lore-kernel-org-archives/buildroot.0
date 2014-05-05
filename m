From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 May 2014 23:52:57 +0200
Subject: [Buildroot] [git commit] package: add support for musl in tuple
Message-ID: <20140506081939.1BFE49C5E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7db35ffa811378b45e25eddeb7f084fe0387b4ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index c34a3bf..2fc3aa7 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -47,6 +47,8 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 LIBC=uclibc
+else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+LIBC=musl
 else
 LIBC=gnu
 endif
