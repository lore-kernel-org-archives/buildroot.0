From: Paul Jones <paul@pauljones.id.au>
Date: Mon, 14 Jun 2010 23:13:48 +1000
Subject: [Buildroot] [PATCH] Add support for *.tbz2 package archives
Message-ID: <1276521228-8454-1-git-send-email-paul@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paul Jones <paul@pauljones.id.au>
---
 package/Makefile.package.in |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index cdf49f8..a2720d7 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -41,11 +41,12 @@ UPPERCASE = $(strip $(eval __tmp := $1) \
      $(__tmp))
 
 # Define extrators for different archive suffixes
-INFLATE.bz2 = $(BZCAT)
-INFLATE.gz  = $(ZCAT)
-INFLATE.tbz = $(BZCAT)
-INFLATE.tgz = $(ZCAT)
-INFLATE.tar = cat
+INFLATE.bz2  = $(BZCAT)
+INFLATE.gz   = $(ZCAT)
+INFLATE.tbz  = $(BZCAT)
+INFLATE.tbz2 = $(BZCAT)
+INFLATE.tgz  = $(ZCAT)
+INFLATE.tar  = cat
 
 # MESSAGE Macro -- display a message in bold type
 MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
-- 
1.7.0.4
