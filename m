From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Jun 2010 23:05:33 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile.package.in: Add
	support for *.tbz2 package archives
Message-ID: <20100623210706.866168188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=059f6bb68ac04f27857e8990bf8ca2deaa8a4681
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paul Jones <paul@pauljones.id.au>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index b702c49..2769707 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -56,11 +56,12 @@ define KCONFIG_DISABLE_OPT
 endef
 
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
1.7.1
