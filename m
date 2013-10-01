From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:35:12 +0200
Subject: [Buildroot] [git commit] findutils: needs mmu
Message-ID: <20131001193835.62A6D9B902@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a8be43c338a547ae0af02c409e492970a65c083
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix below build error:

./libfindtools.a(pred.o): In function `launch':
pred.c:(.text+0x240c): undefined reference to `fork'
collect2: .ld returned 1 exit status/libfindtools.a
(pred.o): In function `launch':
pred.c:(.text+0x240c): undefined reference to `fork'
collect2: ld returned 1 exit status
make[4]: *** [oldfind] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: *** [find] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/findutils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/findutils/Config.in b/package/findutils/Config.in
index bbe2cc1..32e87c2 100644
--- a/package/findutils/Config.in
+++ b/package/findutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FINDUTILS
 	bool "findutils"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	help
 	  Basic directory searching utilities.  Provides the
 	  common 'find', 'xargs', 'locate', and 'updatedb' binaries.
