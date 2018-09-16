From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:44:10 +0200
Subject: [Buildroot] [git commit] ipsec-tools: needs host-bison
Message-ID: <20180916134403.E9CB8882F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7dd5c78afa76be5165c6d392c2f9752dc7260776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Making all in racoon
/bin/sh ../../ylwrap cfparse.y y.tab.c cfparse.c y.tab.h `echo cfparse.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e s/c++$/h++/ -e s/c$/h/` y.output cfparse.output -- yacc -d
../../ylwrap: line 176: yacc: command not found
make[5]: *** [cfparse.c] Error 127

Fixes:
 - http://autobuild.buildroot.org/results/88c8bba943300df98b428646387c240f4522f40a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipsec-tools/ipsec-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index ddae9a75f3..8672272538 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -9,7 +9,7 @@ IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
 IPSEC_TOOLS_SITE = http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools/$(IPSEC_TOOLS_VERSION)
 IPSEC_TOOLS_INSTALL_STAGING = YES
 IPSEC_TOOLS_MAKE = $(MAKE1)
-IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
+IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex host-bison
 # we patch configure.ac
 IPSEC_TOOLS_AUTORECONF = YES
 
